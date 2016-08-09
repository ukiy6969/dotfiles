" host python
let g:home = $HOME
let g:python_host_prog = home . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = home . '/.pyenv/versions/neovim3/bin/python'

" rust
set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let $RUST_SRC_PATH = "$HOME/tmp/rustc-1.8.0/src/"
let g:rustfmt_autosave = 1

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
set autochdir
set modifiable
set write
set wrap
set cursorline
set showmatch
set matchtime=1

" Char Code
set encoding=utf-8
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

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
let mapleader = "\<Space>"

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
nnoremap <Leader>n gt
nnoremap <Leader>p gT

" noh
nnoremap <C-l> :noh<C-l><CR>

" NERDTree
let NERDTreeQuitOnOpen=1
nnoremap <silent> <Leader>f :NERDTreeToggle<CR>

" Unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
nnoremap <silent><Leader>b :Unite buffer<CR>
nnoremap <silent><Leader>o :UniteWithBufferDir -buffer-name=files file <CR>
nnoremap <silent><Leader>gs :Unite giti/status <CR>

" Color
let g:hybrid_use_Xresources = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid
set background=dark

" deoplate
let g:deoplete#enable_at_startup = 1

" javascript
let g:javascript_enable_domhtmlcss = 1
"set foldmethod=syntax

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" javascript
let g:syntastic_javascript_checkers=['eslint']
" エラー行に sign を表示
let g:syntastic_enable_signs = 1
" location list を常に更新
let g:syntastic_always_populate_loc_list = 0
" location list を常に表示
let g:syntastic_auto_loc_list = 1
" ファイルを開いた時にチェックを実行する
let g:syntastic_check_on_open = 1
" :wq で終了する時もチェックする
let g:syntastic_check_on_wq = 0
