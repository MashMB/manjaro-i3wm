" General settings for Neovim.

" Map leader key
let g:mapleader = "\<Space>"

" Enables syntax highlighting
syntax enable                           

" Required to keep multiple buffers open multiple buffers
set hidden                              

" Display long lines as just one line
set nowrap              

" The encoding displayed
set encoding=utf-8                      

" Makes pop up menu smaller
set pumheight=10                        

" The encoding written to file
set fileencoding=utf-8                  

" Show the cursor position all the time
set ruler              			            

" More space for displaying messages
set cmdheight=2                         

" Treat dash separated words as a word text object
set iskeyword+=-                      	

" Enable your mouse
set mouse=a                             

" Horizontal splits will automatically be below
set splitbelow                          

" Vertical splits will automatically be to the right
set splitright                          

" Support 256 colors
set t_Co=256                            

" So that I can see `` in Markdown files
set conceallevel=0                      

" Insert 2 spaces for a tab
set tabstop=2                           

" Change the number of space characters inserted for indentation
set shiftwidth=2                        

" Makes tabbing smarter (will know you have 2 vs 4)
set smarttab                            

" Converts tabs to spaces
set expandtab                           

" Makes indenting smart
set smartindent                         

" Good auto indent
set autoindent                          

" Always display the status line
set laststatus=0                        

" Line numbers
set number relativenumber                              

" Show max line length
set colorcolumn=120

" Dark background
set background=dark                     

" Always show tabs
set showtabline=2                       

" We don't need to see things like -- INSERT -- anymore
set noshowmode                         

" Set default spell check
set spell spelllang=en_us,pl

" This is recommended by COC
set nobackup                            

" This is recommended by COC
set nowritebackup                       

" Faster completion
set updatetime=300                      

" Short timeout
set timeoutlen=500                      

" Stop newline continuation of comments
set formatoptions-=cro                  

" Copy/paste between everything else
set clipboard=unnamedplus               

" Auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au! BufWritePost $MYVIMRC source %      

cmap w!! w !sudo tee %
