-- TODO: https://github.com/uga-rosa/ccc.nvim
-- TODO: https://github.com/kkharji/lspsaga.nvim
-- TODO: https://github.com/stevearc/dressing.nvim
-- TODO: https://github.com/utilyre/barbecue.nvim
-- TODO: https://github.com/folke/noice.nvim
-- TODO: https://github.com/MunifTanjim/nui.nvim
-- TODO: https://github.com/rcarriga/nvim-notify
-- TODO: https://github.com/Bekaboo/dropbar.nvim
-- TODO: https://github.com/hrsh7th/vim-eft

local gl = require("core.global")
local v = gl.v
local fn = gl.fn
local uv = gl.uv
local command = gl.command

local Pack = {}

Pack.new = function()
	local self = setmetatable({ initialized = false, _packer = nil }, { __index = Pack })
	self:assume_plugins()
	self:setup()
	return self
end

function Pack:run_packer(method)
	return function(opts)
		self:packer()[method](opts)
	end
end

function Pack:setup()
	command("PackerInstall", self:run_packer("install"), { desc = "[Packer] Install plugins" })
	command("PackerUpdate", self:run_packer("update"), { desc = "[Packer] Update plugins" })
	command("PackerClean", self:run_packer("clean"), { desc = "[Packer] Clean plugins" })
	command("PackerStatus", self:run_packer("status"), { desc = "[Packer] Output plugins status" })
	command("PackerSync", self:run_packer("sync"), { desc = "[Packer] Output plugins status" })
	command("PackerCompile", self:run_packer("compile"), { desc = "[Packer] Output plugins status", nargs = "*" })
	command("PackerLoad", function(opts)
		local args = v.split(opts.args, " ")
		table.insert(args, opts.bang)
		self:run_packer("loader")(table.unpack(opts))
	end, { bang = true, complete = self:run_packer("loader_complete"), desc = "[Packer] Load plugins", nargs = "+" })
end

function Pack:exists(path)
	local st = uv.fs_stat(path)
	return st and true or false
end

function Pack:assume_plugins()
	local data_dir = fn.stdpath("data")
	for _, p in ipairs({
		{ "wbthomason/packer.nvim", opt = true },
	}) do
		local dir = p.opt and "opt" or "start"
		local pkg = p[1]
		local branch = p.branch or "master"
		local name = pkg:match("[^/]+$")
		local path = ("%s/site/pack/packer/%s/%s"):format(data_dir, dir, name)
		if not self:exists(path) then
			v.cmd(("!git clone https://github.com/%s %s -b %s"):format(pkg, path, branch))
		end
	end
end

function Pack:packer()
	if not self._packer then
		v.cmd.packadd([[packer.nvim]])
		local packer = require("packer")
		packer.init({
			compile_path = self.compile_path,
			compile_on_sync = true,
			profile = { enable = false, threshold = 1 },
			disable_commands = true,
		})
		packer.reset()
		packer.use(require("modules.start"))
		packer.use(require("modules.complement"))
		packer.use(require("modules.lsp"))
		packer.use(require("modules.edit"))
		packer.use(require("modules.tool"))
		packer.use(require("modules.treesitter"))
		packer.use(require("modules.fzf"))
		packer.use(require("modules.ui"))
		packer.use(require("modules.lang"))
		packer.use(require("modules.misc"))
		self._packer = packer
	end
	return self._packer
end

return Pack.new()
