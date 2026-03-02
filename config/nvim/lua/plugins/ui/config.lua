local M = {}

local v = vim

function M.alpha()
	local d = require("alpha.themes.dashboard")

	-- Banner
	d.section.header.val = {
		"                                                    ",
		" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
		" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
		" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
		" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
		" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
		" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
		"                                                    ",
	}
	d.section.header.opts.hl = "AlphaHeader"

	-- Menu
	d.section.buttons.val = {
		d.button("e", "󰝒 New file", ":ene <bar> startinsert<cr>"),
		d.button("f", "󰱼 Find file", "<cmd>Telescope find_files<cr>"),
		d.button("g", "󱎸 Find word", "<cmd>Telescope live_grep<cr>"),
		d.button("t", "󰄲 Find TODO", "<cmd>TodoTelescope<cr>"),
		d.button("o", "󰌀 Open explorer", "<cmd>NvimTreeToggle<cr>"),
		d.button("c", "󰓙 Check health", "<cmd>checkhealth<cr>"),
		d.button("u", "󰚰 Update plugins", "<cmd>Lazy sync<cr>"),
		d.button("l", "󰏓 Open Package Maneger", "<cmd>Lazy<cr>"),
		d.button("m", "󰌱 Open Mason Maneger", "<cmd>Mason<cr>"),
		d.button("T", "󱫠 Measure time", "<cmd>StartupTime<cr>"),
		d.button("M", "󱩧 New Memo", ":MemoNew<cr>"),
		d.button("q", "󰩈 Quit", "<cmd>qa<cr>"),
	}
	d.section.buttons.opts.hl = "AlphaButtons"

	-- Footer
	local function footer()
		local ver = v.version()
		local version = "v" .. ver.major .. "." .. ver.minor .. "." .. ver.patch
		local datetime = os.date("%Y/%m/%d %H:%M:%S")

		return version .. " " .. datetime
	end

	d.section.footer.val = footer()
	d.section.footer.opts.hl = "AlphaFooter"

	require("alpha").setup(d.config)
end

function M.tree()
	local api = require("nvim-tree.api")
	local key = v.keymap.set

	local function on_attach(bufnr)
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		-- api.config.mappings.default_on_attach(bufnr)
    api.map.on_attach.default(bufnr)

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
