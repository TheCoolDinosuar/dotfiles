filetype plugin on
""""OPTIONS""""

" Tabs
set tabstop=4
set softtabstop=4
set expandtab

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

" Other stuff
set encoding=utf-8
set hidden
set wrap

" Cursor
set cursorline
hi CursorLine cterm=None ctermbg=234 guibg=NONE guifg=NONE
set scrolloff=20

" Display a cat
echo "      \\    /\\\n       )  ( ')\n      (  /  )\n       \\(__)|\nHello!"

" Mappings
let mapleader = '\'
let maplocalleader = ','

nnoremap <Leader>cd :CocDisable<CR>
" Some stuf regarding <C-j> 
" https://stackoverflow.com/questions/9092982/mapping-c-j-to-something-in-vim
let g:BASH_Ctrl_j = "off"
augroup vimrc
    au!
    au VimEnter * unmap <C-j>
    au VimEnter * noremap <C-j> <C-w>j
augroup END
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

" Abbreviations
iabbrev @@ fluffy_pentacorns@hotmail.com

let g:tex_flavor='latex'

" vim-plug
" call plug#begin('~/.vim/plugged')
" For Coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 
" " Initialize Plugins
" call plug#end()
" 
" " Makes tab trigger completion
" noremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"           let col = col('.') - 1
"             return !col || getline('.')[col - 1]  =~# '\s'
"     endfunction
" 
" " Make <c-space> to trigger completion.
" if has('nvim')
"           inoremap <silent><expr> <c-space> coc#refresh()
"   else
"             inoremap <silent><expr> <c-@> coc#refresh()
"     endif
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" " Use K to show documentation in preview window.
" " nnoremap <silent> K :call <SID>show_documentation()<CR>
" "
" function! s:show_documentation()
"    if (index(['vim','help'], &filetype) >= 0)
"        execute 'h '.expand('<cword>')
"          elseif (coc#rpc#ready())
"              call CocActionAsync('doHover')
"                else
"                    execute '!' . &keywordprg . " " . expand('<cword>')
"                      endif
"                      endfunction
" 
" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
" 
" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
"  nmap <leader>f  <Plug>(coc-format-selected)
" 
"  augroup mygroup
"    autocmd!
"      " Setup formatexpr specified filetype(s).
"        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"          " Update signature help on jump placeholder.
"            autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"            augroup end
" 
" " Add (Neo)Vim's native statusline support.
" " " NOTE: Please see `:h coc-status` for integrations with external plugins
" " that provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" 
" " Disable Coc for tex files
" " autocmd BufNew,BufEnter *.tex,*.sty execute "silent! CocDisable"
" " autocmd BufLeave *.tex,*.sty execute "silent! CocEnable"
" 
