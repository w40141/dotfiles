return {
	function()
		local v = vim
		local augroup = v.api.nvim_create_augroup -- Create/get autocommand group
		local autocmd = v.api.nvim_create_autocmd

		require('mason-tool-installer').setup {
			ensure_installed = {
				"bash-language-server",
				"black",
				"dockerfile-language-server",
				"eslint-lsp",
				"flake8",
				"graphql-language-service-cli",
				"html-lsp",
				"jdtls",
				"kotlin-language-server",
				"lua-language-server",
				"marksman",
				"prettier",
				"pyright",
				"rust-analyzer",
				"rustfmt",
				"shfmt",
				"typescript-language-server",
				"yaml-language-server",
			},
			auto_update = true,
			run_on_start = true,
			start_delay = 3000, -- 3 second delay
		}

		local m = augroup("Mason", {})
		autocmd('User', {
			pattern = 'MasonToolsUpdateCompleted',
			callback = function()
				v.schedule(function()
					print 'mason-tool-installer has finished'
				end)
			end,
			group = m,
		})
	end
}
