" This file contains custom methods

function! GitCommitPush(commit_message)
  Gw
  exec "Gcommit -m \"". a:commit_message. "\""
  Gpush
endfunction

command! -nargs=1 Gap call GitCommitPush(<f-args>)


function! ChangeInsideBrackets()
    let curr_line=getline('.')
    let cursor_pos=col('.')

    let brackets = ["[", "]", "(", ")", "{", "}", "\"", "'"]
    let str_till_cursor_pos=strpart(curr_line,0,cursor_pos)
    let reversed_str=join(reverse(split(str_till_cursor_pos, '.\zs')), '')

    for char in split(reversed_str, '\zs')
        let value_found_at = index(brackets, char)

        if(value_found_at >= 0)
            execute "normal! ci".char
            " :startinsert
            break
        endif
    endfor

endfunction

command! ChangeInsideBrackets call ChangeInsideBrackets()
