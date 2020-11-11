" Fuzzy finder configuration.

" Default fuzzy finder launch arguments (results on top)
let $FZF_DEFAULT_OPTS = '--reverse'

" Key binding to run fuzzy finder
nmap <C-_> :FZF<CR>

" Key binding to run fuzzy finder for text occurrence in all files (ripgrep must be installed in system)
nmap <C-_><C-_> :Rg<CR>

" Run fuzzy finder in pop up window
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }
