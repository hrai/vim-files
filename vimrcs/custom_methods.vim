" This file contains custom methods

function! GitCommitPush(commit_message)
  Gw
  exec "Gcommit -m \"". a:commit_message. "\""
  Gpush
endfunction

command! -nargs=1 Gap call GitCommitPush(<f-args>)
