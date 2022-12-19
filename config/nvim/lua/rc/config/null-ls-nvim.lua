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
				builtins.diagnostics.credo,
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
				-- rust-analyzer
				builtins.formatting.rustfmt,
				builtins.formatting.prettier.with({
					condition = function()
						return exe("prettier") > 0
					end,
				}),
				builtins.diagnostics.eslint.with({
					condition = function()
						return exe("eslint") > 0
					end,
				}),
				builtins.formatting.shfmt.with({
					condition = function()
						return exe("shfmt") > 0
					end,
				}),
				builtins.diagnostics.shellcheck.with({
					condition = function()
						return exe("shellcheck") > 0
					end,
				}),
				builtins.diagnostics.editorconfig_checker.with({
					condition = function()
						return exe("ec") > 0
					end,
				}),
				builtins.code_actions.cspell,
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
				builtins.formatting.markdownlint.with({
					condition = function()
						return exe("markdownlint") > 0
					end,
				}),
				builtins.code_actions.gitsigns,
				builtins.code_actions.refactoring,
			},
		})
	end,
}
