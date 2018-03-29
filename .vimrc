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

set history=1000            " change history to 1000
set textwidth=500
set nrformats=

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/The-NERD-Tree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
" Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'joshdick/onedark.vim'
Plug 'gerw/vim-HiLinkTrace'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'avelino/vim-bootstrap-updater'
" Additional syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json'
" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'
call plug#end()

filetype off                " required
let loaded_matchparen=1     " don't load matchit.vim (paren/bracket matching)
let html_no_rendering=1     " don't render italic, bold, links in HTML

set noshowmatch             " don't match parentheses/brackets
set nocursorline            " don't paint cursor line
set nocursorcolumn          " don't paint cursor column
set number                  " no show line numbers

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
	set ttyfast				" faster redrawing
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
set lazyredraw	            " don't redraw while executing macros

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

" Change cursor shape
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set errorformat=%f:%l:\ %m

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_python_checkers=['flake8', 'dev']

" flake8 setting
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
let g:flake8_show_in_file=1		" show
let g:flake8_max_markers=500	" maximum # of markers to show(500 is default)

if has('nvim')
	" show results of substition as they're happening
	" but don't open a split
	set inccommand=nosplit
endif

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
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
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
set synmaxcol=300
syntax sync minlines=256
colorscheme onedark              " Set the colorscheme

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline#extensions#tabline#fnamemod = ':t' " print only filename on the tap
let g:airline_powerline_fonts = 1

" python syntax
let g:python_highlight_all = 1

" devicons
" set font terminal font or set gui vim font to a Nerd Font (https://github.com/ryanoasis/nerd-fonts):
set encoding=utf8
" set fillchars+=stl:\ ,stlnc:\
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set termencoding=utf-8
" testing rounded separators (extra-powerline-symbols):
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_left_alt_sep = ""

" set the CN (column number) symbol:
" let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}/['%L']' . "\uE0A3" . '%{col(".")}'])
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}/%L ' . "\uE0A3" . '%{col(".")}'])

let g:airline_theme = 'onedark'

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermbg=none ctermfg=8
highlight NonText ctermbg=none ctermfg=8
" highlight Comment cterm=italic
" highlight htmlArg cterm=italic

" make the highlighting of background transparent
highlight Normal guibg=NONE ctermbg=NONE  " This line needs to go below the colorscheme
autocmd VimEnter * hi Normal ctermbg=NONE

" let g:onedark_termcolors=256
" let g:onedark_terminal_italics=1

" loading the plugin
let g:webdevicons_enable = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

" Key Settings
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
let mapleader = ","
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" NERDTree On shortcut
nnoremap <leader>nt <ESC>:NERDTree<CR>
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

" CtrlP setting
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
map <f12> :!start /min ctags -R .<cr>

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
"let g:buffergator_mru_cycle_loop = 1
nmap <leader>qq :BuffergatorMruCyclePrev<cr>
nmap <leader>ww :BuffergatorMruCycleNext<cr>
nmap <leader>bl :BuffergatorOpen<cr>
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>
nmap <leader>bd :1,100bd<CR>
nmap <leader>bdq : 1,100bd<CR>:q!<CR>

" Clipboard copy/paste
map <F3> "+Y<CR>
map <F4> "+gP<CR>
vmap <F3> "+Y<CR>
vmap <F4> "+gP<CR>
vnoremap <C-c> "*y<CR>
imap <F4> <ESC>"+gP<CR>
imap <C-D> <C-0>x

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

" YouCompleteMe
" let g:ycm_key_list_select_completion=['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion=['<C-k>', '<Up>']
" let g:ycm_autoclose_preview_window_after_completion=1

" nnoremap <leader>g:YcmCompleter GoTo<CR>
" nnoremap <leader>gg:YcmCompleter GoToImprecise<CR>
" nnoremap <leader>d:YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>t:YcmCompleter GetType<CR>
" nnoremap <leader>p:YcmCompleter GetParent<CR>

" YouCompleteMe Fix
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

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

" Removes trailing spaces
function TrimWhiteSpace()
	%s/\s*$//
	''
endfunction
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()
map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>
