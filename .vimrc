" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter

set nocompatible            " not compatible with vi
set autoread                " detect when a file is changed
set langmenu=en_US.UTF-8

set history=1000            " change history to 1000
set textwidth=300


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

    " highlight
    Plug 'gerw/vim-HiLinkTrace'
    Plug 'sheerun/vim-polyglot'

    " theme
    Plug 'joshdick/onedark.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " utils
	Plug 'unblevable/quick-scope'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'jeetsukumaran/vim-buffergator'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'Raimondi/delimitMate'
    Plug 'vim-scripts/The-NERD-Tree'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'

	" Ctags / Cscope
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'skywind3000/gutentags_plus'
	Plug 'skywind3000/vim-preview'

    " linter
    Plug 'w0rp/ale'

    " auto completion
    if has('nvim')
        Plug 'Shougo/deoplete.nvim'
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'zchee/deoplete-clang'
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'zchee/deoplete-jedi'
    Plug 'Shougo/neco-vim'
    Plug 'roxma/python-support.nvim'
call plug#end()

filetype off                " required
let loaded_matchparen=1     " don't load matchit.vim (paren/bracket matching)
let html_no_rendering=1     " don't render italic, bold, links in HTML

set noshowmatch             " don't match parentheses/brackets
set nocursorline            " don't paint cursor line
set nocursorcolumn          " don't paint cursor column
set number                  " show line numbers

set nowrap                  " turn on line wrapping
set wrapmargin=0            " wrap lines when coming within n characters from side
set formatoptions=l

set autoindent              " automatically set indent of new line
set smartindent

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Tab control
set expandtab               " insert tabs rather than spaces for <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

" code folding settings
set foldmethod=syntax       " fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

set clipboard=unnamed
if !has('nvim')
	set ttyfast                 " faster redrawing
	set ttyscroll=3
endif
set diffopt+=vertical
set laststatus=2            " show the satus line all the time
set so=5                    " set 7 lines to the cursors - when moving vertical
set scrolljump=7            " scroll 7 lines at a time at bottom/top
set wildmenu                " enhanced command line completion
set hidden                  " current buffer can be put into background
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=3             " lines of text around cursor
set shell=$SHELL
set cmdheight=1             " command bar height
set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set lazyredraw              " don't redraw while executing macros

set magic                   " Set magic on, for regex

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Directories for swp files
set nobackup
set noswapfile
set fileformats=unix,dos,mac
set showcmd

if has('nvim')
	" show results of substition as they're happening
	" but don't open a split
	set inccommand=nosplit
endif

" Configuration -------------------------------------------------------------

" FastEscape {{{
" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" }}}

" Section User Interface
if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
if has("nvim")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set termguicolors
	tnoremap <Esc> <C-\><C-n>
	" insert mode - line
	let &t_SI .= "\<Esc>[5 q"
	" replace mode - underline
	let &t_SR .= "\<Esc>[4 q"
	" common - block
	let &t_EI .= "\<Esc>[3 q"
elseif ( has("termguicolors") )
	" set Vim-specific sequences for RGB colors
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

syntax on
set synmaxcol=200
syntax sync minlines=256
colorscheme onedark        	  " Set the colorscheme

" Key Settings
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
let mapleader = ","

" Move
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" y$ -> Y Make Y behave like other capitals
map Y y$

" 선택한 영역을 시스템 클립 보드로 복사
vnoremap <leader>y "+y

