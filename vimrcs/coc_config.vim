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
            \'coc-go',
            \'coc-spell-checker',
            \'coc-tabnine',
            \'coc-tsserver',
            \'coc-tag',
            \'coc-vimlsp',
            \'coc-word',
            \'coc-yank',
            \]

if has('nvim')
    let g:coc_global_extensions += [
                \'coc-actions',
            \]

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => coc-actions settings
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Remap for do codeAction of selected region
    function! s:cocActionsOpenFromSelected(type) abort
        execute 'CocCommand actions.open ' . a:type
    endfunction
    xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@


endif

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

nmap ge :CocCommand explorer<CR>
nmap gE :CocCommand explorer --position=right<CR>
execute "nmap <space>r :CocCommand explorer --reveal=".expand('<sfile>:h')."/package.json<CR>"
" nmap <space>t :CocCommand explorer --position=tab<CR>
nmap <space>v  :CocCommand explorer --preset .vim_runtime<CR>
nmap <space>ff :CocCommand explorer --preset floating<CR>

" When the only window opened is explorer, close it
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'floating': {
\     'position': "floating",
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'floating-height': -10,
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'floating-height': -10,
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'a': {
\     'quit-on-open': v:true,
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [filename growRight 1 omitCenter 1][modified]',
\     'file-child-labeling-template': '[fullpath][size][modified][readonly]',
\   },
\   'b': {
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [filename growRight 1 omitCenter 1][size]',
\     'file-child-labeling-template': '[fullpath][size][created][modified][accessed][readonly]',
\   }
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-snippets settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-space> <Plug>(coc-snippets-expand)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


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
command! -nargs=0 GitBrowserOpen :CocCommand git.browserOpen
