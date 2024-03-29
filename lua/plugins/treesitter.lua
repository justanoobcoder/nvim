return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "cpp",
        "css",
        "comment",
        "fish",
        "hyprlang",
        "java",
        "make",
        "scss",
        "yuck",
      })
    end

    if type(opts.highlight) == "table" then
      opts.highlight = {
        enable = true,
        -- disable treesitter highlighting for files larger than 100 KiB
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KiB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      }
    end
  end,
  vim.filetype.add({
    pattern = {
      [".*/hypr/.*%.conf"] = "hyprlang",
      [".*/flake.lock"] = "json",
    },
  }),
}
