"    _      _ __        _
"   (_)__  (_) /_ _  __(_)_ _
"  / / _ \/ / __/| |/ / /  ' \
" /_/_//_/_/\__(_)___/_/_/_/_/

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

set nocompatible            " not compatible with vi
set autoread                " detect when a file is changed
set langmenu=en_US.UTF-8

set history=800            " change history to 1000
set textwidth=250
set re=1
syntax on

if has('nvim')
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
else
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Specify a directory for plugins
if has('nvim')
	call plug#begin('~/.local/share/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif
	" git
	Plug 'tpope/vim-fugitive'					" The git things
	Plug 'airblade/vim-gitgutter'				" +/-/~ signs in the gutter
	Plug 'gregsexton/gitv', {'on': ['Gitv']}	" :Gitv is a bit like tig

    " highlight
    Plug 'gerw/vim-HiLinkTrace'

    " theme
    Plug 'joshdick/onedark.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" tmux
	Plug 'tmux-plugins/vim-tmux-focus-events'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'benmills/vimux'
	Plug 'benmills/vimux-golang'

    " utils
	Plug 'junegunn/vim-peekaboo'			" \" / @ / ctrl-r can show register
	Plug 'ervandew/supertab'
    Plug 'Raimondi/delimitMate'				" Automatic closing of quotes, parenthesis, brackets, etc.
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Shougo/echodoc.vim'

	" tpope
	Plug 'tpope/vim-surround'          " Operate on surrounding 
	Plug 'tpope/vim-speeddating'       " Increment dates
	Plug 'tpope/vim-repeat'            " Repeat plugins
	Plug 'tpope/vim-commentary'        " Comment out blocks
	Plug 'tpope/vim-abolish'           " Flexible search
	Plug 'tpope/vim-jdaddy'            " JSON text object
	Plug 'tpope/vim-obsession'         " Continuously save buffer state
	Plug 'tpope/vim-tbone'			   " :Tyank, :Tput use buffer on tmux 

	" text objects and editing
	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-entire'
	Plug 'vim-scripts/argtextobj.vim'
	Plug 'michaeljsmith/vim-indent-object'
	Plug 'bkad/CamelCaseMotion'
	Plug 'glts/vim-textobj-comment'         " Use text object with 'c'
	Plug 'jeetsukumaran/vim-indentwise'

	" navigation and fuzzy
    Plug 'ctrlpvim/ctrlp.vim'				" Find files faster by name
    Plug 'vim-scripts/The-NERD-Tree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'sunaku/vim-shortcut'				" Searchable key mappings
    Plug 'ryanoasis/vim-devicons'			" Icons for NERDTree etc
    Plug 'jeetsukumaran/vim-buffergator'	" Buffer listing
	Plug 'unblevable/quick-scope'

	" json
	Plug 'elzr/vim-json'

	" python
	Plug 'davidhalter/jedi-vim'

	" go
	Plug 'godoctor/godoctor.vim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	if has('nvim')
		Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
	else
		Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
	endif
	Plug 'Shougo/vimshell'
	Plug 'sebdah/vim-delve'
	Plug 'buoto/gotests-vim'

	" Ctags / Cscope
	if has('nvim')
		Plug 'ludovicchabant/vim-gutentags'
		Plug 'skywind3000/gutentags_plus'
		Plug 'skywind3000/vim-preview'
	endif
	
	" html
	Plug 'alvan/vim-closetag'

	" javascript
	Plug 'pangloss/vim-javascript'

	" vue
	Plug 'posva/vim-vue'

    " linter
    Plug 'w0rp/ale'

    " deoplete auto completion
	if has('nvim')
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
	Plug 'zchee/deoplete-clang'
	Plug 'zchee/deoplete-go', { 'do': 'make' }
	Plug 'zchee/deoplete-jedi'

	" snippets
	Plug 'SirVer/ultisnips' " Track the engine.
	Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them:

	Plug 'thanthese/Tortoise-Typing'
call plug#end()

filetype plugin on
let loaded_matchparen=1     " don't load matchit.vim (paren/bracket matching)
" let html_no_rendering=1     " don't render italic, bold, links in HTML

set noshowmatch             " don't match parentheses/brackets
set nocursorline            " don't paint cursor line
set nocursorcolumn          " don't paint cursor column
set number                  " show line numbers

set nowrap                  " turn on line wrapping
set wrapmargin=0            " wrap lines when coming within n characters from side
set formatoptions=l

set autoindent              " automatically set indent of new line
set smartindent

set updatetime=100

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

" neocomplete like
set completeopt=longest,menuone
set completeopt-=preview

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
set shortmess+=c
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=3             " lines of text around cursor
set shell=$SHELL
set cmdheight=2             " command bar height
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
set backspace=2 " make backspace work like most other programs

if has('nvim')
	" show results of substition as they're happening
	" but don't open a split
	set inccommand=nosplit
endif

" Configuration -------------------------------------------------------------

