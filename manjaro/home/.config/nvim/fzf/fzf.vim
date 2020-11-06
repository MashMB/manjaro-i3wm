" Fuzzy finder configuration.

" Default fuzzy finder launch arguments (results on top)
let $FZF_DEFAULT_OPTS = '--reverse'

" Key binding to run fuzzy finder
map <C-_> :FZF<CR>

" Run fuzzy finder in pop up window
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }
