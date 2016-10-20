"========================================
" General Settings
"========================================

let s:editor_root=expand("~/.config/nvim")

"========================================
" vim-plug settings
"========================================

" Setting up vim-plug - the vim plugin bundler
let vimplug_file = s:editor_root . '/autoload/plug.vim'
if !filereadable(vimplug_file)
    echo "Installing vim-plug..."
    echo ""
    silent execute "!curl -fLo " . vimplug_file . " --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    let s:vimplug_installed=1
endif
call plug#begin(s:editor_root . '/plugged')

"---------=== Code/project navigation ===-------------
Plug 'scrooloose/nerdtree' 	    	" Project and file navigation
"Plugin 'jistr/vim-nerdtree-tabs'        " Project and file navigation with tabs support
"Plugin 'Shougo/unite.vim'               " Navigation between buffers and files
Plug 'jeetsukumaran/vim-buffergator'  " easy buffers switch

Plug 'vim-airline/vim-airline'              " Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'       " Lean & mean status/tabline for vim

"Plugin 'vimplugin/project.vim'          " projects support

Plug 'scrooloose/nerdcommenter'       " easy comment

Plug 'majutsushi/tagbar'              " list of methods, classes and variables

Plug 'mileszs/ack.vim'                " search
"----------- autocomplete ftplugins --------------
"Plugin 'shawncplus/phpcomplete.vim'

"Plugin 'Valloric/YouCompleteMe'      " more functional autocoplete

Plug 'kien/ctrlp.vim'              " fuzzysercher in buffers, files and mru

"Plugin 'SirVer/ultisnips'            " snippet engine

"Plugin 'honza/vim-snippets'          " snippets

"Plug 'rust-lang/rust.vim'         " rust

Plug 'fatih/vim-go'               " golang

"Plugin 'zah/nim.vim'                " nim

"----------- other --------------
Plug 'scrooloose/syntastic'        " syntax checker

Plug 'tpope/vim-fugitive'          " git wrapper

Plug 'airblade/vim-gitgutter'      " show git changes

"Plugin 'vim-scripts/matchit.zip'      " extended %

Plug 'jiangmiao/auto-pairs'        " auto close brackets

" Add plugins to &runtimepath
call plug#end()

if exists('s:vimplug_installed') && s:vimplug_installed
    unlet s:vimplug_installed
    PlugInstall
    quit
endif

let loaded_matchit = 1  " temporary fix for jump on brackets

filetype on
filetype plugin on
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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

set hidden     " undo works after changing buffer

" Disable all blinking:
set guicursor+=a:blinkon0
set hlsearch
" on star highlight next found text
nnoremap * *N
" Press F8 to toggle highlighting on/off, and show current value.
:noremap <F8> :set hlsearch! hlsearch?<CR>
" в визуальном режиме по команде * подсвечивать выделение
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>
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
" highlights 80 column limit 
set colorcolumn=80

" Show “invisible” characters
set list lcs=tab:▸\ ,trail:·,nbsp:_

set background=dark
colorscheme monokai-noit
" названия табов - только имена файлов
set guitablabel=%t
" always use X11 clipboard
set clipboard+=unnamedplus
" for console
set tabline=
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
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
imap <c-s> <Esc><c-s>

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
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set backupdir=./.backup,/tmp
set directory=./.backup,/tmp

" stamp a yanked text to S
nnoremap S diw"0P
vnoremap S "_d"0P

" rearrange tabs by ctrl + shift + arrows
function ShiftTab(direction)
     let tab_number = tabpagenr() 
     if a:direction == 0
         if tab_number == 1
             exe 'tabm' . tabpagenr('$')
         else
             exe 'tabm' . (tab_number - 2)
         endif
     else
         if tab_number == tabpagenr('$')
             exe 'tabm ' . 0
         else
             exe 'tabm ' . tab_number
         endif
     endif
     return ''
endfunction

inoremap <silent> <C-S-Left>  <C-r>=ShiftTab(0)<CR>
inoremap <silent> <C-S-Right>  <C-r>=ShiftTab(1)<CR>

noremap <silent> <C-S-Left>  :call ShiftTab(0)<CR>
noremap <silent> <C-S-Right> :call ShiftTab(1)<CR>

" search current file in all subdirectories
map <F6> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

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
let g:airline_left_sep=''
let g:airline_right_sep=''
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline_powerline_fonts = 1

"========================================
" ctrlP
"========================================
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
"nmap <leader>p :CtrlP<cr>


"========================================
" syntastic
"========================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"========================================
" ack
"========================================
" use silver searcher instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"========================================
" YouCompleteMe
"========================================
"let g:ycm_autoclose_preview_window_after_insertion = 1

"========================================
" ultisnips
"========================================
"let g:UltiSnipsExpandTrigger="<alt>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
