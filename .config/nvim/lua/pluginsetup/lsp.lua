-- icons = require("pluginsetup/icons")
--
-- require('lspkind').init({
--    mode = 'symbol_text',
--    preset = 'codicons',
--    symbol_map = icons.kinds,
-- })
-- maoson, handles all the server installs and setups!
local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
   function(server)
      lspconfig[server].setup({})
   end,
})
require("mason").setup({
   ui = {
      icons = {
         package_installed = "✓",
         package_pending = "➜",
         package_uninstalled = "✗"
      }
   }
})


require("mason").setup()
require("mason-lspconfig").setup()
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend('force', lsp_defaults.capabilities,
   require('cmp_nvim_lsp').default_capabilities())

require("navigator").setup({
   transparency = 100,
   mason = true,
   default_mapping = false,
})
local signs = {
   Error = " ",
   Warning = " ",
   Hint = " ",
   Information = " "
}

for type, icon in pairs(signs) do
   local hl = "DiagnosticSign" .. type
   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- Getting nvim to use fzf for its lsp functions :
vim.lsp.handlers["textDocument/codeAction"] = require('navigator.codeAction').code_action
vim.lsp.handlers["textDocument/definition"] = require('navigator.definition').definition_handler()
vim.lsp.handlers["textDocument/references"] = require('navigator.reference').async_ref
vim.lsp.handlers["textDocument/documentSymbol"] = require('navigator.symbols').document_symbols
vim.lsp.handlers["callHierarchy/incomingCalls"] = vim.lsp.buf.incoming_calls
vim.lsp.handlers["callHierarchy/outgoingCalls"] = vim.lsp.buf.outgoing_calls

-- lsp signature setup :
-- require'lsp_signature'.setup()
--
-- local function lspSymbol(name, icon)
-- vim.fn.sign_define(
-- 	'DiagnosticSign' .. name,
-- 	{ text = icon, numhl = 'DiagnosticDefault' .. name }
-- )
-- end
-- lspSymbol('Error', icons.diagnostics.Error)
-- -- lspSymbol('Warn', icons.diagnostics.Warn)
-- lspSymbol('Hint', icons.diagnostics.Hint)
-- lspSymbol('Info', icons.diagnostics.Info)
--
