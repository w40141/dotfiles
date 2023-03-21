local M = {}

function M.neogen()
  require("neogen").setup({
    snippet_engine = "luasnip",
    enabled = true,
    input_after_comment = true,
  })
end

function M.surround()
  require("surround").setup({
    context_offset = 100,
    load_autogroups = false,
    mappings_style = "sandwich",
    map_insert_mode = true,
    quotes = { "'", '"' },
    brackets = { "(", "{", "[" },
    space_on_closing_char = false,
    pairs = {
      nestable = {
        b = { "(", ")" },
        s = { "[", "]" },
        B = { "{", "}" },
        a = { "<", ">" },
      },
      linear = {
        q = { "'", "'" },
        t = { "`", "`" },
        d = { '"', '"' },
      },
    },
    prefix = "s",
  })
end

function M.null_ls()
  local v = vim
  local fn = v.fn
  local api = v.api
  local exe = fn.executable
  local call = v.call
  local cspell_config_dir = "$XDG_CONFIG_HOME/cspell"
  local cspell_data_dir = "$XDG_DATA_HOME/cspell"

  local cspell_files = {
    config = call("expand", cspell_config_dir .. "/cspell.json"),
    dotfiles = call("expand", cspell_config_dir .. "/dotfiles.txt"),
    vim = call("expand", cspell_data_dir .. "/vim.txt.gz"),
    user = call("expand", cspell_data_dir .. "/user.txt"),
  }

  if fn.exists(cspell_data_dir) ~= 1 then
    io.popen("mkdir -p " .. cspell_data_dir)
  end

  if fn.filereadable(cspell_files.dotfiles) ~= 1 then
    io.popen("touch " .. cspell_files.dotfiles)
  end

  -- vim辞書がなければダウンロード
  if fn.filereadable(cspell_files.vim) ~= 1 then
    local url = "https://github.com/iamcco/coc-spell-checker/raw/master/dicts/vim/vim.txt.gz"
    io.popen("curl -fsSLo " .. cspell_files.vim .. " --create-dirs " .. url)
  end

  -- ユーザー辞書がなければ作成
  if fn.filereadable(cspell_files.user) ~= 1 then
    io.popen("touch " .. cspell_files.user)
  end

  local null_ls = require("null-ls")
  local builtins = require("null-ls.builtins")
  null_ls.setup({
    diagnostics_format = "#{m} (#{s}: #{c})",
    sources = {
      builtins.code_actions.cspell,
      builtins.code_actions.gitsigns,
      builtins.code_actions.eslint.with({
        prefer_local = "node_modules/.bin",
      }),
      builtins.completion.spell,
      builtins.diagnostics.fish,
      builtins.diagnostics.credo,
      builtins.diagnostics.editorconfig_checker,
      builtins.diagnostics.eslint.with({
        prefer_local = "node_modules/.bin",
      }),
      builtins.diagnostics.textlint.with({
        filetypes = { "markdown" },
        prefer_local = "node_modules/.bin",
      }),
      builtins.diagnostics.cspell.with({
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = v.diagnostic.severity["WARN"]
        end,
        extra_args = { "--config", cspell_files.config },
      }),
      builtins.diagnostics.ruff,
      builtins.diagnostics.vale.with({
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = v.diagnostic.severity["WARN"]
        end,
      }),
      builtins.formatting.sql_formatter,
      builtins.formatting.eslint.with({
        prefer_local = "node_modules/.bin",
      }),
      builtins.formatting.prettier.with({
        condition = function(utils)
          return utils.has_file({ ".prettierrc", ".prettierrc.js" })
        end,
        prefer_local = "node_modules/.bin",
      }),
      builtins.formatting.yamlfmt,
      builtins.formatting.stylua,
      builtins.formatting.black,
      builtins.formatting.rustfmt,
      builtins.formatting.shfmt,
      builtins.formatting.fish_indent,
      builtins.formatting.markdownlint,
    },
  })

  local cspell_append = function(opts)
    local word = opts.args
    if not word or word == "" then
      -- 引数がなければcwordを取得
      word = v.call("expand", "<cword>"):lower()
    end

    -- bangの有無で保存先を分岐
    local dictionary_name = opts.bang and "dotfiles" or "user"

    -- shellのechoコマンドで辞書ファイルに追記
    io.popen("echo " .. word .. " >> " .. cspell_files[dictionary_name])

    -- 追加した単語および辞書を表示
    v.notify('"' .. word .. '" is appended to ' .. dictionary_name .. " dictionary.", v.log.levels.INFO, {})

    -- cspellをリロードするため、現在行を更新してすぐ戻す
    if api.nvim_get_option_value("modifiable", {}) then
      api.nvim_set_current_line(api.nvim_get_current_line())
      api.nvim_command("silent! undo")
    end
  end

  api.nvim_create_user_command("CSpellAppend", cspell_append, { nargs = "?", bang = true })

  local cspell_custom_actions = {
    name = "append-to-cspell-dictionary",
    method = null_ls.methods.CODE_ACTION,
    filetypes = {},
    generator = {
      fn = function(_)
        -- 現在のカーソル位置
        local lnum = fn.getcurpos()[2] - 1
        local col = fn.getcurpos()[3]

        -- 現在行のエラーメッセージ一覧
        local diagnostics = v.diagnostic.get(0, { lnum = lnum })

        -- カーソル位置にcspellの警告が出ているか探索
        local word = ""
        local regex = "^Unknown word %((%w+)%)$"
        for _, va in pairs(diagnostics) do
          if
              va.source == "cspell"
              and va.col < col
              and col <= va.end_col
              and string.match(va.message, regex)
          then
            -- 見つかった場合、単語を抽出
            word = string.gsub(va.message, regex, "%1"):lower()
            break
          end
        end

        -- 警告が見つからなければ終了
        if word == "" then
          return
        end

        -- cspell_appendを呼び出すactionのリストを返却
        return {
          {
            title = 'Append "' .. word .. '" to user dictionary',
            action = function()
              cspell_append({ args = word })
            end,
          },
          {
            title = 'Append "' .. word .. '" to dotfiles dictionary',
            action = function()
              cspell_append({ args = word, bang = true })
            end,
          },
        }
      end,
    },
  }

  -- null_lsに登録
  null_ls.register(cspell_custom_actions)
