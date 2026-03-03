local v = vim
local api = v.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

local my = augroup("MyAutoCmd", { clear = true })

autocmd("FileType", {
	group = my,
	pattern = "*",
	callback = function()
		-- formatoptions から c r o を外す（自動コメント継続を殺す）
		v.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
-- -- Don't auto commenting new lines
-- autocmd("BufEnter", {
-- 	pattern = "*",
-- 	command = "set fo-=c fo-=r fo-=o",
-- 	group = myAutoCmd,
-- })
--
-- local memoAutoCommit = augroup("MemoAutoCommit", { clear = true })
-- local pattern = "*/vault/**.md"
--
-- autocmd("VimLeave", {
-- 	pattern = pattern,
-- 	command = "MemoCommit",
-- 	group = memoAutoCommit,
-- })
