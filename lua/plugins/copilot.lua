return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<C-CR>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
  keys = {
    { "<leader>cc", "<CMD>Copilot enable<CR>", desc = "Enable Copilot" },
    { "<leader>cC", "<CMD>Copilot disable<CR>", desc = "Disable Copilot" },
  },
}
