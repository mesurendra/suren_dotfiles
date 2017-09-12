" This must be first, because it changes other options as a side effect.
set nocompatible
" !!! Dont use "imap <leader> => cause delay while typing space
let mapleader="\<space>"
"======================================================================
"                     Plugins installed using Vundle
"======================================================================
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'               " easy way to install plugin in vim
Plugin 'scrooloose/nerdtree'             " File explorer
Plugin 'Lokaltog/vim-easymotion'         " super cool plugin to navigate in the current screen
Plugin 'tomasr/molokai'                  " My favourite theme
Plugin 'vim-airline/vim-airline'         " Status bar at the bottom of the vim editor :)
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'          " shows a git diff
Plugin 'tpope/vim-fugitive'              " git wrapper plugin
Plugin 'freitass/todo.txt-vim'           " added manually
Plugin 'Yggdroot/indentLine'             " draw line to show indentation
Plugin 'tpope/vim-surround'              " surround  text with some text like <h1> text </h1>
Plugin 'scrooloose/syntastic'            " provides syntax checking for a wide array of languages
Plugin 'ervandew/supertab'               " Autocomplete when using tab
Plugin 'kien/ctrlp.vim'                  " installed manually, quick movement, <leader><leader>w
Plugin 'scrooloose/nerdcommenter'        " commenting code
Plugin 'terryma/vim-multiple-cursors'    " sublime like multi-cursor feature
"----------------------------------------------------------------------
"                        Experimental plugins
"----------------------------------------------------------------------
Plugin 'SirVer/ultisnips'                " code snippet generation very handy
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-unimpaired'            " matching  bracket highlight
Plugin 'Valloric/YouCompleteMe'
Plugin 'craigemery/vim-autotag'
Plugin 'sbdchd/neoformat'
call vundle#end()                        " required
"======================================================================
"                     General setting
"======================================================================
set shortmess=atI    " Don’t show the intro message when starting Vim
set encoding=utf-8   " Set utf8 as standard encoding
set laststatus=2     " Always set the status bar on

"------------------------ ignore extension
set wildmenu
set wildmode=list:longest
set wildignore+=_build/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code
set wildignore+=**.class                         " Cursed Java class files

"======================================================================
"                     UI
"======================================================================
"-------------------- Indentation
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " Indent by 4 spaces when using >>, <<, == etc
set expandtab           " Tabs are spaces
set autoindent          " Keep indentation from previous line

" Always splits to the right and below
set splitright
set splitbelow

set number              " show line numbers
set showcmd             " show command in bottom bar

set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set mouse=a             " Enable mouse in all modes
set title               " Show the filename in the window title-bar
set cursorline          " highlight current line

"-----------------set font based on the OS use
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Courier\ 14
    elseif has("gui_macvim")
        " set guifont=DejaVu\ Sans\ Mono:h16
        set guifont=Monaco:h18
    elseif has("gui_win32")
        set guifont=Consolas:h14:cANSI
    endif
endif

colorscheme molokai     " I like this theme

"------------- Enable syntax highlighting -----------------
filetype plugin indent on
filetype off
syntax on                    " hint: set syntax =off  for file with long single line or any big file
set synmaxcol=200            " no syntax highlighting for lines longer than 200 cols

set scrolloff=5              " Start scrolling when we're 5 lines away from margins
set sidescrolloff=5
set sidescroll=1

"--------------------wrapping text--------------------------------
set wrap                    " this enables "visual" wrapping
set linebreak               " Wrap lines at convenient points
set nolist                  " Don't show white space characters

" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0
set wrapmargin=0
set display=lastline         " Show as much as possible of a wrapped last line, not just "@

" Search
"------------------------ Make search case insensitive
set hlsearch            " highlight matches
set incsearch           " search as characters are entered
set ignorecase          " case insensitive search
set smartcase
" unhighlight search text when entering insert mode
autocmd InsertEnter * :set nohlsearch
autocmd InsertLeave * :set hlsearch

set clipboard=unnamed,unnamedplus " to copy the yanked text  into system clipboard
" not necessary as we set clipboard=unnamed,unnamedplus
" copy and paste to system clipboard
" vmap <leader>y "+y
" vmap <leader>d "+d
" nmap <leader>p "+p
" nmap <leader>P "+P
" vmap <leader>p "+p
" vmap <leader>P "+P
vmap <leader>y "*y

