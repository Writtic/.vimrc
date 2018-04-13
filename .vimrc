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
let plugins = ['vim-scripts/The-NERD-Tree',
			\'vim-airline/vim-airline',
			\'vim-airline/vim-airline-themes',
			\'ryanoasis/vim-devicons',
			\'airblade/vim-gitgutter',
			\'scrooloose/syntastic',
			\'ctrlpvim/ctrlp.vim',
			\'joshdick/onedark.vim',
			\'gerw/vim-HiLinkTrace',
			\'nvie/vim-flake8',
			\'jeetsukumaran/vim-buffergator',
			\'scrooloose/nerdcommenter',
			\'sheerun/vim-polyglot',
			\'vim-scripts/ReplaceWithRegister',
			\'bronson/vim-trailing-whitespace',
			\'Raimondi/delimitMate']
call plug#begin('~/.vim/plugged')
for plugin in plugins
	Plug plugin
endfor
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
set lazyredraw            " don't redraw while executing macros

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
if !has('nvim')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" vim-flake8
au FileType python map <buffer>fl :call Flake8()<CR>
au FileType make setlocal noexpandtab
let g:flake8_show_in_file=1     " show
let g:flake8_max_markers=500    " maximum # of markers to show(500 is default)

" Folding based on indentation
au FileType python set foldmethod=indent

" Python indentation like PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 softtabstop=2 shiftwidth=2

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Indent Python in the Google way.

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)
  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif
  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)
endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

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

" python syntax
let g:syntastic_python_checkers = ['flake8']
let g:polyglot_disables = ['python']
let g:python_highlight_all = 1


syntax on
set synmaxcol=200
syntax sync minlines=256
colorscheme onedark			  " Set the colorscheme

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline#extensions#tabline#fnamemod = ':t' " print only filename on the tap
let g:airline_powerline_fonts = 1

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

" To turn off auto-insert of comments
augroup auto_comment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction
autocmd BufWritePre *.py,*.cpp,*.hpp,*.i :call StripTrailingWhitespace()
