" Display a cat
echo "      \\    /\\\n       )  ( ')\n      (  /  )\n       \\(__)|\nHello!"

filetype plugin indent on


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

" Other stuff
set encoding=utf-8
set hidden
set wrap

" Cursor {{{
set cursorline
hi CursorLine cterm=None ctermbg=234 guibg=NONE guifg=NONE
set scrolloff=20
" }}}

" }}}

" STATUSLINE {{{
set laststatus=2
set statusline=%4*\ %.20f%*                   " File name
set statusline+=%2*\ %m%r%*%3*%y%*            " Flags (modified, readonly, file type)
set statusline+=%1*%=%*                       " Right align
set statusline+=%3*%{&fenc?&fenc:&enc}%*      " Encoding
set statusline+=%2*\ [%{&ff}]%*               " File format
set statusline+=%4*\ \ Buf:%n%*               " Buffer number
set statusline+=%1*\ %4l:%02v%*%2*/%L%*       " line:col/total line"

hi User1 ctermfg=148 ctermbg=232
hi User2 ctermfg=124 ctermbg=232
hi User3 ctermfg=127 ctermbg=232
hi User4 ctermfg=28 ctermbg=232
" }}}

" MAPPINGS {{{

let mapleader = '\'
let maplocalleader = ','

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
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :so $MYVIMRC<CR>

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
    return (l:timediff <= 0.1 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction
inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')
" }}}

" Abbreviations {{{
iabbrev @@ fluffy_pentacorns@hotmail.com
" }}}
"
" }}}

" AUTOCOMMANDS {{{
augroup filetype_tex
    autocmd!
    autocmd FileType tex setlocal spell spelllang=en_us
    autocmd FileType tex nnoremap <buffer> <localleader>c I%<esc>
augroup END

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

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
