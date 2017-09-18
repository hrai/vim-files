set nocompatible

set nu

nnoremap ; :

set backupdir=~/.vim_runtime/temp_dirs/undodir
set directory=~/.vim_runtime/temp_dirs/undodir
set undodir=~/.vim_runtime/temp_dirs/undodir

set rtp+=~/.vim/bundle/Vundle.vim

"Vundle plugins
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Raimondi/delimitMate.vim'

Plugin 'Valloric/YouCompleteMe'

call vundle#end()

let g:EclimCompletionMethod = 'omnifunc'
set omnifunc=syntaxcomplete#Complete
