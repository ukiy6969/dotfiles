" host python
let g:home = $HOME
let g:python_host_prog = home . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = home . '/.pyenv/versions/neovim3/bin/python'

" dein
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
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

syntax enable

set showcmd
set number
set ruler
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set matchtime=1
set incsearch
set hlsearch
set lazyredraw
set magic
set nowrap
set showmatch
set whichwrap=h,l
set nowrapscan
set ignorecase
set smartcase
set hidden
set history=2000
set autoindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set helplang=en
set clipboard=unnamed,unnamedplus
set modifiable
set write
set wrap
set cursorline
set showmatch
set matchtime=1

" Char Code
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

" Color
let g:hybrid_use_Xresources = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid
set background=dark

" 背景透過
highlight Normal ctermbg=none

" ect
au BufNewFile,BufRead *.ect setf html "

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" Keymap
inoremap jj <Esc>
inoremap ll <Esc>
inoremap <C-l> l

" leader is space
let g:mapleader = ","
let g:maplocalleader = ","

nnoremap <Leader>s :<C-u>sp<CR>
nnoremap <Leader>v :<C-u>vs<CR>

nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L
nnoremap <Leader>H <C-w>H
nnoremap <Leader>t :<C-u>tabnew<CR>
nnoremap J gt
nnoremap K gT

" VimFiler
nnoremap <silent> <localleader>fe :VimFilerExplorer<CR>
nnoremap <silent> <localleader>ff :VimFilerBufferDir<CR>

" noh
nnoremap <C-l> :noh<C-l><CR>

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

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'firefox'

" Tex
let g:syntastic_tex_checkers = ['']
