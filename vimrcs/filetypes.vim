

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Removing the trailing whitespaces from selected file types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufWritePre *.txt,*.js,*.java,*.*html,*.cs,*.css,*.notes,*.sql,*.jsx,*.vim,*.rb,*.sh,*.json :call CleanExtraSpaces()


""""""""""""""""""""""""""""""
" => File types section
""""""""""""""""""""""""""""""

"Loading syntax files
au BufRead,BufNewFile *.cs set filetype=cs
au BufRead,BufNewFile *.aspx set filetype=aspx
au BufRead,BufNewFile *.cshtml set filetype=html
au BufRead,BufNewFile *.phtml set filetype=html
au BufNewFile,BufRead *.notes set filetype=notes

au BufRead,BufNewFile *.asp setlocal ffs=dos,unix
au BufRead,BufNewFile *.as*x setlocal ffs=dos,unix
au BufRead,BufNewFile *.cs setlocal ffs=dos,unix
au BufRead,BufNewFile *.csproj setlocal ffs=dos,unix
au BufRead,BufNewFile *.sln setlocal ffs=dos,unix

au BufRead,BufNewFile *.sh setlocal ffs=unix,dos

""""""""""""""""""""""""""""""
" => notes section
""""""""""""""""""""""""""""""

autocmd FileType notes :setlocal spell

" automatically uppercase the first letter of the sentence
augroup AUTOCAPITALISE
  au!
  autocmd InsertCharPre *.notes,*.txt,*.md if search('\v(^|[-.!?:]\_s)\_s*%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
augroup END

" autocmd FileType notes,txt,md call LoadNotesConfig()
" function! LoadNotesConfig()
" 	for char in split('abcdefghijklmnopqrstuvwxyz', '\zs')
" 		exe printf("inoremap <expr> <buffer> %s search('[-.!?]\\_s\\+\\%%#', 'bcnw') ? '%s' : '%s'", char, toupper(char), char)
" 	endfor

" 	for char in split('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
" 		exe printf("inoremap <expr> <buffer> %s search('[-.!?]\\_s\\+\\%%#', 'bcnW') ? '%s' : '%s'", char, tolower(char), char)
" 	endfor
" endfunction


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
" au FileType javascript call JavaScriptFold()
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH<esc>FP2xi

" function! JavaScriptFold()
"     setl foldmethod=syntax
"     setl foldlevelstart=1
"     syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

"     function! FoldText()
"         return substitute(getline(v:foldstart), '{.*', '{...}', '')
"     endfunction
"     setl foldtext=FoldText()
" endfunction


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX')
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color
    endif
endif

