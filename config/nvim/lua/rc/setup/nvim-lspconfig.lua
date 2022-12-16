return {
	function()
		local v = vim
		local key = v.keymap.set

		local function d(name)
			return function()
				return v.diagnostic[name]()
			end
		end

		local function b(name)
			return function()
				return v.lsp.buf[name]()
			end
		end

		-- https://neovim.io/doc/user/diagnostic.html#diagnostic-api
		key("n", "[dev]o", d "open_float")
		key("n", "]g", d "goto_next")
		key("n", "[g", d "goto_prev")
		key("n", "[dev]q", d "setloclist")

		-- https://neovim.io/doc/user/lsp.html#lsp-buf
		key("n", "H", b "hover")
		key("n", "[dev]f", b "format")
		key("n", "[dev]r", b "references")
		key("n", "[dev]d", b "definition")
		key("n", "[dev]D", b "declaration")
		key("n", "[dev]i", b "implementation")
		key("n", "[dev]t", b "type_definition")
		key("n", "[dev]n", b "rename")
		key("n", "[dev]a", b "code_action")
		key("n", "[dev]s", b "signature_help")
		key("n", "[dev]wa", b "add_workspace_folder")
		key("n", "[dev]wr", b "remove_workspace_folder")
		key("n", "[dev]wl", function()
			print(v.inspect(b "list_workspace_folders"))
		end)
	end
}
