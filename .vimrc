set number
set tabstop=4
" testtesttmux
set softtabstop=4
set expandtab
set showcmd
set showmatch
set foldenable
set foldlevelstart=8
set wrap
set relativenumber
set encoding=utf-8
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c

set cursorline " Customize cursor highlighting stuff etc
hi CursorLine cterm=None ctermbg=234 guibg=NONE guifg=NONE

set scrolloff=20 " Keep 20 lines above and below cursor

set incsearch

" Shortcuts
noremap <Leader>v :so $MYVIMRC
noremap <Leader>d :CocDisable


if expand("%:e") == "tex"
        set indentexpr=
        " REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
        filetype plugin on

        " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
        " can be called correctly.
        set shellslash
        
        " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
        " to
        " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
        " The following changes the default filetype back to 'tex':
        let g:tex_flavor='latex'

        finish
endif



" vim-plug
call plug#begin('~/.vim/plugged')
" For Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize Plugins
call plug#end()

" Makes tab trigger completion
noremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
          let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" Make <c-space> to trigger completion.
if has('nvim')
          inoremap <silent><expr> <c-space> coc#refresh()
  else
            inoremap <silent><expr> <c-@> coc#refresh()
    endif
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
       execute 'h '.expand('<cword>')
         elseif (coc#rpc#ready())
             call CocActionAsync('doHover')
               else
                   execute '!' . &keywordprg . " " . expand('<cword>')
                     endif
                     endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
 nmap <leader>f  <Plug>(coc-format-selected)

 augroup mygroup
   autocmd!
     " Setup formatexpr specified filetype(s).
       autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
         " Update signature help on jump placeholder.
           autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
           augroup end

" Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins
" that provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Disable Coc for tex files
" autocmd BufNew,BufEnter *.tex,*.sty execute "silent! CocDisable"
" autocmd BufLeave *.tex,*.sty execute "silent! CocEnable"

