
set number
set relativenumber
set inccommand=split

" Tabs config
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Color schemes
Plug 'nanotech/jellybeans.vim'

" Airline theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git integration
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'

" NERDTree
" Plug 'scrooloose/nerdtree'

" Deoplete auto-completion
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Python auto-completion
Plug 'zchee/deoplete-jedi'

call plug#end()


" Airline theme configuration
set noshowmode " don't repeat status bar
let g:airline_theme = "jellybeans"
"let g:airline_theme = "base16"
"let g:airline_theme = "cobalt2"
"let g:airline_theme = "distinguished"
let g:airline_powerline_fonts = 1
set guifont=Monaco:h10

" Color scheme configuration
set termguicolors
set background = "dark"
colorscheme jellybeans

let g:python_host_prog = '/home/camilo/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/camilo/.pyenv/versions/neovim3/bin/python'

" Deoplete configuration
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
