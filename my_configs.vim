set nu

"show whitespace
syntax on
set syntax=whitespace

"Yanking to clipboard
noremap <C-Y> "+y
"Putting from clipboard
noremap <C-P> "+p

nnoremap ; :
"nnoremap : ;

set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/tmp

set rtp+=~/.vim/bundle/Vundle.vim

"Vundle plugins
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'Valloric/YouCompleteMe'

call vundle#end()

let g:EclimCompletionMethod = 'omnifunc'
set omnifunc=syntaxcomplete#Complete
