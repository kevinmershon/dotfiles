""" presentation preferences
set nocompatible
set enc=utf-8                   " use UTF-8 encoding
syntax enable                   " enable syntax highlighting
set background=dark             " use a dark background
colorscheme desertEx            " use the desertEx color theme
set number                      " show line numbers
set title                       " show the file title when open
if has("gui_running")           " gVim: maximize the window on startup
    if has("win32")
      set guifont=Consolas:h10
    endif
    set guioptions-=m               " gVim: remove menubar
    set guioptions-=T               " gVim: remove toolbar
    set columns=999 lines=999
else
    set term=screen-256color
endif

" set the default text with to 80 characters with an 8 character margin
set textwidth=80
set colorcolumn=-8,-7,-6,-5,-4,-3,-2,-1,-0
" color the margin dark gray
hi colorcolumn guibg=#303030 ctermbg=236

" highlight all unnecessary whitespace as dark red
hi ExtraWhitespace guibg=#5f0000 ctermbg=52
hi OverLength guibg=#5f0000 ctermbg=52
if has("autocmd")
    au BufWinEnter * let w:m1=matchadd("ExtraWhitespace", '\s\+$', -1)
    au BufWinEnter * let w:m2=matchadd("OverLength", '\%>80v.\+', -1)
endif

""" usability settings
set backspace=indent,eol,start  " Allow backspacing across lines
set ttyfast                     " fast character scrolling
set scrolloff=6                 " when scrolling to the end of a file, show at least 6 more lines
set incsearch                   " use incremental search to find items as the search string is typed
set hlsearch                    " search while typing, and highlight found terms
set directory=.,$TEMP           " Use the TEMP directory if creating a new file
set nowrap                      " don't wrap lines
set showmode                    " show the mode you're in
set numberwidth=5               " line numbers are at least 5 characters wide
set laststatus=2                " show the status line at all times
set undofile                    " store persistent undo's
set undodir=$HOME/.vim/undo     " where to store them

""" file format preferences
set smartindent                 " automatically handle indentation
set expandtab                   " use spaces instead of hard tabs
set tabstop=2                   " use 2 spaces for tabs
set shiftwidth=2                " set the default indentation width for smartindent

set exrc                        " allow per-directory override of .vimrc settings
set secure                      " disable unsafe commands in local .vimrc files

" These settings make escaping insert and visual modes much faster when
" using Vim in the terminal.
set timeout timeoutlen=200 ttimeoutlen=10

" Disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
if &term =~ '256color'
    set t_ut=
endif

set ff=unix
set ffs=unix

""" macros
function! Cleanfile()
    if &modifiable
        " trim whitespace on save
        :%s/\s\+$//e
        :%s///e
    endif
endfunction
autocmd! bufreadpost * call Cleanfile()
autocmd! bufwritepre * call Cleanfile()


""" vim discipline
" unmap the arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

""" convenience
set mouse=a

""" Vundle settings
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Bundles (Vundle is required)
Bundle 'gmarik/vundle'
" color schemes
Bundle 'vim-scripts/desertEx'
Bundle 'vim-scripts/Zenburn'
" stylistic improvements
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
" functional improvements
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'ervandew/supertab'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'mbbill/undotree'
Bundle 'airblade/vim-gitgutter'
Bundle 'editorconfig/editorconfig-vim'
" language add-ons
Bundle 'scrooloose/syntastic'
Bundle 'w0rp/ale'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'eraserhd/parinfer-rust'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'andreshazard/vim-freemarker'
Bundle 'guns/vim-sexp'
Bundle 'liquidz/vim-iced'
filetype plugin indent on

""" Ale (async linter) settings
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Commentary binding for double-leader
noremap <Leader><Leader> :Commentary<CR>

""" NERDTree settings
" Leader-n maps starts off a nerdtree command
noremap <Leader>n :NERDTree
noremap <F2> :NERDTreeToggle<CR>
" set the working directory when changing root
let NERDTreeChDirMode = 2
let g:NERDTreeWinSize=50

""" EasyTags settings
let g:easytags_file = '.tags'
let g:easytags_dynamic_files = 1

""" UndoTree settings
noremap <Leader>g :UndotreeToggle<CR>

""" Vim-iced key mappings
let mapleader=","
let g:iced_enable_default_key_mappings = v:true

""" GitGutter settings
highlight clear SignColumn
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

""" Filetype fixes
if has("autocmd")
    au Filetype make setlocal noexpandtab
endif





" Clojure helpers
if has("autocmd")
    au BufNewFile,BufReadPost *.cljc setlocal filetype=clojure
    au BufNewFile,BufReadPost *.cljs setlocal filetype=clojure
endif

" macvim hax
let g:matchparen_timeout = 10
let g:matchparen_insert_timeout = 10
