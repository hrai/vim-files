"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configs for coc extensions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:coc_node_args = ['--nolazy', '--async-stack-traces']
let g:coc_config_home = expand('<sfile>:h')
let g:coc_data_home = '~/.vim/plugged/coc_data_home'
let &runtimepath .= ',' . expand('<sfile>:h:h')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" \'coc-explorer',
let g:coc_global_extensions = [
            \'coc-markdownlint',
            \'coc-highlight',
            \'coc-css',
            \'coc-sh',
            \'coc-python',
            \'coc-omnisharp',
            \'coc-powershell',
            \'coc-tsserver',
            \'coc-snippets',
            \'coc-browser',
            \'coc-json',
            \'coc-pairs',
            \'coc-yank',
            \'coc-explorer',
            \'coc-dictionary',
            \'coc-word',
            \'coc-spell-checker',
            \'coc-actions',
            \'coc-lists',
            \'coc-git'
            \]

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-yank settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-actions settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-spell-checker settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-explorer settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType coc-explorer setlocal relativenumber

hi CocExplorerNormalFloatBorder guifg=#414347 guibg=#272B34
hi CocExplorerNormalFloat guibg=#272B34

nmap ge :CocCommand explorer<CR>
nmap gE :CocCommand explorer --position=right<CR>
execute "nmap <space>r :CocCommand explorer --reveal=".expand('<sfile>:h')."/package.json<CR>"
nmap <space>t :CocCommand explorer --position=tab<CR>
nmap <space>v  :CocCommand explorer --preset .vim<CR>
nmap <space>ff :CocCommand explorer --preset floating<CR>
nmap <space>fl :CocCommand explorer --preset floatingLeftside<CR>
nmap <space>fr :CocCommand explorer --preset floatingRightside<CR>
nmap <space>s  :CocCommand explorer --preset simplify<CR>
nmap <space>a  :CocCommand explorer --preset a<CR>
nmap <space>b  :CocCommand explorer --preset b<CR>

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
