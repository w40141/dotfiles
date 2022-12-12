local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Banner
dashboard.section.header.val = {
	"                                                    ",
	" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                    ",
}

-- Menu
dashboard.section.buttons.val = {
	dashboard.button("e", " New file", ":ene <BAR> startinsert<CR>"),
	dashboard.button("f", " Find file", ":<c-u>Telescope git_files<CR>"),
	dashboard.button("g", " Find word", ":<c-u>Telescope live_grep<CR>"),
	dashboard.button("o", "פּ Open explorer", ":lua require'lir.float'.toggle()<cr>"),
	dashboard.button("s", " Settings", ":e $MYVIMRC<CR>"),
	dashboard.button("c", "﫵Check health", ":checkhealth<cr>"),
	dashboard.button("u", " Update plugins", ":PackerSync<CR>"),
	dashboard.button("m", " Open Mason Maneger", ":MasonToolsUpdate<CR>"),
	dashboard.button("t", " Measure time", ":StartupTime<CR>"),
	dashboard.button("q", " Quit", ":qa<CR>"),
}

-- Footer
local function footer()
	local version = vim.version()
	local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
	local datetime = os.date("%Y/%m/%d %H:%M:%S")

	return print_version .. " " .. datetime
end

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
