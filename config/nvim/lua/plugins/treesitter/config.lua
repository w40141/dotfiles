local M = {}

function M.treesitter()
	local v = vim
	local joinpath = v.fs.joinpath
	local treesitter = require("nvim-treesitter")

	treesitter.setup({
		install_dir = joinpath(v.fn.stdpath("data"), "/treesitter"),
	})

	v.treesitter.language.register("bash", { "sh", "zsh" })
	v.treesitter.language.register("sway", { "swayconfig" })

	v.api.nvim_create_autocmd("FileType", {
		group = v.api.nvim_create_augroup("vim-treesitter-start", {}),
		callback = function()
			-- folds, provided by Neovim
			v.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			v.wo[0][0].foldmethod = "expr"
			-- indentation, provided by nvim-treesitter
			v.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			-- syntax highlighting, provided by Neovim
			pcall(v.treesitter.start)
		end,
	})
end

function M.treesitter_textobjects()
	require("nvim-treesitter-textobjects").setup({
		select = {
			lookahead = true,
		},
		move = {
			set_jumps = true,
		},
	}) -- :contentReference[oaicite:7]{index=7}
end

return M
