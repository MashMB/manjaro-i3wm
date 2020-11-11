" Configuration for ranger extension.

" Open ranger instead of netrw (NERDTree)
let g:NERDTreeHijackNetrw = 0

" Open ranger instead of netrw
let g:ranger_replace_netrw = 1

" Turn off default key binding
let g:ranger_map_keys = 0

" New key binding for ranger
nmap <leader>r :Ranger<CR>
