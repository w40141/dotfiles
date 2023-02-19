local M = {}

function M.lspconfig()
  local v = vim
  local key = v.keymap.set

  local function b(name)
    return function()
      return v.lsp.buf[name]()
    end
  end

  local function d(name)
    return function()
      return v.diagnostic[name]()
    end
  end

  -- https://neovim.io/doc/user/diagnostic.html#diagnostic-api
  key("n", "[dev]o", d("open_float"))
  key("n", "]g", d("goto_next"))
  key("n", "[g", d("goto_prev"))
  key("n", "[dev]q", d("setloclist"))
  -- local opts = { noremap = true, silent = true, buffer = bufnr }
  -- https://neovim.io/doc/user/lsp.html#lsp-buf
  key("n", "H", b("hover"))
  key("n", "[dev]f", b("format"))
  key("n", "[dev]r", b("references"))
  key("n", "[dev]d", b("definition"))
  key("n", "[dev]D", b("declaration"))
  key("n", "[dev]i", b("implementation"))
  key("n", "[dev]t", b("type_definition"))
  key("n", "[dev]n", b("rename"))
  key("n", "[dev]a", b("code_action"))
  key("n", "[dev]s", b("signature_help"))
  key("n", "[dev]wa", b("add_workspace_folder"))
  key("n", "[dev]wr", b("remove_workspace_folder"))
  key("n", "[dev]wl", function()
    print(v.inspect(b("list_workspace_folders")))
  end)
end

function M.lspsaga()
  local key = vim.keymap.set
  key("n", "[tr]n", "<cmd>Lspsaga rename<cr>")
  key("n", "[tr]a", "<cmd>Lspsaga code_action<cr>")
  -- key("x", "M", ":<c-u>Lspsaga range_code_action<cr>", { silent = true, noremap = true })
  key("n", "H", "<cmd>Lspsaga hover_doc<cr>")
  key("n", "[tr]o", "<cmd>Lspsaga show_line_diagnostics<cr>")
  key("n", "]g", "<cmd>Lspsaga diagnostic_jump_next<cr>")
  key("n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
  key("n", "[tr]f", "<cmd>Lspsaga lsp_finder<CR>")
  key("n", "[tr]s", "<Cmd>Lspsaga signature_help<CR>")
  key("n", "[tr]d", "<cmd>Lspsaga preview_definition<CR>")
  -- key("n", "[dev]o", "<cmd>LSoutlineToggle<CR>")
end

return M
