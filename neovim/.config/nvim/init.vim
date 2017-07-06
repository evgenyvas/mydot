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
Plug 'scrooloose/nerdtree', { 'tag': '*' }  " Project and file navigation
"Plug 'jistr/vim-nerdtree-tabs'        " Project and file navigation with tabs support
"Plug 'Shougo/unite.vim'               " Navigation between buffers and files
Plug 'jeetsukumaran/vim-buffergator'  " easy buffers switch

Plug 'vim-airline/vim-airline'              " Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'       " Lean & mean status/tabline for vim

"Plug 'vimplugin/project.vim'          " projects support

Plug 'scrooloose/nerdcommenter'       " easy comment

Plug 'tpope/vim-ragtag'               " html tags autocomplete

Plug 'majutsushi/tagbar'              " list of methods, classes and variables
"Plug 'vim-php/tagbar-phpctags.vim'    " ctags php

"Plug 'mileszs/ack.vim', { 'tag': '*' } " search
"----------- autocomplete ftplugins --------------

Plug 'Shougo/deoplete.nvim', { 'tag': '*', 'do': ':UpdateRemotePlugins' }

Plug 'kien/ctrlp.vim'              " fuzzysercher in buffers, files and mru

Plug 'SirVer/ultisnips', { 'tag': '*' }         " snippet engine

Plug 'honza/vim-snippets'          " snippets

"Plug 'fatih/vim-go', { 'tag': '*' }   " golang

"----------- other --------------
Plug 'neomake/neomake'        " asynchronous :make

Plug 'powerman/vim-plugin-viewdoc' " documentation viewer

Plug 'KabbAmine/zeavim.vim', { 'on': [
            \   'Zeavim', 'Docset',
            \   '<Plug>Zeavim',
            \   '<Plug>ZVVisSelection',
            \   '<Plug>ZVKeyDocset',
            \   '<Plug>ZVMotion'
            \ ]}

Plug 'ervandew/supertab'           " autocomplete by <Tab>

"Plug 'tpope/vim-fugitive'          " git wrapper
"Plug 'sjl/splice.vim'

Plug 'airblade/vim-gitgutter'      " show git changes

Plug 'jiangmiao/auto-pairs'        " auto close brackets

Plug 'gregsexton/MatchTag'      " highlight tags

Plug 'jeffkreeftmeijer/vim-numbertoggle' " toggle relative numbers

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
set relativenumber
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

" paste on new line
nmap <leader>p :pu<CR>
nmap <leader>P :pu!<CR>

" highlight line with cursor
set cursorline

" php composer
set wildignore+=*/.git/*,*/vendor/*

" enable php manual pages for functions by press K
" required install pman: pear install doc.php.net/pman
autocmd FileType php set keywordprg=pman

" Show “invisible” characters
set list lcs=tab:▸\ ,trail:·,nbsp:_

" search for visually selected text by //
vnoremap // y/<C-R>"<CR>

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

" don't copy substituted text while paste
xnoremap p pgvy

" кириллица для спеллчекера
"setlocal spell spelllang=ru_yo,en_us

set dictionary="/usr/dict/words"

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set backupdir=./.backup,/tmp
set directory=./.backup,/tmp

" stamp a yanked text to S
nnoremap S diw"0P
vnoremap S "_d"0P

" Meta + arrows will switch tabs
map <M-Right> gt
map <M-Left> gT

" rearrange tabs by ctrl + shift + arrows
inoremap <silent> <C-S-Left>  <C-r>=:tabm -1<CR>
inoremap <silent> <C-S-Right>  <C-r>=:tabm +1<CR>

noremap <silent> <C-S-Left>  :tabm -1<CR>
noremap <silent> <C-S-Right> :tabm +1<CR>

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
let NERDTreeRespectWildIgnore = 0

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

"========================================
" YouCompleteMe
"========================================
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}

"========================================
" neomake
"========================================
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

"========================================
" ack
"========================================
" use silver searcher instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"========================================
" ultisnips
"========================================
let g:UltiSnipsExpandTrigger="<M-Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"========================================
" gitgutter
"========================================
set updatetime=250

"========================================
" deoplete
"========================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 0
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'ultisnips']

"========================================
" supertab
"========================================
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