" FastEscape {{{
" Speed up transition from modes
if !has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" }}}

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
	let &t_SR .= "\<Esc>[3 q"
	" common - block
	let &t_EI .= "\<Esc>[3 q"
elseif ( has("termguicolors") )
	" set Vim-specific sequences for RGB colors
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set synmaxcol=128
syntax sync minlines=256
colorscheme onedark        	  " Set the colorscheme

" Key Settings
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
let g:mapleader = ","

" Move
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie
imap <silent> <S-Left> <C-o><Plug>CamelCaseMotion_b
imap <silent> <S-Right> <C-o><Plug>CamelCaseMotion_w

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" y$ -> Y Make Y behave like other capitals
map Y y$

" copy the selected area to clipboard
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
imap ,w <esc>:w<CR>

" Select another file from the directory of the current one
nnoremap <leader>F :execute 'edit' expand("%:p:h")<cr>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

if has('nvim')
	set t_kb=^V<BS>
	set t_kD=^V<DEL>
endif

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

nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine
xmap <Leader>r  <Plug>ReplaceWithRegisterVisual

" Leader lt maps to last tab
let g:lasttab = 1
nmap <Leader>lt :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

" devicons
" set font terminal font or set gui vim font to a Nerd Font (https://github.com/ryanoasis/nerd-fonts):
set encoding=utf8
set fileencodings=utf-8
set bomb
set binary
set termencoding=utf-8

" Jump between errors in quickfix list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Golang settings
let g:go_def_mode = 'godef'
let g:go_decls_includes = "func"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_version_warning = 0
let g:go_auto_type_info = 1
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_deadline = "5s"

function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

au BufEnter * silent! lcd %:p:h

" augroup go
	" autocmd!
	" au FileType go nmap <leader>gr <Plug>(go-run)
	au FileType go nmap <leader>gi <Plug>(go-info)
	" au FileType go nmap <leader>gp <Plug>(go-play)
	" au FileType go nmap <leader>gt :GoDeclsDir<CR>
	" au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
	" au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
	" au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
	" au FileType go nmap <F9> :GoCoverageToggle -short<CR>
	" au FileType go nmap <F10> :GoTest -short<CR>
	" au FileType go nmap <F12> <Plug>(go-def-tab)
	" au FileType go nmap <leader>gm :GoImports<CR>

	" :GoAlternate  commands :A, :AV, :AS and :AT
	" au FileType go nmap <leader>gd :DlvDebug<CR>
	" au FileType go nmap <leader>gs :DlvToggleBreakpoint<CR>
	" au FileType go nmap <leader>gx :DlvToggleTracepoint<CR>
	" au FileType go nmap <leader>gg :DlvClearAll<CR>
" augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
au FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>

" Magit setting
let g:magit_default_fold_level = 0

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " turn on buffer list
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t' " print only filename on the tap
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline_extensions = ['branch', 'tabline', 'ale']
let g:airline_powerline_fonts = 1

" testing rounded separators (extra-powerline-symbols):
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_left_alt_sep = ""

" set the CN (column number) symbol:
let g:airline_theme = 'onedark'

" python syntax
let g:python_highlight_builtins = 1
let g:python_highlight_builtin_objs = 1
let g:python_highlight_builtin_funcs = 1
let g:python_highlight_builtin_funcs_kwarg = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_templates = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_file_headers_as_comments = 0

" python settings
if !has('nvim')
	set pyxversion=3
endif
let g:python_host_prog = $HOME. '/.pyenv/versions/2.7.11/envs/nvim2/bin/python2.7'
let g:python3_host_prog = $HOME. '/.pyenv/versions/3.6.5/envs/nvim3/bin/python3'

" json settings
let g:vim_json_syntax_conceal = 0 

" Skip the check of neovim module
let g:python3_host_skip_check = 1


" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_ignore_case = 1

let g:echodoc#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 300

" deoplete-clang
if has('mac')
	let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
	let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/lib/clang'
else
	let g:deoplete#sources#clang#libclang_path = $HOME. '/.pyenv/versions/miniconda3-latest/lib/libclang.so'
	let g:deoplete#sources#clang#clang_header = $HOME. '/.pyenv/versions/miniconda3-latest/lib/clang'
endif
let g:deoplete#sources#clang#std = {'c': 'c11', 'cpp': 'c++14', 'objc': 'c11', 'objcpp': 'c++1z'}

" deoplete-golang
if has('mac')
    let g:deoplete#sources#go#gocode_binary = $HOME. '/go/bin/gocode'
else
    let g:deoplete#sources#go#gocode_binary = '/kakao/go/bin/gocode'
endif
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" deoplete-jedi(python)
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = "<Tab>"
au FileType *.py let g:jedi#goto_command = "<C-]>"

let g:deoplete#sources#jedi#popup_select_first = 1
let g:deoplete#sources#jedi#show_call_signatures = 1
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#python_path = $HOME. '/.pyenv/shims/python'

