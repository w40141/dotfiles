local M = {}

function M.tree()
	local api = require("nvim-tree.api")
	local key = vim.keymap.set

	local function on_attach(bufnr)
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		api.config.mappings.default_on_attach(bufnr)

		key("n", "l", api.tree.change_root_to_node, opts("CD"))
		key("n", "h", api.tree.change_root_to_parent, opts("Up"))
		key("n", "<C-s>", api.node.open.vertical, opts("Open: Vertical Split"))
		key("n", "?", api.tree.toggle_help, opts("Help"))
		key("n", "sl", "<C-w>w", opts("Back Display"))
	end

	require("nvim-tree").setup({
		sort_by = "case_sensitive",
		on_attach = on_attach,
		view = {
			adaptive_size = true,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false,
		},
	})
end

return M
