" Neovim initialization file.

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/nerdtree/nerdtree.vim
source $HOME/.config/nvim/fzf/fzf.vim
source $HOME/.config/nvim/airline/airline.vim

" External plugins
call plug#begin('~/.config/nvim/plugins')
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf.vim'
call plug#end()