" vim-vue
let g:vue_disable_pre_processors = 1
au FileType javascript setlocal shiftwidth=2 tabstop=2
au FileType html       setlocal shiftwidth=2 tabstop=2
au FileType vue syntax sync fromstart
au BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" ale
nnoremap <silent> <M-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <M-j> <Plug>(ale_next_wrap)

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline
let g:airline#extensions#ale#enabled = 1
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_lint_delay = 1000
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

let g:ale_linters = {'python': ['flake8'],
					\'C': ['gcc', 'clang','cpplint'],
					\'C++': ['gcc', 'clang','cpplint'],
					\'go': ['gometalinter'],
					\'javascript': ['prettier'],
					\'bash': ['shell -n flag'],
					\'JSON': ['jsonlint'],
					\'Vue': ['vls']}
let g:ale_fixers = {'python': ['autopep8'],
				   \'C': ['gcc'],
				   \'C++': ['gcc'],
				   \'go': ['goimports'],
				   \'javascript': ['eslint'],
				   \'JSON': ['jq'],
				   \'Vue': ['vls']}

" Ale python
let g:ale_python_flake8_executable = 'pipenv'
let g:ale_python_autopip8_executable = 'pipenv'

nmap <silent> <leader>k :ALEFix<CR>

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 1
let g:ale_list_window_size = 5  " Show 5 lines of errors (default: 10)
let g:ale_lint_on_text_changed = 'never'  " Remove lag
let g:ale_lint_on_enter = 0  " no linting on entering file

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermbg=none ctermfg=8
highlight NonText ctermbg=none ctermfg=8

" make the highlighting of background transparent
" This line needs to go below the colorscheme
highlight Normal guibg=NONE ctermbg=NONE
autocmd VimEnter * hi Normal ctermbg=NONE

" loading the plugin
let g:webdevicons_enable = 1
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

autocmd FileType nerdtree setlocal nolist
" let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:webdevicons_enable_nerdtree = 1  " adding the flags to NERDTree

let g:NERDSpaceDelims = 1		 	   " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1		   " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1		   " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 0   " Enable trimming of trailing whitespace when uncommenting

" NERDTree On shortcut
nnoremap <leader>nt <ESC>:NERDTree<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "✚",
    \ "Untracked" : "U",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "*",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Ctrl
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'

" Ctrl-j/k inserts blank line below/above.
nnoremap <silent> <C-j><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <C-k><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Insert single space in normal mode
nnoremap <space> i<space><Esc>l

" Mapping Esc to Ctrl-c
map <C-c> <Esc>

" CtrlP setting
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<CR>
nmap <leader>bb :CtrlPBuffer<CR>
nmap <leader>bm :CtrlPMixed<CR>
nmap <leader>bs :CtrlPMRU<CR>

" Tabs setting
nnoremap <leader>11 :tabprevious<CR>
nnoremap <leader>22 :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
let notabs = 0
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>

" Ctags
" map <f12> :!start /min ctags -R .<CR>
if has('nvim')
	" enable gtags module
	let g:gutentags_modules = ['ctags', 'gtags_cscope']
	" config project root markers.
	let g:gutentags_project_root = ['.git']
	" generate datebases in my cache directory, prevent gtags files polluting my project
	let g:gutentags_cache_dir = expand('~/.cache/tags')
	" forbid gutentags adding gtags databases
	let g:gutentags_auto_add_gtags_cscope = 0
endif

noremap <M-u> :PreviewScroll -1<CR>
noremap <M-d> :PreviewScroll +1<CR>
inoremap <M-u> <c-\><c-o>:PreviewScroll -1<CR>
inoremap <M-d> <c-\><c-o>:PreviewScroll +1<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

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
let g:buffergator_viewport_split_policy = 'R' " Use Right side for Buffergator
let g:buffergator_suppress_keymaps = 1 " Designate custom key setting
let g:buffergator_mru_cycle_loop = 1 " Looper buffers
nmap <leader>qq :BuffergatorMruCyclePrev<CR>
nmap <leader>ww :BuffergatorMruCycleNext<CR>
nmap <leader>bl :BuffergatorOpen<CR>
nmap <leader>T :enew<CR>
nmap <leader>bq :bp <BAR> bd #<CR>

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
nnoremap <silent> <M-l> :nohlsearch<CR>
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

" delimitMate
let delimitMate_expand_cr=1
augroup vimrc
	autocmd!
	autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END

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

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" quick-scope
let g:qs_max_chars=128

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
        call append(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunction


" Workspace Setup
" ----------------
" Window split settings
highlight TermCursor ctermfg=red guifg=red
set splitbelow
set splitright

" Terminal settings
tnoremap <Leader><Esc> <C-\><C-n>

" Windlow navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
	func! s:maybeInsertMode(direction)
		stopinsert
		execute "wincmd" a:direction

		if &buftype == 'terminal'
			startinsert!
		endif
	endfunc

	execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc

for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
endfor
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

autocmd! BufWritePost ~/.vimrc nested :source ~/.vimrc
