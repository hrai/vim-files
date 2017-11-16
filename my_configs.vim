set nu

"----------------------------------------

"IndentLine plugin
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#562365'

"Setting colourscheme
set background=dark
colorscheme solarized


"----------------------------------------

"Match pattern while typing search pattern
set incsearch

"Yanking to clipboard
noremap <C-Y> "+y
"Putting from clipboard
noremap <C-P> "+p

nnoremap <leader>x :x<CR>
nnoremap <leader>q :q<CR>

"Map space to colon for easy access to run commands
nnoremap <space> :

set backupdir=~/.vim_runtime/temp_dirs/undodir
set directory=~/.vim_runtime/temp_dirs/undodir
set undodir=~/.vim_runtime/temp_dirs/undodir

set rtp+=~/.vim/bundle/Vundle.vim

"Vundle plugins
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jiangmiao/auto-pairs'

"Plugin 'Valloric/YouCompleteMe'

Plugin 'ntpeters/vim-better-whitespace'

Plugin 'Yggdroot/indentLine'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-sleuth'

Plugin 'easymotion/vim-easymotion'

Plugin 'dkarter/bullets.vim'

Plugin 'pangloss/vim-javascript'

Plugin 'bkad/CamelCaseMotion'

call vundle#end()

"Plugin Settings

"Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch',
    \ 'notes'
    \]


"CamelCaseMotion.vim
call camelcasemotion#CreateMotionMappings('<leader>')


let g:EclimCompletionMethod = 'omnifunc'
set omnifunc=syntaxcomplete#Complete
