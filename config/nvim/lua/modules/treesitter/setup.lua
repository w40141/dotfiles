local M = {}

function M.treehopper()
  local key = vim.keymap.set
  local function t(name)
    return function()
      return require("tsht")[name]()
    end
  end

  key("o", [['t]], t("nodes"), { remap = true })
  key("x", [['t]], t("nodes"))
end

return M
