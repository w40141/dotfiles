return {
	function()
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
						return not (utils.has_file({ ".prettierrc", ".prettierrc.js", "deno.json", "deno.jsonc" }))
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
	end,
}
