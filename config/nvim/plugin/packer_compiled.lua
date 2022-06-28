-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/daisuke_oku/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/daisuke_oku/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/daisuke_oku/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/daisuke_oku/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/daisuke_oku/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18rc.alpha-nvim\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18rc/bufferline\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vrc.coc\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["eskk.vim"] = {
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\frc.eskk\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/eskk.vim",
    url = "https://github.com/tyru/eskk.vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/gina.vim",
    url = "https://github.com/lambdalisue/gina.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16rc/gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["hlargs.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24rc/indent-blankline\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21rc.kanagawa-nvim\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vrc.lir\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/lir.nvim",
    url = "https://github.com/tamago324/lir.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15rc/lualine\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mini.nvim"] = {
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\frc.mini\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22rc.nvim-colorizer\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20rc.nvim-hlslens\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-notify"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-yati", "nvim-treesitter-textobjects", "hlargs.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-yati"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/nvim-yati",
    url = "https://github.com/yioneko/nvim-yati"
  },
  ["open-browser.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  previm = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/previm",
    url = "https://github.com/previm/previm"
  },
  ["rust.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["spelunker.vim"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/spelunker.vim",
    url = "https://github.com/kamykn/spelunker.vim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/startuptime.vim",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21rc.todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18rc/toggleterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["translate.vim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17rc.translate\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/translate.vim",
    url = "https://github.com/skanehira/translate.vim"
  },
  ["vim-better-whitespace"] = {
    commands = { "StripWhitespace" },
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29rc.vim-better-whitespace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-cursorword"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/vim-cursorword",
    url = "https://github.com/itchyny/vim-cursorword"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-expand-region"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-qfreplace"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/vim-qfreplace",
    url = "https://github.com/thinca/vim-qfreplace"
  },
  ["vim-quickhl"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19rc.vim-quickhl\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/vim-quickhl",
    url = "https://github.com/t9md/vim-quickhl"
  },
  ["vim-quickrun"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/vim-quickrun",
    url = "https://github.com/thinca/vim-quickrun"
  },
  ["vim-readme-viewer"] = {
    commands = { "PackerReadme" },
    config = { "\27LJ\2\nJ\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\16packer.nvim!readme_viewer#plugin_manager\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/vim-readme-viewer",
    url = "https://github.com/4513ECHO/vim-readme-viewer"
  },
  ["vim-rooter"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-silicon"] = {
    commands = { "Silicon" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/vim-silicon",
    url = "https://github.com/segeljakt/vim-silicon"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16rc.vim-test\frequire\0" },
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-uppercase-sql"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/vim-uppercase-sql",
    url = "https://github.com/jsborjesson/vim-uppercase-sql"
  },
  ["vimdoc-ja"] = {
    commands = { "help" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/vimdoc-ja",
    url = "https://github.com/vim-jp/vimdoc-ja"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rrc.vista\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  },
  winresizer = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/winresizer",
    url = "https://github.com/simeji/winresizer"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^notify"] = "nvim-notify"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: open-browser.vim
time([[Setup for open-browser.vim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20rc.open-browser\frequire\0", "setup", "open-browser.vim")
time([[Setup for open-browser.vim]], false)
time([[packadd for open-browser.vim]], true)
vim.cmd [[packadd open-browser.vim]]
time([[packadd for open-browser.vim]], false)
-- Setup for: rust.vim
time([[Setup for rust.vim]], true)
try_loadstring("\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\frc.rust\frequire\0", "setup", "rust.vim")
time([[Setup for rust.vim]], false)
-- Setup for: vim-expand-region
time([[Setup for vim-expand-region]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25rc.vim-expand-region\frequire\0", "setup", "vim-expand-region")
time([[Setup for vim-expand-region]], false)
time([[packadd for vim-expand-region]], true)
vim.cmd [[packadd vim-expand-region]]
time([[packadd for vim-expand-region]], false)
-- Setup for: previm
time([[Setup for previm]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14rc.previm\frequire\0", "setup", "previm")
time([[Setup for previm]], false)
-- Setup for: vim-rooter
time([[Setup for vim-rooter]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18rc.vim-rooter\frequire\0", "setup", "vim-rooter")
time([[Setup for vim-rooter]], false)
time([[packadd for vim-rooter]], true)
vim.cmd [[packadd vim-rooter]]
time([[packadd for vim-rooter]], false)
-- Setup for: winresizer
time([[Setup for winresizer]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18rc.winresizer\frequire\0", "setup", "winresizer")
time([[Setup for winresizer]], false)
time([[packadd for winresizer]], true)
vim.cmd [[packadd winresizer]]
time([[packadd for winresizer]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15rc/lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24rc/indent-blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18rc/bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\frc.mini\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16rc.vim-test\frequire\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20rc.nvim-hlslens\frequire\0", "config", "nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21rc.kanagawa-nvim\frequire\0", "config", "kanagawa.nvim")
time([[Config for kanagawa.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22rc.nvim-colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: translate.vim
time([[Config for translate.vim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17rc.translate\frequire\0", "config", "translate.vim")
time([[Config for translate.vim]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vrc.lir\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18rc.alpha-nvim\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18rc/treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-quickhl
time([[Config for vim-quickhl]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19rc.vim-quickhl\frequire\0", "config", "vim-quickhl")
time([[Config for vim-quickhl]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-yati ]]
vim.cmd [[ packadd hlargs.nvim ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file help lua require("packer.load")({'vimdoc-ja'}, { cmd = "help", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Silicon lua require("packer.load")({'vim-silicon'}, { cmd = "Silicon", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerReadme lua require("packer.load")({'vim-readme-viewer'}, { cmd = "PackerReadme", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'goyo.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StripWhitespace lua require("packer.load")({'vim-better-whitespace'}, { cmd = "StripWhitespace", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'previm'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType sql ++once lua require("packer.load")({'vim-uppercase-sql'}, { ft = "sql" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'gitsigns.nvim', 'todo-comments.nvim', 'toggleterm.nvim', 'coc.nvim', 'vista.vim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'eskk.vim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /Users/daisuke_oku/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
