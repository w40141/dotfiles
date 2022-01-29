-- On ly required if you have packer in your `opt` pack

local cmd = vim.cmd
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then

    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

cmd([[command! PackerInstall packadd packer.nvim | lua require'packers'.install()]])
cmd([[command! PackerUpdate packadd packer.nvim | lua require'packers'.update()]])
cmd([[command! PackerSync packadd packer.nvim | lua require'packers'.sync()]])
cmd([[command! PackerClean packadd packer.nvim | lua require'packers'.clean()]])
cmd([[command! PackerCompile packadd packer.nvim | lua require'packers'.compile()]])
-- vim.cmd('packadd packer.nvim')
-- vim.cmd('augroup packer_user_config')
-- vim.cmd('autocmd!')
-- vim.cmd('autocmd BufWritePost plugins.lua source <afile> | PackerCompile')
-- vim.cmd('augroup end')

-- local packer_exists = pcall(cmd, [[packadd packer.nvim]])
--
-- if not packer_exists then
--     -- TODO: Maybe handle windows better?
--     if fn.input("Download Packer? (y for yes)") ~= "y" then
--         return
--     end
--
--     local directory = string.format(
--     '%s/site/pack/packer/opt/',
--     fn.stdpath('data')
--     )
--
--     fn.mkdir(directory, 'p')
--
--     local out = fn.system(string.format(
--     'git clone %s %s',
--     'https://github.com/wbthomason/packer.nvim',
--     directory .. '/packer.nvim'
--     ))
--
--     print(out)
--     print("Downloading packer.nvim...")
--
--     return
-- end
--
-- return require('packer').startup(
-- function(use)
--     -- Packer can manage itself
--     -- Packer can manage itself as an optional plugin
--     use {'wbthomason/packer.nvim', opt = true}
--
--     if packer_bootstrap then
--         require('packer').sync()
--     end
-- end
-- )
