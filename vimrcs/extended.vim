"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

"Open vim in fullscreen mode (Use ~x on an English Windows version or ~n for French.)
if !has("gui_macvim")
  au GUIEnter * simalt ~x
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Changes working directory to always be
"       the same as the file you are editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * silent! lcd %:p:h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim_runtime/my_configs.vim<cr>
map <leader>c :e! ~/.vim_runtime/vimrcs/coc_config.vim<cr>
autocmd! BufWritePost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-O> <Up>
cnoremap <C-N> <Down>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
cab ga Gap added


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>

" Copies current buffer into a new tab
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

map <leader>n :cn<cr>

map <leader>d :g/^\s*$/d<cr>

"Select all
nnoremap <C-A> ggVG

"Opening folder explorer in Windows
noremap <C-e> :silent !explorer.exe %:p:h:gs?\/?\\\\\\?<CR>

"Closing/saving files
nnoremap <leader>x :x!<CR>
nnoremap <leader>q :q!<CR>

"Map space to colon for easy access to run commands
nnoremap <space> :

"Map go to declaration for ctags
noremap <F12> <C-]>

"Indentation
nnoremap > >>
nnoremap < <<

"Repeat last Ex mode command
nnoremap \ @:
vnoremap \ @:

"Delete all the content of the file/buffer
nnoremap daf :%d<CR>

" Increase/decrease numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Yanking to system and tmux clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
  vnoremap <C-C> "+y
else
  vnoremap <C-C> "+y <bar> <ESC>:Tyank<CR>
endif

"Copying the word under cursor to clipboard
nnoremap <C-C> viw"+y

"Yanking the file contents to clipboard
nnoremap <F6> gg"+yG

"Putting from clipboard
noremap <C-P> "+p
inoremap <C-P> <C-R>+
cnoremap <C-P> <C-R>+<space>

set clipboard+=unnamedplus

if system('uname -r') =~ "Microsoft"
  echo "This is wsl.\r"

  " let s:clip = '/mnt/c/Windows/System32/clip.exe'
  " if executable(s:clip)
  "     augroup WSLYank
  "         autocmd!
  "         autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
  "     augroup END
  " end

  " let g:clipboard = {
  "   \ 'name': 'win32yank',
  "   \ 'copy': {
  "   \    '+': 'win32yank.exe -i --crlf',
  "   \    '*': 'win32yank.exe -i --crlf',
  "   \  },
  "   \ 'paste': {
  "   \    '+': 'win32yank.exe -o --lf',
  "   \    '*': 'win32yank.exe -o --lf',
  "   \ },
  "   \ 'cache_enabled': 0,
  " \ }
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
  let g:cmd = getcmdline()

  if has("win16") || has("win32")
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  endif

  if g:cmd == g:cmd_edited
    if has("win16") || has("win32")
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    endif
  endif

  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"------------------------------
"mapping to automatically add an abbreviation
"------------------------------

" @return the text currently selected
"https://github.com/LucHermitte/lh-vim-lib/blob/master/autoload/lh/visual.vim
function! AddAbbrVisualSelection() abort
  try
    let a_save = @a
    silent! normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

function! AddAbbr()
  normal byw
  let StringChar = AddAbbrVisualSelection()
  let val = input("Enter the abbreviation you wish to use for '" . StringChar . "' :")
  exec "ia" val StringChar
  silent call SaveAbbr(StringChar, val)
endfunction

function! SaveAbbr(val, abbr)
  redir >>~/.vim_runtime/vimrcs/abbreviations.vim
  echo "iabbrev" a:abbr a:val
  redir END
endfunction

vmap <C-F2> <ESC>:call AddAbbr()<CR>
"Replace S-F2 by any other shortcut you wish


" Opening files
command! Vconf :e ~/.vimrc
command! Zc :e ~/.zshrc
command! Gconf :e ~/.gitconfig
command! Gignore :e ~/.gitignore
command! Bconf :e ~/.bashrc
command! Tconf :e ~/.tmux.conf