set autoread        " Set to auto read when a file is changed from the outside
set hidden          " Allow buffer switching without saving

" Useful settings
set history=700
set undolevels=700

"======================================================================
"                     Keyboard mapping in different modes
"======================================================================
"jk  to go back into command mode
inoremap jk <Esc>

" Quickly edit/reload the vimrc file
nmap <silent><leader>ev :e $MYVIMRC<CR>

"------------------------------ NAVIGATION ------------------------------
" Moving among splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" moving  along the tab
nnoremap <S-h> gT    " move to left tab
nnoremap <S-l> gt    " move the coursor to left tab.

" Access buffer easily
nnoremap <leader>l :ls<CR>
nnoremap <leader>f :bn<CR>
nnoremap <leader>F :bp<CR>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Useful mappings for managing TABS
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

"------------------------------ SAVE ------------------------------
noremap  <silent><leader>w  :update<CR>
vnoremap <silent><leader>w  <C-C>:update<CR>
"ctrl-s  to save  in all the mode
noremap  <silent><C-s> :update<CR>
vnoremap <silent><C-s>  <C-C>:update<CR>
inoremap <silent><C-s>  <C-O>:update<CR>

" write file as root
cmap w!! w !sudo tee % > /dev/null

"------DELETE instead of cut :)
nnoremap <leader>d "_d
vnoremap <leader>d "_d

"------------------------------ EDIT ------------------------------
" Set working directory to the current file
autocmd BufEnter * silent! lcd %:p:h

" Using vim as hex editor
" Don't use much so commented till i need to use it
" nnoremap <Leader>hon :%!xxd<CR>
" nnoremap <Leader>hof :%!xxd -r<CR>

"insert  new line remaining in normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <S-Enter> O<Esc>j
nnoremap <Enter> o<Esc>k

" I love it :)
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z

"move the line up or down
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Turn off search highlight
nnoremap <silent><leader>h :nohlsearch<CR>

"------------------------------ FORMATTING ------------------------------
" Move a selected code one block left or right for indentation
vnoremap < <gv
vnoremap > >gv
vnoremap <leader>a gg=G

" Map sort function to a key
vnoremap <leader>s :sort<CR>

" Toggle spell checking on and off with `<leader>s'
nmap <silent> <leader>s :set spell!<CR>
map <leader>ss z=
" user following command to correct it
" ]s — move to the next misspelled word
" [s — move to the previous misspelled word
" zg — add a word to the dictionary
" zug — undo the addition of a word to the dictionary
" z= — view spelling suggestions for a misspelled word


" Removed because multiple cursor
" Toggle relative line numbering :set rnu
nnoremap <silent><leader>rn   :set relativenumber!<cr>

" use arrow key to resize the windows
nnoremap <right> :vertical resize +5<cr>
nnoremap <left> :vertical resize -5<cr>
nnoremap <up> :resize +5<cr>
nnoremap <down> :resize -5<cr>

"------------------------------ RUN PYTHON ----------------------------
nnoremap <F7> <ESC>:w<CR>:!clear;python %<CR>
nnoremap <F7> :!clear;python %<CR>
vnoremap <F7> :!clear;python<CR>
" will be easier for mac
vnoremap <leader>j :!clear;python<CR>
nnoremap <leader>j <ESC>:w<CR>:!clear;python %<CR>

"------------------------------ CUSTOM FUNCTION ----------------------------
" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
if pumvisible()
    if a:action == 'j'
        return "\<C-N>"
    elseif a:action == 'k'
        return "\<C-P>"
    endif
endif
return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" looks very interesting to handle multiple cursor
nnoremap <silent> <leader>c :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <leader>c :MultipleCursorsFind <C-R>/<CR>
"i use this a lot :)
nmap <silent> <leader>k :set filetype=python<CR>

noremap <silent><leader>z :enew<CR>


" Delete trailing white space on save
func! DeleteTrailingWS()
exe "normal mz"
%s/\s\+$//ge
exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()
"======================================================================
"                     PLUGIN SPECIFIC SETTING
"======================================================================

