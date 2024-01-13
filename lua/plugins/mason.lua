return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "html-lsp",
      "gopls",
      "clangd",
      "bash-language-server",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "typescript-language-server",
      "css-lsp",
      "lua-language-server",
      "jdtls",

      "java-test",
      "java-debug-adapter",

      "stylua",
      "shfmt",
    },
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