end

function M.eskk()
  local g = vim.g
  g["toggle_markdown_eskk"] = 1
  g["eskk#directory"] = "$XDG_CONFIG_HOME/skk"
  g["eskk#dictionary"] = {
    path = "$XDG_CONFIG_HOME/skk/my_jisyo",
    sorted = 1,
    encoding = "utf-8",
  }
  g["eskk#large_dictionary"] = {
    path = "$XDG_CONFIG_HOME/skk/SKK-JISYO.L",
    sorted = 1,
    encoding = "utf-8",
  }

  -- 漢字変換した時に候補が1つの場合、自動的に確定する
  g["eskk#kakutei_when_unique_candidate"] = 1
  -- neocompleteを入れないと、1にすると動作しなくなるため0推奨
  g["eskk#enable_completion"] = 0
  -- デフォルトのマッピングを削除
  g["eskk#no_default_mappings"] = 1
  -- ノーマルモードに戻るとeskkモードを初期値にする
  g["eskk#keep_state"] = 0
  -- 漢字変換を確定しても改行しない。
  g["eskk#egg_like_newline"] = 1
  g["eskk#log_cmdline_level"] = 3

  -- 表示文字を変更
  g["eskk#marker_henkan"] = "[変換]"
  g["eskk#marker_henkan_select"] = "[選択]"
  g["eskk#marker_okuri"] = "[送り]"
  g["eskk#marker_jisyo_touroku"] = "[辞書]"
end

function M.comment()
  require("Comment").setup()
end

function M.colorizer()
  require("colorizer").setup()
end

function M.yanky()
  require("dressing").setup()
  require("yanky").setup({
    ring = {
      history_length = 100,
      storage = "shada",
      sync_with_numbered_registers = true,
      cancel_event = "update",
    },
    system_clipboard = {
      sync_with_ring = true,
    },
  })
end

return M
