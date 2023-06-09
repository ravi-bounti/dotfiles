-- (c) Meta Platforms, Inc. and affiliates. Confidential and proprietary.

-- @lint-ignore-every LUA_LUAJIT

local M = {}

capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities = capabilities

-- lspconfig settings

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions

  -- These two replaced by TroubleToggle
	-- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap('n', '<space>rn', "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

  -- Workspace folders
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

  --Trouble
  buf_set_keymap('n', '<space>xw', '<cmd>TroubleToggle workspace_diagnostics<CR>', opts)
  buf_set_keymap('n', '<space>xd', '<cmd>TroubleToggle document-diagnostics<CR>', opts)
  buf_set_keymap('n', '<space>xl', '<cmd>TroubleToggle loclist<CR>', opts)
  buf_set_keymap('n', '<space>xq', '<cmd>TroubleToggle quickfix<CR>', opts)
	buf_set_keymap("n", "<space>xx", "<cmd>TroubleToggle<CR>", opts)

	buf_set_keymap("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts)
	buf_set_keymap("n", "gd", "<cmd>TroubleToggle lsp_definitions<CR>", opts)

	vim.diagnostic.config({
		virtual_text = {
			source = "always",
			format = function(diagnostic)
				local new_line_location = diagnostic.message:find("\n")

				if new_line_location ~= nil then
					return diagnostic.message:sub(1, new_line_location)
				else
					return diagnostic.message
				end
			end,
		},
	})
end
M.on_attach = on_attach

-- null-ls configs
local null_ls = require("null-ls")
null_ls.setup({
	on_attach = on_attach,
  -- Uncomment following block if using ccls
  -- ccls uses utf-32. null-ls uses utf-16 by default.
  -- Either uncomment or figure out how to make ccls run on utf-16

	-- on_init = function(new_client, _)
	-- 	new_client.offset_encoding = 'utf-32'
	-- end,
	sources = {
		null_ls.builtins.formatting.trim_whitespace,
		null_ls.builtins.formatting.trim_newlines,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.fixjson,
		null_ls.builtins.formatting.prettier,
    null_ls.builtins.code_actions.shellcheck
	},
})

return M
