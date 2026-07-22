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

local mason_jdtls = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local workspace = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root, ":p:h:t")

local bundles = {}
local spring_ok, spring_boot = pcall(require, "spring_boot")
if spring_ok then
	vim.list_extend(bundles, spring_boot.java_extensions())
end

jdtls.start_or_attach({
	cmd = {
		"jdtls",
		"--jvm-arg=-javaagent:" .. mason_jdtls .. "/lombok.jar",
		"-data",
		workspace,
	},
	root_dir = root,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	init_options = {
		bundles = bundles,
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
	},
})
