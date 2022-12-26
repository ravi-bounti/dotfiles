-- Local LSP Configs
-- This imports ~/.config/nvim/lua/lsp.lua or ~/.config/nvim/lua/lsp/init.lua.
local lsp_util = require("lsp")
-- This imports `lua/lspconfig/init.lua` from the nvim-lspconfig plugin.
local nvim_lsp = require("lspconfig")

-- Setup language server clients from the neovim@meta plugin.
-- These will only autostart on the corresponding filetypes, iow you don't need
-- to gate these behind a filetype check.
local servers = {
  -- "jedi_language_server",
  "rust_analyzer"
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = lsp_util.on_attach,
    capabilities = lsp_util.capabilities,
  })
end

nvim_lsp["jedi_language_server"].setup({
  on_attach = lsp_util.on_attach,
  capabilities = lsp_util.capabilities,
  init_options = {
    workspace = {
      environmentPath = '/usr/local/bin/python3.11'
    }
  }
})

-- Treesitter configs
-- require("nvim-treesitter.install").prefer_git = true
