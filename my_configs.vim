"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible


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

Plug 'dzeban/vim-log-syntax', { 'for': ['log'] }

Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-tbone'

Plug 'terryma/vim-expand-region'

Plug 'terryma/vim-multiple-cursors'

Plug 'Valloric/vim-operator-highlight'

" Plug 'groenewege/vim-less'

Plug 'artur-shaik/vim-javacomplete2', { 'for': ['java'] }

Plug '907th/vim-auto-save'

Plug 'tpope/vim-abolish'

Plug 'tpope/vim-markdown', { 'for': ['markdown'] }

Plug 'tpope/vim-fugitive'

" Plug 'majutsushi/tagbar'

Plug 'tpope/vim-surround'

" Plug 'maxbrunsfeld/vim-yankstack'

Plug 'itchyny/lightline.vim'

Plug 'mileszs/ack.vim'

Plug 'kien/ctrlp.vim'

" Plug 'scrooloose/nerdtree' ", { 'on': ['NerdTreeToggle', 'NerdTreeFind'] }
Plug 'scrooloose/nerdtree'

Plug 'altercation/vim-colors-solarized'

" Plug 'airblade/vim-gitgutter', { 'on': ['GitGutterToggle'] }

Plug 'vim-scripts/mru.vim'

" Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Plug 'jlanzarotta/bufexplorer'

Plug 'amix/open_file_under_cursor.vim'

Plug 'godlygeek/tabular'

Plug 'ervandew/supertab'

Plug 'ludovicchabant/vim-gutentags'

Plug 'schickling/vim-bufonly'

Plug 'mattn/emmet-vim'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'Ben201310/online-thesaurus-vim', { 'for': ['notes', 'txt'] }

Plug 'vim-scripts/vis'

Plug 'christoomey/vim-tmux-navigator'

Plug 'soulston/vim-listtrans'

Plug 'michaeljsmith/vim-indent-object'

Plug 'OrangeT/vim-csharp'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

Plug 'justinmk/vim-gtfo'

Plug 'tpope/vim-eunuch'

Plug 'editorconfig/editorconfig-vim'

Plug 'chrisbra/Colorizer'

" Plug 'blueyed/vim-diminactive'

" Plug 'bimlas/vim-high'

Plug 'tpope/vim-endwise'

Plug 'tpope/vim-unimpaired'

Plug 'ConradIrwin/vim-bracketed-paste'

Plug 'chrisbra/vim-diff-enhanced'

Plug 'tmux-plugins/vim-tmux', { 'for': ['conf'] }

Plug 'ryanoasis/vim-devicons'

Plug 'kamykn/spelunker.vim'

Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['py'] }

" Javascript plugins
Plug 'w0rp/ale', { 'for': ['javascript', 'typescript.tsx', 'jsx'] }

Plug 'elzr/vim-json', { 'for': ['javascript', 'json'] }

Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }

Plug 'prettier/vim-prettier', {
\ 'do': 'yarn install',
\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" React plugins
Plug 'mxw/vim-jsx', { 'for': ['typescript.tsx'] }

" Typescript plugins
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript.tsx'] }

" Vim debug
Plug 'vim-scripts/genutils', { 'for': ['vim'] }
Plug 'albfan/vim-breakpts', { 'for': ['vim'] }

" Local plugins
Plug '~/.vim_runtime/sources_non_forked/damian_conway'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colourscheme settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable this for console application
let g:solarized_termcolors=256

colorscheme solarized


" prevent slow tag scan
" https://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow/2460593
" set complete-=i
