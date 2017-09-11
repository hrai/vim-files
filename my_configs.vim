set nocompatible
filetype plugin indent on 

set nu

nnoremap ; :

set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/tmp

set rtp+=~/.vim/bundle/Vundle.vim

"Vundle plugins
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Raimond/delimitMate.vim'

Plugin 'Valloric/YouCompleteMe'

call vundle#end()

let g:EclimCompletionMethod = 'omnifunc'
set omnifunc=syntaxcomplete#Complete