"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

"------------------------------CtrlP------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'             " search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_max_files=0               " no restriction on results/file list
let g:ctrlp_max_depth=40
let g:ctrlp_clear_cache_on_exit = 0

" c - the directory of the current file.
" r - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" a - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file TODO: a is not so clear
let g:ctrlp_working_path_mode = "ar"
"from which directory where it starts searching
let g:ctrlp_max_height= 10
let g:ctrlp_switch_buffer = 'et'       " jump to a file if it's open already
let g:ctrlp_use_caching = 1            " enable caching
let g:ctrlp_clear_cache_on_exit=0      " speed up by not removing clearing cache ever time
let g:ctrlp_mruf_max = 250             " number of most  recently used files
let g:ctrlp_match_window_bottom = 1    " Show at bottom of window
let g:ctrlp_jump_to_buffer = 2         " Jump to tab AND buffer if already open
let g:ctrlp_open_multiple_files = 'vr' " opens multiple selections in vertical splits to the right
let g:ctrlp_dotfiles = 0               " do not show (.) dotfiles in match list
let g:ctrlp_showhidden = 0             " do not show hidden files in match list
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co'] " to make ctrlp fast "TODO: understand how?
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn|gitkeep)$',
\ 'file': '\v\.(exe|so|dll|log|gif|jpg|jpeg|png|psd|DS_Store|ctags|gitattributes)$',
\ 'link': 'some_bad_symbolic_links',
\ }
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap ; :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>. :CtrlPTag<CR>
"-----------------------------airline------------------------------
let g:airline_theme="powerlineish"
"------------------------------NERDTree------------------------------
let NERDTreeIgnore=['\.pyc$', '\~$', '\.sw?', '\.DS_Store'] "ignore files in NERDTree

" Toggle NERDTree explorer window
set autochdir
let g:NERDTreeChDirMode=2
nnoremap <F4> :NERDTreeToggle<CR>  " in PC desktop i prefer this
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>
"------------------------------ultisnips------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsUsePythonVersion = 2
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"------------------------------SuperTab
let g:SuperTabDefaultCompletionType    = '<C-m>'
let g:SuperTabCrMapping                = 0

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-m>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }

nnoremap <leader>g <C-]>   " goto defination using ctags
nnoremap <leader>G <C-T>   " goto code you were working


"======================================================================
"                     LANGUAGE SPECIFIC
"======================================================================

"------------------------------ PYTHON ----------------------------------
autocmd FileType python set omnifunc=pythoncomplete#Complete "Completion
au bufNewFile *.py set ft=python.py
au filetype python set expandtab
au filetype python highlight OverLength term=bold
au filetype python match OverLength /\%80v.\+/
au filetype python set foldmethod=indent
au filetype python set cindent
au filetype python set autoindent shiftwidth=4
au filetype python set softtabstop=4
"======================================================================
"                     Experimental settings
"======================================================================
"this is very good but this file need to be deleted once in a day or so
"Keep undo history across sessions, by storing in file.
"backup and directory settings
" may be can use TMP file so deleted once computer is shutdown

"set nobackup
"set noswapfile
"set nowritebackup
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  silent !mkdir ~/.vim/swp > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" double // at the end handle 2 files having same name in the different location
set backupdir=~/.vim/backups//
set directory=~/.vim/swp//
"run this once in a week :D
nnoremap <silent><Leader>0  :!rm ~/.vim/backups/*<CR>
" resolve Unable to open swap file warning " not required any more
"set directory=.,$TEMP

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Enable folding
"set foldenable         " enable folding
set nofoldenable        " when opening, files are not folded.
set foldmethod=indent   " fold based on indent level
set foldlevelstart=10   " open most folds by default
set foldlevel=2
set foldnestmax=10
" Enable folding with the space bar
nnoremap <leader>a za

" create ctags
"
set tags=tags;
set tags+=.tags;
set tags+=./.git/tags;

" Fugitive Shortcuts
"""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

let g:neoformat_run_all_formatters = 1

xnoremap p pgvy


" TODO: search in the file, buffer, folder and across repo
"

let g:SimpylFold_docstring_preview = 1
set shortmess+=c


nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>            " turn off YCM
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>            " turn on YCM
