local jdtls_ok, jdtls = pcall(require, "jdtls")
local v = vim
local fn = v.fn
local api = v.api
local augroup = api.nvim_create_augroup -- Create/get autocommand group
local autocmd = api.nvim_create_autocmd -- Create autocommand
local hl = api.nvim_set_hl
local lsp = v.lsp
local buf = lsp.buf

if not jdtls_ok then
	v.notify "JDTLS not found, install with `:LspInstall jdtls`"
	return
end

-- Installation location of jdtls by nvim-lsp-installer
local JDTLS_LOCATION = "$XDG_DATA_HOME/nvim/mason/bin/jdtls"

-- Data directory - change it to your liking
local HOME = os.getenv "HOME"
local WORKSPACE_PATH = HOME .. "/workspace/java/"

-- Debugger installation location
local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim"

-- Only for Linux and Mac
local SYSTEM = "linux"
if fn.has "mac" == 1 then
	SYSTEM = "mac"
end

local project_name = fn.fnamemodify(fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. project_name

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

-- Debugging
local bundles = {
	fn.glob(
		DEBUGGER_LOCATION .. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
	),
}
v.list_extend(bundles, v.split(fn.glob(DEBUGGER_LOCATION .. "/vscode-java-test/server/*.jar"), "\n"))

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		fn.glob(JDTLS_LOCATION .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		JDTLS_LOCATION .. "/config_" .. SYSTEM,
		"-data",
		workspace_dir,
	},

	on_attach = function(client, bufnr)
		if client.server_capabilities.documentHighlightProvider then
			hl(0, "LspReferenceText", {
				underline = true,
				bold = true,
				fg = "#A00000",
				bg = "#104040",
			})
			hl(0, "LspReferenceRead", {
				underline = true,
				bold = true,
				fg = "#A00000",
				bg = "#104040",
			})
			hl(0, "LspReferenceWrite", {
				underline = true,
				bold = true,
				fg = "#A00000",
				bg = "#104040",
			})
			local ldh = augroup("LspDocumentHighlight", {})
			autocmd(
				{ "CursorHold", "CursorHoldI" },
				{ buffer = bufnr, callback = buf.document_highlight, group = ldh }
			)
			autocmd(
				{ "CursorMoved", "CursorMovedI" },
				{ buffer = bufnr, callback = buf.clear_references, group = ldh }
			)
		end
	end,

	capabilities = require("cmp_nvim_lsp").default_capabilities(
		lsp.protocol.make_client_capabilities()
	),
	root_dir = root_dir,

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			format = {
				enabled = true,
				settings = {
					url = fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
					profile = "GoogleStyle",
				},
			},
		},
		signatureHelp = { enabled = true },
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
		},
		contentProvider = { preferred = "fernflower" },
		extendedClientCapabilities = extendedClientCapabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			hashCodeEquals = {
				useJava7Objects = true,
			},
			useBlocks = true,
		},
	},

	flags = {
		allow_incremental_sync = true,
	},
	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = bundles,
	},
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)

-- Add the commands
require("jdtls.setup").add_commands()
