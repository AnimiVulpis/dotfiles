" vim-plug
" folder were plugins will be saved
call plug#begin('~/.vim/plugged')

" solarized color theme
Plug 'iCyMind/NeoSolarized'

" better vim status line
Plug 'vim-airline/vim-airline'
" vim-airline themes
Plug 'vim-airline/vim-airline-themes'

" nerdtree
Plug 'scrooloose/nerdtree'

" git gutter markers
Plug 'airblade/vim-gitgutter'

" better incremental search
Plug 'haya14busa/incsearch.vim'

" vim-plug end command
call plug#end()

" use true colors
set termguicolors

" use background
set background=dark

" activate NeoSolarized color theme
colorscheme NeoSolarized

" let vim airline use powerline font
let g:airline_powerline_fonts=1

" setup of incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" smart case search if there is uppercase
set smartcase
" case insensitive search
set ignorecase

" keep swap/backup/undo files organized
" create those directories first
" the `//` at the end ensures file names contain complete path
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" make <Meta-Backspace> delete words backwords
imap <M-BS> <C-o>db
