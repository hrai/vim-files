"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set nocompatible

"Match pattern while typing search pattern
set incsearch



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins (x)Avoid using standard Vim directory names like 'plugin')
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/vim-easy-align'

Plug 'tomtom/enabler_vim'

Plug 'jiangmiao/auto-pairs'

Plug 'ntpeters/vim-better-whitespace'

Plug 'Yggdroot/indentLine'

Plug 'tpope/vim-sleuth'

Plug 'easymotion/vim-easymotion'

Plug 'dkarter/bullets.vim'

Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }

" Plug 'bkad/CamelCaseMotion'

Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-commentary'

Plug 'terryma/vim-expand-region'

Plug 'terryma/vim-multiple-cursors'

Plug 'Valloric/vim-operator-highlight'

Plug 'groenewege/vim-less'

Plug 'artur-shaik/vim-javacomplete2', { 'for': ['java'] }

Plug 'vim-scripts/vim-auto-save'

Plug 'tpope/vim-abolish'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'maxbrunsfeld/vim-yankstack'

Plug 'itchyny/lightline.vim'

Plug 'mileszs/ack.vim'

Plug 'kien/ctrlp.vim'

Plug 'scrooloose/nerdtree' ", { 'on': ['NerdTreeToggle', 'NerdTreeFind'] }

Plug 'altercation/vim-colors-solarized'

Plug 'airblade/vim-gitgutter', { 'on': ['GitGutterToggle'] }

Plug 'vim-scripts/mru.vim'

Plug 'junegunn/goyo.vim'

Plug 'jlanzarotta/bufexplorer'

Plug 'vim-syntastic/syntastic'

Plug 'amix/open_file_under_cursor.vim'

Plug 'w0rp/ale', { 'for': ['javascript'] }

Plug 'godlygeek/tabular'

Plug 'ervandew/supertab'

Plug 'elzr/vim-json', { 'for': ['javascript', 'json'] }

Plug 'ludovicchabant/vim-gutentags'

Plug 'schickling/vim-bufonly'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'Ben201310/online-thesaurus-vim'

Plug 'vim-scripts/vis'

Plug 'christoomey/vim-tmux-navigator'

Plug 'soulston/vim-listtrans'

Plug 'michaeljsmith/vim-indent-object'

" Plug 'vim-airline/vim-airline-themes'

" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'

"Plug 'OrangeT/vim-csharp'

"Plug 'OmniSharp/omnisharp-vim'

"Plug 'OmniSharp/omnisharp-server'

" Plug 'Valloric/YouCompleteMe'

" Local plugins
Plug '~/.vim_runtime/sources_non_forked/damian_conway'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CamelCaseMotion.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call camelcasemotion#CreateMotionMappings('n')


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

"Copying the word under cursor to clipboard
nnoremap <C-C> viw"+y

"Select all
nnoremap <C-A> ggVG

"Opening folder explorer in Windows
noremap <C-e> :silent !explorer %:p:h:gs?\/?\\\\\\?<CR>

"Closing/saving files
nnoremap <leader>x :x!<CR>
nnoremap <leader>q :q!<CR>

"Map space to colon for easy access to run commands
nnoremap <space> :

"Map go to declaration for ctags
noremap <F12> <C-]>

"Indentation
nnoremap > >>
nnoremap < <<

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
