"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configs for coc extensions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:coc_node_args = ['--nolazy', '--async-stack-traces']
let g:coc_config_home = expand('<sfile>:h')
let g:coc_data_home = '~/.vim/coc_data_home'
let &runtimepath .= ',' . expand('<sfile>:h:h')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
            \'coc-browser',
            \'coc-css',
            \'coc-dictionary',
            \'coc-explorer',
            \'coc-git',
            \'coc-highlight',
            \'coc-html',
            \'coc-json',
            \'coc-lists',
            \'coc-markdownlint',
            \'coc-omnisharp',
            \'coc-pairs',
            \'coc-powershell',
            \'coc-prettier',
            \'coc-python',
            \'coc-sh',
            \'coc-snippets',
            \'coc-spell-checker',
            \'coc-tabnine',
            \'coc-tsserver',
            \'coc-tag',
            \'coc-vimlsp',
            \'coc-word',
            \'coc-yank',
            \]


" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-actions settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" use <up/down> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <down>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<down>" :
            \ coc#refresh()

inoremap <silent><expr> <up>
            \ pumvisible() ? "\<C-p>" :
            \ <SID>check_back_space() ? "\<up>" :
            \ coc#refresh()

nmap <f2> <Plug>(coc-rename)
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <leader>do <Plug>(coc-codeaction)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-yank settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-spell-checker settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vmap <leader>a <Plug>(coc-codeaction-selected)
" nmap <leader>a <Plug>(coc-codeaction-selected)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-explorer settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType coc-explorer setlocal relativenumber

hi CocExplorerNormalFloatBorder guifg=#414347 guibg=#272B34
hi CocExplorerNormalFloat guibg=#272B34

nmap ex :CocCommand explorer<CR>
nmap exr :CocCommand explorer --position=right<CR>
" execute "nmap <space>r :CocCommand explorer --reveal=".expand('<sfile>:h')."/package.json<CR>"
nmap <space>t :CocCommand explorer --position=tab<CR>
nmap <space>v  :CocCommand explorer --preset .vim_runtime<CR>
nmap <space>ff :CocCommand explorer --preset floating<CR>

" When the only window opened is explorer, close it
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-snippets settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-space> <Plug>(coc-snippets-expand)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-list settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-prettier settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-dictionary settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setl dictionary+=/usr/share/dict/words

" => coc-git settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=0 GitBroserOpen :CocCommand git.browserOpen


" => coc-highlight settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight the symbol and its references when holding the cursor.
augroup mygroup
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd ColorScheme * highlight CocHighlightText     ctermfg=LightMagenta    guifg=LightMagenta
augroup end
