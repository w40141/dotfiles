return {
	function()
		local key = vim.keymap.set
		local rt = require("rust-tools")
		rt.setup({
			server = {
				on_attach = function(_, bufnr)
					-- Hover actions
					key("n", "H", rt.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					key("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
			},
		})
	end
}