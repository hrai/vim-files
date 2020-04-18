" start of the content

set runtimepath+=/usr/bin/nvim
set runtimepath+=~/.vim_runtime/python_functions
set runtimepath+=~/.vim_runtime/sources_non_forked

let g:python3_host_prog = '/usr/bin/python3'

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
source ~/.vim_runtime/vimrcs/custom_functions.vim

try
if has('python3') || has('python3_dynamic')
    source ~/.vim_runtime/vimrcs/python_functions.vim
else
	echo ('Please install python 3.x to load python_functions.vim')
	finish
endif

source ~/.vim_runtime/my_configs.vim

catch
endtry

