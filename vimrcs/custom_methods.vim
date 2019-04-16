" This file contains custom methods

function! GitCommitPush(commit_message)
  Gw
  exec "Gcommit -m \"". a:commit_message. "\""
  Gpush
endfunction

command! -nargs=1 Gap call GitCommitPush(<f-args>)


function! ChangeInsideBrackets()
	let current_char = matchstr(getline('.'), '\%' . col('.') . 'c.')
	echo current_char

	let brackets = ["[", "]", "(", ")", "{", "}"]
	let value_found_at = index(brackets, current_char)

	if(value_found_at >= 0)
		execute "normal! di".current_char
		:startinsert
	endif
endfunction

command! ChangeInsideBrackets call ChangeInsideBrackets()