" select all
map <leader>sa ggVG"
" select block
nnoremap <leader>v V`}

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Quickly close the current window
nnoremap <leader>q :q<CR>
" Quickly save the current file
nnoremap <leader>w :w<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

set t_kb=^V<BS>
set t_kD=^V<DEL>

cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Switch # *
nnoremap # *
nnoremap * #

" Move across wrapped lines like regular lines
" Go to the first non-blank character of a line
noremap 0 ^
" Just in case you need to go to the very beginning of a line
noremap ^ 0

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

nmap <leader>r  <Plug>ReplaceWithRegisterOperator
nmap <leader>rr <Plug>ReplaceWithRegisterLine
xmap <leader>r  <Plug>ReplaceWithRegisterVisual

"Leader lt maps to last tab
let g:lasttab = 1
nmap <Leader>lt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" devicons
" set font terminal font or set gui vim font to a Nerd Font (https://github.com/ryanoasis/nerd-fonts):
set encoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set termencoding=utf-8

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline#extensions#tabline#fnamemod = ':t' " print only filename on the tap
let g:airline_powerline_fonts = 1

" testing rounded separators (extra-powerline-symbols):
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_left_alt_sep = ""

" set the CN (column number) symbol:
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}/%L ' . "\uE0A3" . '%{col(".")}'])
let g:airline_section_y = '%{&fenc . " " . WebDevIconsGetFileFormatSymbol()}'
let g:airline_theme = 'onedark'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" python syntax
let g:python_highlight_all = 1

" deoplete
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#libclang_path = '~/.pyenv/versions/miniconda3-latest/envs/wally/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '~/.pyenv/versions/miniconda3-latest/envs/wally/lib/clang'
let g:deoplete#sources#clang#std = {'c': 'c11', 'cpp': 'c++14', 'objc': 'c11', 'objcpp': 'c++1z'}

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"<Paste>

" ale
nmap <silent> <C-k><C-j> <Plug>(ale_previous_wrap)
nmap <silent> <C-j><C-k> <Plug>(ale_next_wrap)

let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay = 1000

let g:ale_linters = {'python': ['flake8'],
					\'C': ['gcc', 'clang','cpplint'],
					\'C++': ['gcc', 'clang','cpplint'],
					\'go': ['golint'],
					\'bash': ['shell -n flag'],
					\'JSON': ['jq']}
let g:ale_fixers = {'python': ['autopep8'],
				   \'C': ['gcc'],
				   \'C++': ['gcc'],
				   \'go': ['gofmt']}

nmap <C-k> <Plug>(ale_fix)

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermbg=none ctermfg=8
highlight NonText ctermbg=none ctermfg=8

" make the highlighting of background transparent
" This line needs to go below the colorscheme
highlight Normal guibg=NONE ctermbg=NONE
autocmd VimEnter * hi Normal ctermbg=NONE

" Italic
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
highlight Comment cterm=italic
highlight htmlArg cterm=italic

" loading the plugin
let g:webdevicons_enable = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" NERDTree On shortcut
nnoremap <leader>nt <ESC>:NERDTree<CR>

" Ctrl
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'

" Ctrl-j/k inserts blank line below/above.
nnoremap <silent><C-j><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Insert single space in normal mode
nnoremap <space> i<space><Esc>l

" Mapping Esc to Ctrl-c
inoremap <C-c> <Esc>

" CtrlP setting
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
" map <f12> :!start /min ctags -R .<cr>

" Ctags
" enable gtags module
let g:gutentags_modules = ['ctags', 'cscope', 'gtags_cscope']
" config project root markers.
let g:gutentags_project_root = ['.root']
" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')
" forbid gutentags adding gtags databases
let g:gutentags_auto_add_gtags_cscope = 0


noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

noremap <F5> :PreviewSignature!<cr>
inoremap <F5> <c-\><c-o>:PreviewSignature!<cr>

" go to defn of tag under the cursor
fun! MatchCaseTag()
    let ic = &ic
    set noic
    try
        exe 'tjump ' . expand('<cword>')
    finally
       let &ic = ic
    endtry
endfun
nnoremap <silent> <c-]> :call MatchCaseTag()<CR>

" Buffergator setting
" Use Right side for Buffergator
let g:buffergator_viewport_split_policy = 'R'
" Designate custom key setting
let g:buffergator_suppress_keymaps = 1
" Looper buffers
let g:buffergator_mru_cycle_loop = 1
nmap <leader>qq :BuffergatorMruCyclePrev<cr>
nmap <leader>ww :BuffergatorMruCycleNext<cr>
nmap <leader>bl :BuffergatorOpen<cr>
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>

" Key Setting - resize windows
nnoremap <silent> <leader>= :exe "resize +3"<CR>
nnoremap <silent> <leader>- :exe "resize -3"<CR>
nnoremap <silent> <leader>] :exe "vertical resize +8"<CR>
nnoremap <silent> <leader>[ :exe "vertical resize -8"<CR>

nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>} :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>{ :exe "vertical resize " . (winheight(0) * 2/3)<CR>

" Vim search highlighting
nnoremap <C-l> :nohlsearch<CR><C-l>
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

" delimitMate
let delimitMate_expand_cr=1
augroup vimrc
	autocmd!
	autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END

if has('nvim')
    :tnoremap <A-h> <C-\><C-n><C-w>h
    :tnoremap <A-j> <C-\><C-n><C-w>j
    :tnoremap <A-k> <C-\><C-n><C-w>k
    :tnoremap <A-l> <C-\><C-n><C-w>l
endif
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" To turn off auto-insert of comments
augroup auto_comment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" quick-scope
let g:qs_max_chars=80

highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" AutoSetFileHead
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    " sh
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    " python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunction

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
	normal mZ
	%s/\s\+$//e
	if line("'Z") != line(".")
		echo "Stripped whitespace\n"
	endif
	normal `Z
endfunction

autocmd! BufWritePost ~/.vimrc nested :source ~/.vimrc
