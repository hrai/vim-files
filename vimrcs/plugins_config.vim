"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configs for 3rd party plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => vim-plug
""""""""""""""""""""""""""""""
map <leader>pi :PlugInstall<cr>
map <leader>pu :PlugClean <bar> :PlugUpdate <bar> :CocUpdate<cr>
map <leader>pc :PlugClean<cr>


""""""""""""""""""""""""""""""
" => fzf-vim plugin
""""""""""""""""""""""""""""""
map <leader>t :History<CR>
map <leader>bu :Buffers<cr>
map <leader>g :Rg<Space>

silent! !git rev-parse --is-inside-work-tree
if v:shell_error == 0
  noremap <leader>n :GFiles --cached --others --exclude-standard<CR>
else
  noremap <leader>n :Files<CR>
endif

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

if has('win32')
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)
else
  " Rg from git root directory
  " https://github.com/junegunn/fzf.vim/issues/837
  command! -bang -nargs=* Rg
        \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden ".shellescape(<q-args>), 1, {'dir': system('git rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)
endif

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>cf :exe "Rg <C-R><C-W>"<CR>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeWinPos = "right"
" let NERDTreeShowHidden=1
" let NERDTreeIgnore = ['\.pyc$', '__pycache__','^node_modules$']
" let g:NERDTreeWinSize=35
" map <leader>nn :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark<Space>
" map <leader>nf :NERDTreeFind<cr>

" " auto refresh NERDTree when folders change
" function! IsNerdTreeTabOpen()
"   return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
" endfunction

" " Sync open file to nerdtree
" autocmd BufWinEnter * if (IsNerdTreeTabOpen()) | NERDTreeFind | execute 'normal R' | wincmd p | endif

" " Automatically quit vim if NERDTree is last and only buffer
" autocmd BufEnter * if (winnr("$") == 1 && &ft=='nerdtree') | q | endif

" " Enable line numbers
" let NERDTreeShowLineNumbers=1

" " make sure relative line numbers are used
" autocmd FileType nerdtree setlocal relativenumber

" " Disabling Indentline on Nerdtree as it is breaking indentation
" autocmd BufEnter *.nerdtree :LeadingSpaceDisable

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
  " let s:status_items=['cocstatus', 'currentfunction', 'fugitive', 'readonly', 'filename', 'modified']
  let s:status_items=['cocstatus', 'currentfunction', 'fugitive', 'readonly', 'modified']
endif

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

" autocmd BufReadPost * if (&ft=='typescript') | Vista | endif

" => Vista config
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

"'tabline': 0 is for 'bagrat/vim-buffet'
let g:lightline = {
                \ 'enable': {
                \ 'tabline':0
                \ },
                \ 'colorscheme': 'wombat',
                \ 'active': {
                \ 'left': add([ ['mode', 'paste'] ], s:status_items),
                \ 'right': [ [ 'lineinfo' ],
                \ ['percent'],
                \ [ 'fileformat', 'filetype' ],
                \ ['vistanearest'] ]
                \ },
                \ 'component': {
                \ 'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
                \ 'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
                \ 'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
                \ },
                \ 'component_visible_condition': {
                \ 'readonly': '(&filetype!="help"&& &readonly)',
                \ 'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
                \ 'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
                \ },
                \ 'component_function': {
                \ 'cocstatus': 'coc#status',
                \ 'currentfunction': 'CocCurrentFunction',
                \ 'vistanearest': 'NearestMethodOrFunction'
                \ },
                \ 'separator': { 'left': ' ', 'right': ' ' },
                \ 'subseparator': { 'left': ' ', 'right': ' ' }
                \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gitgutter_enabled=1
" nnoremap <silent> <leader>d :GitGutterToggle<cr>



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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Yggdroot/indentLine settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim
"let g:indentLine_color_term = 239

"" GVim
"let g:indentLine_color_gui = '#562365'

"" Specify a character to show for leading spaces.
"let g:indentLine_leadingSpaceEnabled=1
"let g:indentLine_leadingSpaceChar='·'

"let g:indentLine_concealcursor=""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-auto-save settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1 " enable auto save on startup
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim ale settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_fixers = {'javascript': ['prettier', 'eslint']} "Can be executed using :ALEFix
let js_fixers = ['prettier', 'eslint']

" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
let g:ale_fixers = {
\   'javascript': js_fixers,
\   'javascript.jsx': js_fixers,
\   'typescript': js_fixers,
\   'typescriptreact': js_fixers,
\   'css': ['prettier'],
\   'json': ['prettier'],
\}

let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'typescript': ['eslint'],
    \}

" let g:ale_linters = {
"     \ 'cs': ['OmniSharp']
"     \}


