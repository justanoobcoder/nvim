local jdtls_ok, jdtls = pcall(require, 'jdtls')
if not jdtls_ok then
  vim.notify 'JDTLS not found, install with `:LspInstall jdtls`'
  return
end

local jdtls_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local path_to_lsp_server = jdtls_path .. '/config_linux'
local path_to_plugins = jdtls_path .. '/plugins'
local path_to_jar = path_to_plugins .. '/org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar'
local lombok_path = jdtls_path .. '/lombok.jar'

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == '' then
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
os.execute('mkdir ' .. workspace_dir)

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. lombok_path,
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', path_to_jar,
    '-configuration', path_to_lsp_server,
    '-data', workspace_dir,
  },
  root_dir = root_dir,
}

jdtls.start_or_attach(config)
