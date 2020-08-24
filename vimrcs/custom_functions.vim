" This file contains custom methods

function! GitCommitPush(commit_message)
  Gw
  exec "Gcommit -m \"". a:commit_message. "\""
  Gpush
endfunction

command! -nargs=1 Gap call GitCommitPush(<f-args>)

nnoremap gap :Gap<space>
nnoremap gcl :Gap cleanup<CR>


function ModifyInsideBrackets(commandType)
    let curr_line=getline('.')
    let cursor_pos=col('.')

    let brackets = ["[", "]", "(", ")", "{", "}", "\"", "'", "<", ">"]
    let str_till_cursor_pos=strpart(curr_line,0,cursor_pos)
    let reversed_str=join(reverse(split(str_till_cursor_pos, '.\zs')), '')

    for char in split(reversed_str, '\zs')
        let value_found_at = index(brackets, char)

        if(value_found_at >= 0)
            if(a:commandType ==? 'change')
              execute "normal! ci".char

              :normal! l
              :startinsert
            elseif(a:commandType==?'delete')
              execute "normal! ci".char
            elseif(a:commandType==? 'select')
              execute "normal! vi".char
            elseif(a:commandType==? 'yank')
              execute "normal! yi".char
            endif

            break
        endif
    endfor
endfunction

" command! ModifyInsideBrackets call ModifyInsideBrackets()
nmap dib :call ModifyInsideBrackets("delete")<CR>
nmap cib :call ModifyInsideBrackets("change")<CR>
nmap vib :call ModifyInsideBrackets("select")<CR>
nmap yib :call ModifyInsideBrackets("yank")<CR>


function ModifyAroundBrackets(commandType)
    let curr_line=getline('.')
    let cursor_pos=col('.')

    let brackets = ["[", "]", "(", ")", "{", "}", "\"", "'", "<", ">"]
    let str_till_cursor_pos=strpart(curr_line,0,cursor_pos)
    let reversed_str=join(reverse(split(str_till_cursor_pos, '.\zs')), '')

    for char in split(reversed_str, '\zs')
        let value_found_at = index(brackets, char)

        if(value_found_at >= 0)
            if(a:commandType ==? 'change')
              execute "normal! ca".char

              :normal! l
              :startinsert
            elseif(a:commandType==?'delete')
              execute "normal! ca".char
            elseif(a:commandType==? 'select')
              execute "normal! va".char
            elseif(a:commandType==? 'yank')
              execute "normal! ya".char
            endif

            break
        endif
    endfor
endfunction

nmap dab :call ModifyAroundBrackets("delete")<CR>
nmap cab :call ModifyAroundBrackets("change")<CR>
nmap vab :call ModifyAroundBrackets("select")<CR>
nmap yab :call ModifyAroundBrackets("yank")<CR>



function! CocToggle()
    if get(g:, 'coc_enabled', 0) == 1
        echo 'Disabling coc...'
        execute 'CocDisable'
    else
        echo 'Enabling coc...'
        execute 'CocEnable'
    endif

    execute 'AutoSaveToggle'
endfunction

nnoremap <leader>tp :call CocToggle()<cr>
