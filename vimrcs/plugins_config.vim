"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>be :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <c-o> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
" Unmapping ctrlp's default mapping
let g:ctrlp_map = ''
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_height = 20

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.nuget$\|\.vim$\|\.vscode\|node_modules$',
  \ 'file': '\.exe$\|\.dll$\|tags$'
  \ }

map <leader>j :CtrlP<cr>


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


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
    let s:status_items=['fugitive', 'readonly', 'absolutepath', 'modified']
else
    let s:status_items=['fugitive', 'readonly', 'filename', 'modified']
endif


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
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
let g:syntastic_python_checkers=['pyflakes']

" Javascript
let g:syntastic_javascript_checkers = ['jshint']


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
" => vim-operator-hightlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Setting the colour of the highlighter to yellow
" let g:ophigh_color_gui = "#c4cc00"



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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-javacomplete2 settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType java setlocal omnifunc=javacomplete#Complete


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-auto-save settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1 " enable auto save on startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim ale settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_completion_enabled = 1

let g:ale_fixers = {'javascript': ['prettier', 'eslint']} "Can be executed using :ALEFix

let g:ale_linters = {
    \ 'cs': ['OmniSharp']
    \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-bufonly settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>bo :Bufonly<cr>
nmap <leader>bf :Bufonly!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => utilsnips settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


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
nnoremap gca :Gwrite<CR>:Gcommit --amend<CR>
nnoremap gbl :Gblame<CR>
nnoremap gd :Gvdiff<CR>
nnoremap gap :Gap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listtrans settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>l :call ListTrans_toggle_format()<CR>
xmap <leader>l :call ListTrans_toggle_format('visual')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-diff-enhanced settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F4> :TagbarToggle<CR>
autocmd BufEnter *Tagbar* setlocal relativenumber
