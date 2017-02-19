" host python {{{
let g:home = $HOME
let g:python_host_prog = home . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = home . '/.pyenv/versions/neovim3/bin/python'
" }}}

" dein {{{
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"  if no dein.vim, download from github
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

call dein#begin(s:dein_dir)

" dein.toml setting
let g:rc_dir    = expand('~/.config/nvim')
let s:toml      = g:rc_dir . '/dein.toml'
let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

call dein#load_toml(s:toml,      {'lazy': 0})
call dein#load_toml(s:lazy_toml, {'lazy': 1})

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" leader is ','
let g:mapleader = ","
let g:maplocalleader = ","

" }}}

" Default setting {{{
syntax enable

set showcmd
set number
set ruler
set matchtime=1
set hidden
set history=700
set autoindent
set helplang=en
set clipboard=unnamed,unnamedplus
set modifiable
set write
set cursorline
set matchtime=1

" Char Code
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

" Use indentation for folds
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

augroup vimrcFold
  " fold vimrc itself by categories
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END

" Set to auto read when a file is changed from the outside
set autoread

" Leader key timeout
set tm=2000

" Allow the normal use of "," by pressing it twice
noremap ,, ,

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
" WiLd menu info http://boscono.hatenablog.com/entry/2013/11/17/230740
set wildmenu
" Tab-complete files up to longest unambiguous prefix
set wildmode=list:longest,full

" Always show current position
set ruler
set number

" Show trailing whitespace
set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Ambiguous charactor (○,□)
"if exists('&ambiwidth')
"  set ambiwidth=double
"endif

" Remove "Press Enter or type command to continue"
set shortmess=a

" }}}

" Color {{{

let g:hybrid_use_Xresources = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid
set background=dark

" Background transparency
" highlight Normal ctermbg=none

" }}}

" Files, backups and undo {{{

" Turn backup off, since most stuff is in Git anyway...
set nobackup
set nowb
set noswapfile

" Source the vimrc file after saving it
augroup sourcing
  autocmd!
  if has('nvim')
    autocmd bufwritepost init.vim source $MYVIMRC
  else
    autocmd bufwritepost .vimrc source $MYVIMRC
  endif
augroup END

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Show undo tree
nmap <silent> <leader>u :MundoToggle<CR>

" Fuzzy find files
nnoremap <silent> <Leader><space> :CtrlP<CR>
let g:ctrlp_max_files=0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git|.cabal-sandbox|.stack-work)$' }

" }}}

" Text, tab and indent related {{{

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Copy and paste to os clipboard
nmap <leader>y "*y
vmap <leader>y "*y
nmap <leader>d "*d
vmap <leader>d "*d
nmap <leader>p "*p
vmap <leader>p "*p

" }}}

" Visual mode related {{{

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" }}}

" Moving around, tabs, windows and buffers {{{

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

" Disable highlight when <leader><cr> is pressed
" but preserve cursor coloring
nmap <silent> <leader><cr> :noh\|hi Cursor guibg=red<cr>

" Return to last edit position when opening files (You want this!)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END
" Remember info about open buffers on close
set viminfo^=%

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" Manually create key mappings (to avoid rebinding C-\)
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" don't close buffers when you aren't displaying them
set hidden

" previous buffer, next buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>

" close every window in current tabview but the current
nnoremap <leader>bo <c-w>o

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>

" fuzzy find buffers
noremap <leader>b<space> :CtrlPBuffer<cr>

" Neovim terminal configurations
if has('nvim')
  " Use <Esc> to escape terminal insert mode
  tnoremap <Esc> <C-\><C-n>
  " Make terminal split moving behave like normal neovim
  tnoremap <c-h> <C-\><C-n><C-w>h
  tnoremap <c-j> <C-\><C-n><C-w>j
  tnoremap <c-k> <C-\><C-n><C-w>k
  tnoremap <c-l> <C-\><C-n><C-w>l
endif


" }}}

" Status line {{{

" Always show the status line
set laststatus=2

" }}}

" Spell checking {{{

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" }}}

" Helper functions {{{

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" }}}

" ect {{{
au BufNewFile,BufRead *.ect setf html "
" }}}

" Keymap {{{
inoremap <silent> jj <Esc>
inoremap <silent> っj <Esc>
inoremap <C-j> j

nnoremap <Leader>s :<C-u>sp<CR>
nnoremap <Leader>v :<C-u>vs<CR>

" Force redraw
map <silent> <leader>r :redraw!<CR>

nnoremap <Leader>t :VimFilerTab<CR>

" VimFiler
nnoremap <silent> <localleader>fe :VimFilerExplorer<CR>
nnoremap <silent> <localleader>ff :VimFilerBufferDir<CR>

" noh
" nnoremap <C-l> :noh<C-l><CR>

" Unite
nnoremap <silent><Leader>b :Unite buffer<CR>
nnoremap <silent><Leader>o :UniteWithBufferDir -buffer-name=files file <CR>
nnoremap <silent><Leader>gs :Unite giti/status <CR>
nnoremap <silent><Leader>gp :Unite grep <CR>

" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" rust
nnoremap <silent> <localleader>gr :CargoBuild<CR>

 " giti
