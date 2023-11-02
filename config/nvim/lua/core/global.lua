local global = {}

function global:new()
	self.v = vim
	self.g = self.v.g
	self.fn = self.v.fn
	self.uv = self.v.loop
	self.api = self.v.api
	self.key = self.v.keymap.set
	self.opt = self.v.opt
	self.command = self.api.nvim_create_user_command
	self.augroup = self.api.nvim_create_augroup
	self.autocmd = self.api.nvim_create_autocmd
end

function global:load_variables()
	local os_name = self.uv.os_uname().sysname
	self.is_mac = os_name == "Darwin"
	self.is_linux = os_name == "Linux"
	self.is_windows = os_name == "Windows_NT"
	self.is_wsl = self.fn.has("wsl") == 1
	self.vim_path = self.fn.stdpath("config")
	local path_sep = self.is_windows and "\\" or "/"
	local home = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
	self.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
	self.modules_dir = self.vim_path .. path_sep .. "modules"
	self.home = home
	self.data_dir = string.format("%s/site/", self.fn.stdpath("data"))
end

global:new()
global:load_variables()

return global