let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_disable_lsp = 1 " Disabled when using coc
" let g:ale_maximum_file_size=150 " bytes // it will break Ale if enabled

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_flake8_options = '--max-line-length 88 --extend-ignore=E203'

let g:ale_completion_autoimport = 1
let g:ale_sign_error = "🐛"
let g:ale_sign_warning = "⚠️"
let g:ale_sign_info = "ℹ"
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_column_always = 1

" For nvim
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "🔥 "

" Disable linting for all minified JS files.
let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}}

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
" => damian_conway - Drag visual section
""""""""""""""""""""""""""""""
" vmap  <expr>  <LEFT>   DVB_Drag('left')
" vmap  <expr>  <RIGHT>  DVB_Drag('right')
" vmap  <expr>  <DOWN>   DVB_Drag('down')
" vmap  <expr>  <UP>     DVB_Drag('up')
" vmap  <expr>  D        DVB_Duplicate()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap   gs    :Git status<CR>
nnoremap   gp    :Git pull<CR>
nnoremap   gps   :Git push<CR>
nnoremap   gpf   :Git push --force<CR>
nnoremap   gr    :Gread<CR>
nnoremap   gw    :Gwrite<CR>
nnoremap   gcm   :Git commit --m ""
nnoremap   gco   :Git commit<CR>
nnoremap   gca   :Gwrite<CR>:Git commit --amend<CR>
nnoremap   gbl   :Git blame<CR>
nnoremap   gd    :Gvdiff<CR>


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
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree-git-plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeGitStatusUseNerdFonts = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bagrat/vim-buffet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:buffet_use_devicons=1
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rhysd/git-messenger.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal color in popup window with 'CursorLine'
hi link gitmessengerPopupNormal CursorLine

" Header such as 'Commit:', 'Author:' with 'Statement' highlight group
hi link gitmessengerHeader Statement

" Commit hash at 'Commit:' header with 'Special' highlight group
hi link gitmessengerHash Special

" History number at 'History:' header with 'Title' highlight group
hi link gitmessengerHistory Title


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => t9md/vim-quickhl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <M-m> <Plug>(quickhl-manual-this)
xmap <M-m> <Plug>(quickhl-manual-this)

nmap <M-M> <Plug>(quickhl-manual-reset)
xmap <M-M> <Plug>(quickhl-manual-reset)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rmagatti/alternate-toggler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:at_custom_alternates = {'Yes': 'No'}
nnoremap <leader>bt :ToggleAlternate<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => RRethy/vim-illuminate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Illuminate_ftblacklist = ['nerdtree']
augroup illuminate_augroup
  autocmd!

  " autocmd VimEnter * hi link illuminatedWord CursorLine ctermbg=brown
  autocmd VimEnter * hi illuminatedWord guibg=darkgreen
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => spinks/vim-leader-guide
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:lmap = {}
" let g:lmap.l = {'name' : 'language'}
" let g:lmap.l.s = 'coc symbols'

" call leaderGuide#register_prefix_descriptions(",", "g:lmap")
nnoremap <leader> :<c-u>LeaderGuide  ','<CR>
vnoremap <leader> :<c-u>LeaderGuideVisual  ','<CR>

" Display mappings without prefix
autocmd FileType gitcommit  noremap <buffer> <leader> <Plug>leaderguide-buffer
" for fugitive
autocmd BufEnter __Tagbar__  noremap <buffer> <leader> <Plug>leaderguide-buffer
" for tagbar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => takac/vim-hardtime
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:hardtime_default_on = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nanotee/zoxide.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:zoxide_prefix = 'j'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 'vim-autoformat/vim-autoformat'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au BufWrite * :Autoformat

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Xuyuanp/scrollbar.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => wfxr/minimap.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! OpenMinimap()
"     " echo winnr("$")
"     if bufwinnr('-MINIMAP-') == -1 "if the minimap buffer is not open
"         " echo 'entering minimap...'
"         exe 'Minimap'
"     endif
" endfunction

" function! ExitMinimap()
"     " echo winnr("$")
"     if (winnr("$") < 3 && &filetype == 'minimap')
"         " echo 'exiting minimap...'
"         exe ':quit'
"     elseif bufwinnr('-MINIMAP-') != -1 "if the minimap buffer is open
"         " echo winnr('$')
"         exe 'MinimapClose'
"     endif
" endfunction

" autocmd BufEnter * if index(['typescript', 'javascript', 'notes', 'lua', 'vim', 'json'], &ft) >= 0 | call OpenMinimap() | endif
" autocmd BufEnter * if index(['typescript', 'javascript', 'notes', 'lua', 'vim', 'json'], &ft) < 0 | call ExitMinimap() | endif
