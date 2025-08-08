" Vim-Plug {{{
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'SirVer/ultisnips'
Plug 'kovisoft/slimv'
Plug 'Julian/lean.nvim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
call plug#end()
" }}}

" OPTIONS {{{

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set breakindent

" Commands
set showcmd
set showmatch
set cmdheight=2

" Search
set incsearch

" Folds
set foldenable
set foldlevelstart=8

" Line numbers
set number
set relativenumber
set numberwidth=5

" Swap file
set updatetime=300
set shortmess+=c

" Colors
set termguicolors
set background=dark
set t_Co=256
colorscheme srcery

" Other stuff
set encoding=utf-8
set hidden
set nowrap
set autoread
set textwidth=80
set signcolumn=yes

" Cursor {{{
set cursorline
set scrolloff=20
" }}}

" }}}

" STATUSLINE {{{
set laststatus=2

" Airline {{{

let g:airline_detect_paste = 0
let g:airline_detect_crypt = 0
let g:airline_detect_spell = 0
let g:airline_detect_iminsert = 0
let g:airline_inactive_collapse = 1
let g:airline_inactive_alt_sep = 0

let g:airline_highlighting_cache = 1

let g:airline_section_z = 'Buf:%n %4l:%02v/%L'
let g:airline_section_warning = ''

let g:airline#extensions#vimtex#enabled = 1
let g:airline#extensions#vimtex#continuous = "c"
" }}}
" }}}

" UltiSnips {{{
let g:UltiSnipsJumpForwardTrigger = "<C-N>"
let g:UltiSnipsJumpBackwardTrigger = "<C-P>"
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
" }}}

" MAPPINGS {{{

let g:mapleader = '\'
let g:maplocalleader = ','

" Some stuf regarding <C-j> {{{
" https://stackoverflow.com/questions/9092982/mapping-c-j-to-something-in-vim
let g:BASH_Ctrl_j = "off"
augroup ctrl_j_fix
    autocmd!
    autocmd VimEnter * unmap <C-j>
    " autocmd VimEnter * noremap <C-j> <C-w>j
augroup END
" }}}

" Moving lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Easy vimrc editing
nnoremap <Leader>ev :split ~/dotfiles/vimrc<CR>
nnoremap <Leader>sv :so $MYVIMRC<CR>

" Easy duan.sty editing
nnoremap <Leader>ed :split ~/texmf/tex/latex/duan/duan.sty<CR>

" Switch buffers
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>

" Clear search highlighting
nnoremap <nowait><silent> <C-C> :noh<CR>

" Surround with quotes
nnoremap <Leader>" bi"<ESC>ea"<ESC>
vnoremap <Leader>" <ESC>`<i"<ESC>`>a"<ESC>
nnoremap <Leader>' bi'<ESC>ea'<ESC>
vnoremap <Leader>' <ESC>`<i'<ESC>`>a'<ESC>

" Operator mappings {{{
" inside next (), inside last/previous (), similar for 'a' and []
onoremap in( :<C-U>normal! f(vi(<CR>
onoremap an( :<C-U>normal! f(va(<CR>
onoremap il( :<C-U>normal! F)vi(<CR>
onoremap al( :<C-U>normal! F)va(<CR>
onoremap in[ :<C-U>normal! f[vi[<CR>
onoremap an[ :<C-U>normal! f[va[<CR>
onoremap il[ :<C-U>normal! F]vi[<CR>
onoremap al[ :<C-U>normal! F]va[<CR>
" }}}

" The big jk {{{
" Courtesy of u/jessekelighine
" https://www.reddit.com/r/vim/comments/ufgrl8/journey_to_the_ultimate_imap_jk_esc/
" Map key chord `jk` to <ESC>
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function JKescape(key)
    if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
    if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
    let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
    return (l:timediff <= 0.1 && l:timediff >= 0.001) ? "\b\e" : a:key
endfunction
inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')
" }}}

" https://stackoverflow.com/questions/4298910/vim-close-buffer-but-not-split-window
" Closes buffer but keeps window split
nnoremap <leader>d :b#<bar>bd#<CR>

" Abbreviations {{{
iabbrev @@ fluffy_pentacorns@hotmail.com
iabbrev nname Alan Duan
iabbrev traingle triangle
" }}}
"
" }}}

" AUTOCOMMANDS {{{

augroup filetype_python
    autocmd! 
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
augroup END

augroup filetype_md
    autocmd!
    " Text objects for headings
    autocmd FileType markdown onoremap ih
    \ :<c-u>execute "normal! ?^\\(==\\+\\\\|--\\+\\)$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown onoremap ah
    \ :<c-u>execute "normal! ?^\\(==\\+\\\\|--\\+\\)$\r:nohlsearch\rg_vk0"<cr>
augroup END

augroup filetype_html
    autocmd!
    autocmd FileType svelte,html setlocal textwidth=0
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_lisp
    autocmd!
    " Temp fix until https://github.com/neovim/neovim/issues/24003 is resolved
    autocmd FileType lisp source ~/.local/share/nvim/plugged/slimv/ftplugin/lisp/slimv-lisp.vim

" }}}

" Slimv
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.quicklisp/dists/quicklisp/software/slime-v2.28/start-swank.lisp &'

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
                              \. " <C-R>=UltiSnips#ExpandSnippetOrJump()<cr>"
