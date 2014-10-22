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
"Plugin 'jistr/vim-nerdtree-tabs'        " Project and file navigation with tabs support
Plugin 'Shougo/unite.vim'               " Navigation between buffers and files
Plugin 'jlanzarotta/bufexplorer'        " easy buffers switch

Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim

Plugin 'vimplugin/project.vim'          " projects support

Plugin 'scrooloose/nerdcommenter'       " easy comment

Plugin 'majutsushi/tagbar'
"----------- autocomplete ftplugins --------------
Plugin 'shawncplus/phpcomplete.vim'

call vundle#end()            		" required

filetype on
filetype plugin on
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("gui")

  " set the gui options to:
  "   g: grey inactive menu items
  "   m: display menu bar
  "   r: display scrollbar on right side of window
  "   b: display scrollbar at bottom of window

  "   t: enable tearoff menus on Win32
  "   T: enable toolbar on Win32
    set go-=T
    set go-=L
    "set guifont=Courier

endif

"au VimEnter * if line('$') > &lines | set go+=r | else | set go-=r | endif
"au VimResized * if line('$') > &lines | set go+=r | else | set go-=r | endif

"set nobackup		" keep a backup file (restore to previous version)
"set noundofile		" keep an undo file (undo changes after closing)
"set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set mouse=a
syntax on
set number
" Disable all blinking:
set guicursor+=a:blinkon0
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
" ----- after change indentation for many lines visual select is not disappear
vnoremap > >gv
vnoremap < <gv
"------------------------------------
set background=dark
colorscheme monokai-noit
" названия табов - только имена файлов
set guitablabel=%t
" Настраиваем переключение раскладок клавиатуры по <C-F>
set keymap=russian-jcukenwin

" Раскладка по умолчанию - английская
set iminsert=0
set imsearch=0
"highlight lCursor guifg=NONE guibg=Cyan
"Переключение раскладок и индикация выбранной
" в данный момент раскладки.
" -->
    " Переключение раскладок будет производиться по <C-F>
    "
    " При английской раскладке статусная строка текущего окна будет синего
    " цвета, а при русской - зеленого.

    "function MyKeyMapHighlight()
        "if &iminsert == 0
            "hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
        "else
            "hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
        "endif
    "endfunction

    " Вызываем функцию, чтобы она установила цвета при запуске Vim'a
    "call MyKeyMapHighlight()

    " При изменении активного окна будет выполняться обновление
    " индикации текущей раскладки
    "au WinEnter * :call MyKeyMapHighlight()

    cmap <silent> <C-F> <C-^>
    imap <silent> <C-F> <C-^>
    nmap <silent> <C-F> a<C-^>
    vmap <silent> <C-F> <Esc>a<C-^>gv
    
    "imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
    "nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
    "vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
" <--

" сохранить файл
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

" кириллица для спеллчекера 
"setlocal spell spelllang=ru_yo,en_us

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"autocomplete
"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set backupdir=./.backup,/tmp
set directory=./.backup,/tmp

"========================================
" NERDTree
"========================================
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>

"map <F3> :NERDTreeTabsToggle<CR>
" игнорируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
" открывать в новом табе по <ENTER>
let NERDTreeMapOpenInTab='<ENTER>'

"========================================
" Tagbar
"========================================
map <F4> :TagbarToggle<CR>
"let g:tagbar_left = 1


"========================================
" Airline
"========================================
set laststatus=2
let g:airline_theme='badwolf'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
