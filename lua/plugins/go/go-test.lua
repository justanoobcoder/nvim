return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "nvim-neotest/neotest-go",
  },
  opts = {
    adapters = {
      ["neotest-go"] = {
        experimental = {
          test_table = true,
        },
        args = { "-count=1", "-timeout=60s" },
      },
    },
  },
}
