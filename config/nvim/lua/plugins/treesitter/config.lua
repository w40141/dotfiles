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
			local ok = pcall(v.treesitter.start)
			if not ok then
				return
			end

			v.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			v.wo.foldmethod = "expr"
			v.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
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
