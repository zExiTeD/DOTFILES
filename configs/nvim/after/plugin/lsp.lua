local on_attach = function(_,bufnr)

	vim.keymap.set('n','<leader>r',vim.lsp.buf.rename,{ buffer = bufnr})
	vim.keymap.set('n','<leader>a',vim.lsp.buf.code_action,{ buffer = bufnr})
	
	vim.keymap.set('n','gd',vim.lsp.buf.definition,{ buffer = bufnr})
	vim.keymap.set('n','gD',vim.lsp.buf.declaration,{ buffer = bufnr})
	vim.keymap.set('n','gI',vim.lsp.buf.implementation,{ buffer = bufnr})
	vim.keymap.set('n','<leader>D',vim.lsp.buf.type_definition,{ buffer = bufnr})

	vim.keymap.set('n','gr', require('telescope.builtin').lsp_references,{ buffer = bufnr})
	vim.keymap.set('n','<leader>s', require('telescope.builtin').lsp_document_symbols,{ buffer = bufnr})
	vim.keymap.set('n','<leader>S',require('telescope.builtin').lsp_dynamic_workspace_symbols,{ buffer = bufnr})
	
	vim.keymap.set('n','K',vim.lsp.buf.hover,{ buffer = bufnr})

	vim.api.nvim_buf_create_user_command(bufnr,'Format',function()
		vim.lsp.buf.format()
	end,{})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

--require('lspconfig').lua_ls.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--	Lua = {
--		workspace ={ checkThirdParty = false},
--		telemetry = {enable= false},
--	},
--}

require("mason").setup()
require("mason-lspconfig").setup_handlers({
	function()
		require("lspconfig")[server_name].setup{
			on_attach = on_attach,
			capabilities = capabilities
		}
	end,

	['lua_ls']= function()
		require('neodev').setup{}
		require('lspconfig').lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			Lua = {
				workspace ={ checkThirdParty = false},
				telemetry = {enable= false},
			},
		}
	end,
	["gopls"] = function()
		require'lspconfig'.gopls.setup{}
	end,

})
