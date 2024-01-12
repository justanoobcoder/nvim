local M = {}

function M.root()
  local root_patterns = { ".git", ".clang-format", "pom.xml", "mvnw", "gradlew", "build.gradle" }
  local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])
  return root_dir
end

function M.map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  local modes = type(mode) == "string" and { mode } or mode

  ---@param m string
  modes = vim.tbl_filter(function(m)
    return not (keys.have and keys:have(lhs, m))
  end, modes)

  -- do not create the keymap if a lazy keys handler exists
  if #modes > 0 then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      ---@diagnostic disable-next-line: no-unknown
      opts.remap = nil
    end
    vim.keymap.set(modes, lhs, rhs, opts)
  end
end

function M.in_terminal(cmd, opts)
  local terminals = {}
  opts = vim.tbl_deep_extend("force", {
    ft = "lazyterm",
    size = { width = 0.9, height = 0.9 },
  }, opts or {}, { persistent = true }) --[[@as LazyTermOpts]]

  local termkey = vim.inspect({ cmd = cmd or "shell", cwd = opts.cwd, env = opts.env, count = vim.v.count1 })

  if terminals[termkey] and terminals[termkey]:buf_valid() then
    terminals[termkey]:toggle()
  else
    terminals[termkey] = require("lazy.util").float_term(cmd, opts)
    local buf = terminals[termkey].buf
    vim.b[buf].lazyterm_cmd = cmd
    if opts.esc_esc == false then
      vim.keymap.set("t", "<esc>", "<esc>", { buffer = buf, nowait = true })
    end
    if opts.ctrl_hjkl == false then
      vim.keymap.set("t", "<c-h>", "<c-h>", { buffer = buf, nowait = true })
      vim.keymap.set("t", "<c-j>", "<c-j>", { buffer = buf, nowait = true })
      vim.keymap.set("t", "<c-k>", "<c-k>", { buffer = buf, nowait = true })
      vim.keymap.set("t", "<c-l>", "<c-l>", { buffer = buf, nowait = true })
    end

    vim.api.nvim_create_autocmd("BufEnter", {
      buffer = buf,
      callback = function()
        vim.cmd.startinsert()
      end,
    })
  end

  return terminals[termkey]
end

function M.on_load(name, fn)
  local Config = require("lazy.core.config")
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    fn(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end

return M
