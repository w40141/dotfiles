local M = {}

function M.lspconfig()
	local v = vim
	local key = v.keymap.set

	local function d(name)
		return function()
			return v.diagnostic[name]()
		end
	end

	key("n", "[dev]o", d("open_float"), { desc = "Open Float" })
	key("n", "]g", d("goto_next"), { desc = "Go to Next" })
	key("n", "[g", d("goto_prev"), { desc = "Go to Previous" })
	key("n", "[dev]q", d("setloclist"), { desc = "Set Location List" })

	local function b(name)
		return function()
			return v.lsp.buf[name]()
		end
	end

	key("n", "[dev]r", b("references"), { desc = "Go to references" })
	key("n", "[dev]d", b("definition"), { desc = "Go to definition" })
	key("n", "[dev]D", b("declaration"), { desc = "Go to declaration" })
	key("n", "[dev]i", b("implementation"), { desc = "Go to implementation" })
	key("n", "[dev]t", b("type_definition"), { desc = "Go to type definition" })
	key("n", "[dev]n", b("rename"), { desc = "Rename variable" })
	key("n", "[dev]s", b("signature_help"), { desc = "Signature help" })
	key("n", "[dev]wa", b("add_workspace_folder"), { desc = "Add workspace folder" })
	key("n", "[dev]wr", b("remove_workspace_folder"), { desc = "Remove workspace folder" })
	key("n", "[dev]wl", function()
		print(v.inspect(b("list_workspace_folders")))
	end, { desc = "List workspace folders" })
	key({ "n", "v" }, "[dev]a", b("code_action"), { desc = "Code action" })
end

return M
