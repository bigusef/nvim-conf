-- jdtls is started here per java buffer (nvim-jdtls handles multi-module projects
-- better than plain lspconfig, so it is excluded from mason-lspconfig auto-enable)
local ok, jdtls = pcall(require, "jdtls")
if not ok then
	return
end

local root = vim.fs.root(0, { "gradlew", "mvnw", "pom.xml", "build.gradle", "build.gradle.kts", ".git" })
if not root then
	return
end

local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local workspace = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root, ":p:h:t")

local bundles = {}
local spring_ok, spring_boot = pcall(require, "spring_boot")
if spring_ok then
	vim.list_extend(bundles, spring_boot.java_extensions())
end

-- debug + test jdt extensions; the runner-with-dependencies jar breaks jdtls if included
for _, glob in ipairs({
	"/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
	"/java-test/extension/server/*.jar",
}) do
	for _, jar in ipairs(vim.split(vim.fn.glob(mason_packages .. glob), "\n")) do
		if jar ~= "" and not jar:match("runner%-jar%-with%-dependencies") then
			table.insert(bundles, jar)
		end
	end
end

jdtls.start_or_attach({
	cmd = {
		"jdtls",
		"--jvm-arg=-javaagent:" .. mason_packages .. "/jdtls/lombok.jar",
		"-data",
		workspace,
	},
	root_dir = root,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	init_options = {
		bundles = bundles,
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
	},
	on_attach = function(_, bufnr)
		-- dap is loaded by now (VeryLazy fires before any LSP attach completes)
		if pcall(require, "dap") then
			jdtls.setup_dap({ hotcodereplace = "auto" })
			require("jdtls.dap").setup_dap_main_class_configs()
		end

		-- java tests go through jdtls + java-test bundles, mirroring the neotest keys
		vim.keymap.set("n", "<leader>Tt", function()
			require("jdtls").test_nearest_method()
		end, { buffer = bufnr, desc = "[T]est nearest [T]est method" })
		vim.keymap.set("n", "<leader>Tf", function()
			require("jdtls").test_class()
		end, { buffer = bufnr, desc = "[T]est class ([F]ile)" })
	end,
})
