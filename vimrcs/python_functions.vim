if !has('python3')
  echo ('Please install python 3.5')
  finish
endif

function! OpenGitBash()
    py3file ~/.vim_runtime/python_functions/opengit.py
endfunc

function! OpenGitExtensions()
    py3file ~/.vim_runtime/python_functions/opengitextensions.py
endfunc

command! OpenGitBash call OpenGitBash()
command! OpenGitExtensions call OpenGitExtensions()
