vim.cmd [[
let g:fern#renderer = "nerdfont"
let g:fern_renderer_devicons_loaded = 0
let g:fern#disable_default_mappings = 1

noremap <silent> <Leader>e :Fern . -drawer -reveal=% -toggle -width=30<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> c <Plug>(fern-action-copy)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> H <Plug>(fern-action-hidden:toggle)
  nmap <buffer> R <Plug>(fern-action-reload)
  nmap <buffer> M <Plug>(fern-action-mark-toggle)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> h <Plug>(fern-action-leave)
  nmap <buffer><nowait> l <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END
]]
