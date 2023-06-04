" Display a cat
"echo "      \\    /\\\n       )  ( ')\n      (  /  )\n       \\(__)|\nHello!"

" Vim-Plug {{{
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-obsession', { 'on': 'Obsess' }
Plug 'lervag/vimtex'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'kovisoft/slimv'
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

" Cursor {{{
set cursorline
" hi CursorLine cterm=None ctermbg=234 guibg=NONE guifg=NONE
set scrolloff=20
" }}}

" }}}

" STATUSLINE {{{
set laststatus=2
" set statusline=%4*\ %.20f%*                   " File name
" set statusline+=%2*\ %m%r%*%3*%y%*            " Flags (modified, readonly, file type)
" set statusline+=%1*%=%*                       " Right align 
" set statusline+=%3*%{&fenc?&fenc:&enc}%*      " Encoding
" set statusline+=%2*\ [%{&ff}]%*               " File format
" set statusline+=%4*\ \ Buf:%n%*               " Buffer number
" set statusline+=%1*\ %4l:%02v%*%2*/%L%*       " line:col/total line

" hi User1 ctermfg=148 ctermbg=232
" hi User2 ctermfg=124 ctermbg=232
" hi User3 ctermfg=127 ctermbg=232
" hi User4 ctermfg=28 ctermbg=232

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

" VimTex {{{
let g:vimtex_syntax_conceal = {
          \ 'accents': 1,
          \ 'ligatures': 1,
          \ 'cites': 0,
          \ 'fancy': 1,
          \ 'spacing': 0,
          \ 'greek': 1,
          \ 'math_bounds': 0,
          \ 'math_delimiters': 1,
          \ 'math_fracs': 0,
          \ 'math_super_sub': 1,
          \ 'math_symbols': 1,
          \ 'sections': 0,
          \ 'styles': 0,
          \}

let g:vimtex_indent_on_ampersands = 0
let g:vimtex_view_enabled = 0
let g:vimtex_fold_enabled = 1
" }}}

" UltiSnips {{{
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

" Abbreviations {{{
iabbrev @@ fluffy_pentacorns@hotmail.com
iabbrev nname Alan Duan
iabbrev traingle triangle
" }}}
"
" }}}

" AUTOCOMMANDS {{{
" augroup filetype_tex
    " autocmd!
    " autocmd BufEnter *.tex setlocal spell spelllang=en_us
    " autocmd BufEnter *.tex setlocal wrap
    " autocmd BufEnter *.tex nnoremap <buffer> <localleader>c I%<esc>
    " " Conceal settings {{{
    " autocmd BufEnter *.tex setlocal conceallevel=2
    " " }}}
" augroup END

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

" augroup refresh_airline
    " autocmd!
    " autocmd BufWritePost,FileWritePost * AirlineRefresh
" augroup END
" }}}

let g:clipboard = {
            \   'name': 'WslClipboard',
            \   'copy': {
            \      '+': 'clip.exe',
            \      '*': 'clip.exe',
            \    },
            \   'paste': {
            \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \   },
            \   'cache_enabled': 0,
            \ }

" Slimv
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.quicklisp/dists/quicklisp/software/slime-v2.28/start-swank.lisp &'
