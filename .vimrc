" start of the content

set runtimepath+=~/.vim
set runtimepath+=~/.vim_runtime/sources_non_forked


source ~/.vim_runtime/vimrcs/basic.vim

source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/coc_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
source ~/.vim_runtime/vimrcs/custom_functions.vim

" load this file at the end
source ~/.vim_runtime/my_configs.vim

try
if (has('nvim') && has('python3')) || has('python3_dynamic')
    set runtimepath+=~/.vim_runtime/python_functions
	source ~/.vim_runtime/vimrcs/python_functions.vim
else
	echo ('Please install python 3.x to load python_functions.vim')
endif

catch
endtry

