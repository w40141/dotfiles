return {
	function()
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

		-- Menu
		d.section.buttons.val = {
			d.button("e", " New file", ":ene <BAR> startinsert<CR>"),
			d.button("f", " Find file", ":<c-u>Telescope find_files<CR>"),
			d.button("g", " Find word", ":<c-u>Telescope live_grep<CR>"),
			d.button("o", "פּ Open explorer", ":<c-u>lua require'lir.float'.toggle()<cr>"),
			d.button("s", " Settings", ":e $MYVIMRC<CR>"),
			d.button("c", "﫵Check health", ":checkhealth<cr>"),
			d.button("u", " Update plugins", ":PackerSync<CR>"),
			d.button("m", " Open Mason Maneger", ":MasonToolsUpdate<CR>"),
			d.button("t", " Measure time", ":StartupTime<CR>"),
			d.button("q", " Quit", ":qa<CR>"),
		}

		-- Footer
		local function footer()
			local v = vim.version()
			local version = "v" .. v.major .. "." .. v.minor .. "." .. v.patch
			local datetime = os.date("%Y/%m/%d %H:%M:%S")

			return version .. " " .. datetime
		end

		d.section.footer.val = footer()

		require("alpha").setup(d.config)
	end
}
