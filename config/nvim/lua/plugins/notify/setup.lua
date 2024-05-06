local M = {}

function M.noice()
	local v = vim
	if not _G.__vim_notify_overwritten then
		v.notify = function(...)
			local args = { ... }
			require("notify")
			require("noice")
			v.schedule(function()
				v.notify(unpack(args))
			end)
		end
		_G.__vim_notify_overwritten = true
	end
end

return M
