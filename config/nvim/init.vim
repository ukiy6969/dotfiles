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
set runtimepath^=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('$HOME/.config/nvim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/unite.vim')
call dein#add('kmnk/vim-unite-giti')
call dein#add('freeo/vim-kalisi')
call dein#add('tomasr/molokai')
call dein#add('Shougo/deoplete.nvim')
call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')
call dein#add('phildawes/racer')
call dein#add('timonv/vim-cargo')
call dein#add('mattn/webapi-vim')
call dein#add('pangloss/vim-javascript')
call dein#add('itchyny/lightline.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('tpope/vim-fugitive')
call dein#add('cespare/vim-toml')
call dein#add('plasticboy/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
call dein#add('wavded/vim-stylus')
call dein#add('airblade/vim-gitgutter')
call dein#add('scrooloose/syntastic')
call dein#add('mtscout6/syntastic-local-eslint.vim')
call dein#add('ternjs/tern_for_vim')

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

" insertモードから抜ける
"inoremap <silent> <C-[> <ESC>

set showmatch
set matchtime=1

"nnoremap j gj
"nnoremap k gk

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
"nnoremap <Leader>l :noh<CR>

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
colorscheme hybrid
set background=dark
"hi Normal ctermbg=NONE
"hi NonText ctermbg=NONE

" deoplate
let g:deoplete#enable_at_startup = 1
"inoremap <silent><expr> <Tab>
"  \ pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

" javascript
let g:javascript_enable_domhtmlcss = 1
"set foldmethod=syntax

" lightline
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component': {
"      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
"      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"      \ },
"      \ 'component_visible_condition': {
"      \   'readonly': '(&filetype!="help"&& &readonly)',
"      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
"      \ },
"      \ 'separator': { 'left': '⮀', 'right': '⮂' },
"      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"      \ }

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

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'firefox'

inoremap jj <Esc>
inoremap ll <Esc>
inoremap <C-l> l

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
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時にチェックを実行する
let g:syntastic_check_on_open = 1
" :wq で終了する時もチェックする
let g:syntastic_check_on_wq = 0
