vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with (
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = false,
    underline = {
      severity = { min = vim.diagnostic.severity.INFO }
    },
    virtual_text = {
      severity = { min = vim.diagnostic.severity.INFO }
    },
    signs = {
      severity = { min = vim.diagnostic.severity.INFO }
    }
  }
)
