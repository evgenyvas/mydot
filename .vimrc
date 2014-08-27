"========================================
" General Settings
"========================================

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off            " required

"========================================
" Vundle settings
"========================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'jistr/vim-nerdtree-tabs'        " Project and file navigation with tabs support

call vundle#end()            		" required

filetype on
filetype plugin on
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"set nobackup		" keep a backup file (restore to previous version)
"set noundofile		" keep an undo file (undo changes after closing)
"set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set mouse=a
syntax on
set number
"set hlsearch
set switchbuf+=usetab,newtab
set laststatus=2        " show status bar always
"------- indentation settings -------
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
"------------------------------------
set background=dark
colorscheme monokai

" Настраиваем переключение раскладок клавиатуры по <C-F>
set keymap=russian-jcukenwin

" Раскладка по умолчанию - английская
set iminsert=0
set imsearch=0

  "Переключение раскладок и индикация выбранной
    " в данный момент раскладки.
    " -->
        " Переключение раскладок будет производиться по <C-F>
        "
        " При английской раскладке статусная строка текущего окна будет синего
        " цвета, а при русской - зеленого.

        function MyKeyMapHighlight()
            if &iminsert == 0
                hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
            else
                hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
            endif
        endfunction

        " Вызываем функцию, чтобы она установила цвета при запуске Vim'a
        call MyKeyMapHighlight()

        " При изменении активного окна будет выполняться обновление
        " индикации текущей раскладки
        au WinEnter * :call MyKeyMapHighlight()

        cmap <silent> <C-F> <C-^>
        imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
        nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
        vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
    " <--

" сохранить файл
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

" кириллица для спеллчекера 
"setlocal spell spelllang=ru_yo,en_us

"========================================
" NERDTree
"========================================
" показать NERDTree на F3
"map <F3> :NERDTreeToggle<CR>
map <F3> :NERDTreeTabsToggle<CR>
" игнорируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
" открывать в новом табе по <ENTER>
let NERDTreeMapOpenInTab='<ENTER>'
