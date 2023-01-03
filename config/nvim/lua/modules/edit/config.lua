local M = {}

function M.todo_comments()
	require("todo-comments").setup({
		signs = true,
		sign_priority = 8,
		keywords = {
			FIX = {
				icon = " ",
				color = "error",
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
			},
			TODO = { icon = "", color = "info" },
			HACK = { icon = "", color = "warning" },
			WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = "", color = "hint", alt = { "INFO" } },
		},
		merge_keywords = true,
		highlight = {
			before = "",
			keyword = "wide",
			after = "",
			pattern = [[.*<(KEYWORDS)\s*:]],
			comments_only = true,
			max_line_len = 400,
			exclude = {},
		},
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#10B981" },
			default = { "Identifier", "#7C3AED" },
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			pattern = [[\b(KEYWORDS):]],
		},
	})
end

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
		sources = {
			builtins.code_actions.cspell,
			builtins.code_actions.gitsigns,
			builtins.code_actions.refactoring,
			builtins.completion.luasnip,
			builtins.diagnostics.fish,
			builtins.diagnostics.credo,
			builtins.diagnostics.editorconfig_checker.with({
				condition = function()
					return exe("ec") > 0
				end,
			}),
			builtins.diagnostics.eslint.with({
				condition = function()
					return exe("eslint") > 0
				end,
			}),
			builtins.diagnostics.shellcheck.with({
				condition = function()
					return exe("shellcheck") > 0
				end,
			}),
			builtins.diagnostics.cspell.with({
				diagnostics_postprocess = function(diagnostic)
					diagnostic.severity = v.diagnostic.severity["WARN"]
				end,
				condition = function()
					return exe("cspell") > 0
				end,
				extra_args = { "--config", cspell_files.config },
			}),
			builtins.diagnostics.vale.with({
				diagnostics_postprocess = function(diagnostic)
					diagnostic.severity = v.diagnostic.severity["WARN"]
				end,
				condition = function()
					return exe("vale") > 0
				end,
			}),
			builtins.formatting.trim_whitespace,
			builtins.formatting.stylua.with({
				condition = function()
					return exe("stylua") > 0
				end,
			}),
			builtins.formatting.black.with({
				condition = function()
					return exe("black") > 0
				end,
			}),
			builtins.formatting.rustfmt.with({
				condition = function()
					return exe("rustfmt") > 0
				end,
			}),
			builtins.formatting.deno_fmt.with({
				condition = function(utils)
					return not (
						utils.has_file({
							".prettierrc",
							".prettierrc.js",
							"deno.json",
							"deno.jsonc",
						})
					)
				end,
			}),
			builtins.formatting.prettier.with({
				condition = function(utils)
					return utils.has_file({ ".prettierrc", ".prettierrc.js" })
				end,
				prefer_local = "node_modules/.bin",
			}),
			builtins.formatting.shfmt.with({
				condition = function()
					return exe("shfmt") > 0
				end,
			}),
			builtins.formatting.fish_indent,
			builtins.formatting.markdownlint.with({
				condition = function()
					return exe("markdownlint") > 0
				end,
			}),
		},
	})
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

return M
