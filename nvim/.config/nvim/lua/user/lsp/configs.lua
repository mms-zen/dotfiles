local status, mason = pcall(require, "mason")
if (not status) then return end

mason.setup {}

local status2, mason_lsp = pcall(require, "mason-lspconfig")
if (not status2) then return end

local servers = { "terraformls", "jsonls", "sumneko_lua", "gopls", "solargraph", "jdtls", "tsserver" }
mason_lsp.setup {
  ensure_installed = servers
}

local status3, lspconfig = pcall(require, "lspconfig")
if (not status3) then return end

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
