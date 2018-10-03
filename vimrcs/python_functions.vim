"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install python 3.5 which is the version
"       gvim was compiled with!
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("win32")
    " loading commands for windows
    function! OpenGitBash()
        py3file ~/.vim_runtime/python_functions/open_git_bash.py
    endfunc

    function! OpenGitExtensions()
        py3file ~/.vim_runtime/python_functions/open_gitextensions.py
    endfunc

    function! OpenGitExtensionsCommit()
        py3file ~/.vim_runtime/python_functions/open_gitextensions_commit.py
    endfunc

    command! OpenGitBash call OpenGitBash()
    command! OpenGitExtensions call OpenGitExtensions()
    command! OpenGitExtensionsCommit call OpenGitExtensionsCommit()
    command! Gec call OpenGitExtensionsCommit()
endif
