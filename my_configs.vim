"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set nocompatible

"Match pattern while typing search pattern
set incsearch



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'ntpeters/vim-better-whitespace'

Plugin 'Yggdroot/indentLine'

Plugin 'tpope/vim-sleuth'

Plugin 'easymotion/vim-easymotion'

Plugin 'dkarter/bullets.vim'

Plugin 'pangloss/vim-javascript'

Plugin 'bkad/CamelCaseMotion'

Plugin 'tpope/vim-dispatch'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-commentary'

Plugin 'terryma/vim-expand-region'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'Valloric/vim-operator-highlight'

Plugin 'groenewege/vim-less'

Plugin 'artur-shaik/vim-javacomplete2'

Plugin 'vim-scripts/vim-auto-save'

Plugin 'tpope/vim-abolish'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'

Plugin 'maxbrunsfeld/vim-yankstack'

Plugin 'itchyny/lightline.vim'

Plugin 'mileszs/ack.vim'

Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'altercation/vim-colors-solarized'

Plugin 'airblade/vim-gitgutter'

Plugin 'vim-scripts/mru.vim'

Plugin 'junegunn/goyo.vim'

Plugin 'jlanzarotta/bufexplorer'

Plugin 'vim-syntastic/syntastic'

Plugin 'amix/open_file_under_cursor.vim'

Plugin 'w0rp/ale'

Plugin 'godlygeek/tabular'

Plugin 'ervandew/supertab'

Plugin 'elzr/vim-json'

Plugin 'mildred/vim-bufmru'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

"Plugin 'OrangeT/vim-csharp'

"Plugin 'OmniSharp/omnisharp-vim'

"Plugin 'OmniSharp/omnisharp-server'

" Plugin 'Valloric/YouCompleteMe'


call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CamelCaseMotion.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call camelcasemotion#CreateMotionMappings('n')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fold settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set fdm=indent
"set foldlevelstart=20


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omnisharp settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:OmniSharp_server_type = 'roslyn'
"let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
"let g:OmniSharp_prefer_global_sln = 1
"let g:OmniSharp_timeout = 10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keyboard mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Yanking to clipboard
vnoremap <C-C> "+y
"Yanking the file contents to clipboard
nnoremap <F6> gg"+yG

"Putting from clipboard
noremap <C-P> "+p
inoremap <C-V> <C-R>*

"Closing/saving files
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q<CR>

"Opening folder explorer in Windows
noremap <C-e> :silent !explorer %:p:h:gs?\/?\\\\\\?<CR>

"Map space to colon for easy access to run commands
nnoremap <space> :

noremap <F12> <C-]>

"Select all
nnoremap <C-A> ggVG

"Repeat last Ex mode command
nmap \ @:

"Open vim in fullscreen mode (Use ~x on an English Windows version or ~n for French.)
au GUIEnter * simalt ~x

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colourscheme settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable this for console application
let g:solarized_termcolors=256
colorscheme solarized


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctags/universal tags settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags,tags;$HOME

