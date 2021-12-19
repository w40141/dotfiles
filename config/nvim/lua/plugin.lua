-- On ly required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
    -- TODO: Maybe handle windows better?
    if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
        return
    end

    local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
    )

    vim.fn.mkdir(directory, 'p')

    local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
    ))

    print(out)
    print("Downloading packer.nvim...")

    return
end

return require('packer').startup(
function(use)
    -- Packer can manage itself
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    if packer_bootstrap then
        require('packer').sync()
    end
end
)

vim.cmd([[command! PackerInstall packadd packer.nvim | lua require'packers'.install()]])
vim.cmd([[command! PackerUpdate packadd packer.nvim | lua require'packers'.update()]])
vim.cmd([[command! PackerSync packadd packer.nvim | lua require'packers'.sync()]])
vim.cmd([[command! PackerClean packadd packer.nvim | lua require'packers'.clean()]])
vim.cmd([[command! PackerCompile packadd packer.nvim | lua require'packers'.compile()]])
-- vim.cmd('packadd packer.nvim')
-- vim.cmd('augroup packer_user_config')
-- vim.cmd('autocmd!')
-- vim.cmd('autocmd BufWritePost plugins.lua source <afile> | PackerCompile')
-- vim.cmd('augroup end')
