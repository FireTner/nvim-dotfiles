local M = {
   "neovim/nvim-lspconfig",
}


function M.config()
   local capabilities = vim.lsp.protocol.make_client_capabilities()

   capabilities.textDocument.completion.completionItem = {
     documentationFormat = { "markdown", "plaintext" },
     snippetSupport = true,
     preselectSupport = true,
     insertReplaceSupport = true,
     labelDetailsSupport = true,
     deprecatedSupport = true,
     commitCharactersSupport = true,
     tagSupport = { valueSet = { 1 } },
     resolveSupport = {
       properties = {
         "documentation",
         "detail",
         "additionalTextEdits",
       },
     },
   }

   local lsp = require("lspconfig")

   lsp.lua_ls.setup({
      capabilities = capabilities,

      settings = {
         maxPreload = 100000,
         preloadFileSize = 10000,
         Lua = {
            diagnostics = {
               globals = { "vim" },
            },
            workspace = {
               library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                  [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
               }
            }
         }
      }
   })
end

return M
