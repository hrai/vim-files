"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configs for 3rd party plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => vim-plug
""""""""""""""""""""""""""""""
map <leader>pi :PlugInstall<cr>
map <leader>pu :PlugUpdate<cr>
map <leader>pc :PlugClean<cr>


""""""""""""""""""""""""""""""
" => fzf-vim plugin
""""""""""""""""""""""""""""""
map <leader>f :History<CR>
map <leader>j :Files<cr>
map <leader>bu :Buffers<cr>
map <leader>g :Rg<Space>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" auto refresh NERDTree when folders change
function! IsNerdTreeTabOpen()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

autocmd BufWritePost * if (IsNerdTreeTabOpen()) | NERDTreeFocus | execute 'normal R' | wincmd p | endif

" Automatically quit vim if NERDTree is last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable line numbers
let NERDTreeShowLineNumbers=1

" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" Disabling Indentline on Nerdtree as it is breaking indentation
autocmd BufEnter NERD_tree* :LeadingSpaceDisable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
    let s:status_items=['cocstatus', 'currentfunction', 'fugitive', 'readonly', 'absolutepath', 'modified']
else
    let s:status_items=['cocstatus', 'currentfunction', 'fugitive', 'readonly', 'filename', 'modified']
endif

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': add([ ['mode', 'paste'] ], s:status_items),
            \   'right': [ [ 'lineinfo' ],
            \              ['percent'],
            \              [ 'fileformat', 'filetype' ] ]
            \ },
            \ 'component': {
            \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
            \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
            \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
            \ },
            \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
            \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status',
            \   'currentfunction': 'CocCurrentFunction'
            \ },
            \ 'separator': { 'left': ' ', 'right': ' ' },
            \ 'subseparator': { 'left': ' ', 'right': ' ' }
            \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bullets.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'scratch',
            \ 'notes'
            \]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indentLine settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#562365'

" Specify a character to show for leading spaces.
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar='·'

let g:indentLine_concealcursor=""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-javacomplete2 settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType java setlocal omnifunc=javacomplete#Complete


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-auto-save settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1 " enable auto save on startup
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim ale settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {'javascript': ['prettier', 'eslint']} "Can be executed using :ALEFix
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1


" let g:ale_linters = {
"     \ 'cs': ['OmniSharp']
"     \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-bufonly settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>bo :Bufonly<cr>
nmap <leader>bf :Bufonly!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => utilsnips settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger = "<c-cr>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""
" => Drag visual section
""""""""""""""""""""""""""""""
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap gs :Gstatus<CR>
nnoremap gp :Gpull<CR>
nnoremap gps :Gpush<CR>
nnoremap gpf :Gpush --force<CR>
nnoremap gr :Gread<CR>
nnoremap gw :Gwrite<CR>
nnoremap gcm :Gcommit --m ""
nnoremap gco :Gcommit<CR>
nnoremap gca :Gwrite<CR>:Gcommit --amend<CR>
nnoremap gbl :Gblame<CR>
nnoremap gd :Gvdiff<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listtrans settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>l :call ListTrans_toggle_format()<CR>
xmap <leader>l :call ListTrans_toggle_format('visual')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-diff-enhanced settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <F4> :TagbarToggle<CR>
" autocmd BufEnter *Tagbar* setlocal relativenumber


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctags/universal tags settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags,tags
" set tags=./tags,tags;$HOME


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gutentags settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_file_list_command = {
            \ 'markers': {
            \ '.git': 'git ls-files',
            \ },
            \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-sneak settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T
endif

map <leader>o <Plug>Sneak_s
map <leader>O <Plug>Sneak_S

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => online-thesaurus-vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:use_default_key_map = 0
nnoremap <c-t> :call thesaurusPy2Vim#Thesaurus_LookCurrentWord()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rainbow settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