nmap <Space>gd <SID>(git-diff-cached)
nmap <Space>gD <SID>(git-diff)
nmap <Space>gf <SID>(git-fetch-now)
nmap <Space>gF <SID>(git-fetch)
nmap <Space>gp <SID>(git-push-now)
nmap <Space>gP <SID>(git-pull-now)
nmap <Space>gl <SID>(git-log-line)
nmap <Space>gL <SID>(git-log)

" unite prefix key
nnoremap [unite] <Nop>
nmap <Leader>. [unite]

nmap [unite]gg    <SID>(giti-sources)
nmap [unite]gst   <SID>(git-status)
nmap [unite]gb    <SID>(git-branch)
nmap [unite]gB    <SID>(git-branch_all)
nmap [unite]gc    <SID>(git-config)
nmap [unite]gl    <SID>(git-log)
nmap [unite]gL    <SID>(git-log-this-file)

" }}}

" giti {{{
if globpath(&rtp, 'plugin/giti.vim') != ''
  let g:giti_log_default_line_count = 100
  nnoremap <expr><silent> <SID>(git-diff)        ':<C-u>GitiDiff ' . expand('%:p') . '<CR>'
  nnoremap <expr><silent> <SID>(git-diff-cached) ':<C-u>GitiDiffCached ' . expand('%:p') .  '<CR>'
  nnoremap       <silent> <SID>(git-fetch-now)    :<C-u>GitiFetch<CR>
  nnoremap       <silent> <SID>(git-fetch)        :<C-u>GitiFetch
  nnoremap <expr><silent> <SID>(git-push-now)    ':<C-u>GitiPushWithSettingUpstream origin ' . giti#branch#current_name() . '<CR>'
  nnoremap       <silent> <SID>(git-push)         :<C-u>GitiPush
  nnoremap       <silent> <SID>(git-pull-now)     :<C-u>GitiPull<CR>
  nnoremap       <silent> <SID>(git-pull)         :<C-u>GitiPull
  nnoremap       <silent> <SID>(git-log-line)     :<C-u>GitiLogLine ' . expand('%:p') . '<CR>'
  nnoremap       <silent> <SID>(git-log)          :<C-u>GitiLog ' . expand('%:p') . '<CR>'

  nnoremap <silent> <SID>(giti-sources)   :<C-u>Unite giti<CR>
  nnoremap <silent> <SID>(git-status)     :<C-u>Unite giti/status<CR>
  nnoremap <silent> <SID>(git-branch)     :<C-u>Unite giti/branch<CR>
  nnoremap <silent> <SID>(git-branch_all) :<C-u>Unite giti/branch_all<CR>
  nnoremap <silent> <SID>(git-config)     :<C-u>Unite giti/config<CR>
  nnoremap <silent> <SID>(git-log)        :<C-u>Unite giti/log<CR>

  nnoremap <silent><expr> <SID>(git-log-this-file) ':<C-u>Unite giti/log:' . expand('%:p') . '<CR>'
endif
" }}}

" ghcmod.vim {{{
" Type of expression under cursor
nmap <silent> <leader>ht :GhcModType<CR>
" Insert type of expression under cursor
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
" GHC errors and warnings
nmap <silent> <leader>hc :Neomake ghcmod<CR>

map <silent> <leader>hr :call ApplyOneSuggestion()<CR>
map <silent> <leader>hR :call ApplyAllSuggestions()<CR>

" Haskell Lint
nmap <silent> <leader>hl :Neomake hlint<CR>
" }}}

" Hoogle {{{
" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>
" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle 
" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>
" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo 
" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>
" }}}
"
" Tags {{{
set tags=tags;/
set cst
set csverb
" }}}

" Conceal {{{
" Use same color behind concealed unicode characters
hi clear Conceal

" Pretty unicode haskell symbols
let g:haskell_conceal_wide = 1
let g:haskell_conceal_enumerations = 1
let hscoptions="𝐒𝐓𝐄𝐌xRtB𝔻w"

" }}}

" Markdown {{{
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'firefox'
" }}}

" Tex {{{
let g:syntastic_tex_checkers = ['']
" }}}

" Haskell {{{

" Use hindent instead of par for haskell buffers
autocmd FileType haskell let &formatprg="hindent --tab-size 2 -XQuasiQuotes"

" Fix path issues from vim.wikia.com/wiki/Set_working_directory_to_the_current_file
let s:default_path = escape(&path, '\ ') " store default value of 'path'
" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path

" Use one of the below settings and :Neomake.
let g:neomake_haskell_enabled_makers = ['hdevtools']
let g:neomake_haskell_enabled_makers = ['ghcmod']

augroup haskell
  autocmd!
  autocmd FileType haskell map <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END

" Disable hlint-refactor-vim's default keybindings
let g:hlintRefactor#disableDefaultKeybindings = 1

" hlint-refactor-vim keybindings
map <silent> <leader>hr :call ApplyOneSuggestion()<CR>
map <silent> <leader>hR :call ApplyAllSuggestions()<CR>

" Show types in completion suggestions
let g:necoghc_enable_detailed_browse = 1
" Resolve ghcmod base directory
au FileType haskell let g:ghcmod_use_basedir = getcwd()
" }}}

" Point Conversion {{{

function! Pointfree()
  call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h. :call Pointfree()<CR>

function! Pointful()
  call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h> :call Pointful()<CR>

" }}}
