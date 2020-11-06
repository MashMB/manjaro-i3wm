" Neovim initialization file.

" Raw VIM configuration
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

" Extensions 
call plug#begin('~/.config/nvim/plugins')
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf.vim'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'mhinz/vim-startify'
  Plug 'morhetz/gruvbox'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Shougo/deoplete.nvim'
call plug#end()

" VIM extensions configuration
source $HOME/.config/nvim/nerdtree/nerdtree.vim
source $HOME/.config/nvim/nerdtree-git/nerdtree-git.vim
source $HOME/.config/nvim/airline/airline.vim
source $HOME/.config/nvim/fugitive/fugitive.vim
source $HOME/.config/nvim/fzf/fzf.vim
source $HOME/.config/nvim/fzf-checkout/fzf-checkout.vim
source $HOME/.config/nvim/ranger/ranger.vim
source $HOME/.config/nvim/startify/startify.vim
source $HOME/.config/nvim/gruvbox/gruvbox.vim
source $HOME/.config/nvim/deoplete/deoplete.vim
