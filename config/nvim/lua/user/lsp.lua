local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, masonLspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

-- Set up mason (lsp)
mason.setup()
masonLspconfig.setup()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Completion
local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

masonLspconfig.setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
    }
  end,
}
