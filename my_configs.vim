"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

let text_files=['notes', 'txt', 'markdown', 'md']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins (x)Avoid using standard Vim directory names like 'plugin')
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

if has('nvim')
    " Plug 'iCyMind/NeoSolarized'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    source ~/.vim_runtime/vimrcs/coc_config.vim

    Plug 'danilamihailov/beacon.nvim'
endif

"""" Themes """"
" Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'

Plug 'mg979/vim-visual-multi'

Plug 'junegunn/vim-easy-align'

Plug 'tomtom/enabler_vim'

Plug 'ntpeters/vim-better-whitespace'

Plug 'Yggdroot/indentLine'

Plug 'tpope/vim-sleuth'

Plug 'easymotion/vim-easymotion'

" Plug 'dkarter/bullets.vim'
"
Plug 'sheerun/vim-polyglot'

" Copy/exchange
" cx - On the first use, define the first {motion} to exchange/swap. On the second use, define the second {motion} and perform the exchange.
" cxx - Like cx, but use the current line.
" X - Like cx, but for Visual mode.
" cxc - Clear any {motion} pending for exchange.
Plug 'tommcdo/vim-exchange'

Plug 'dzeban/vim-log-syntax', { 'for': ['log'] }

Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-tbone'

Plug 'terryma/vim-expand-region' "allows you to visually select increasingly larger regions of text using the same key combination

Plug 'Valloric/vim-operator-highlight' "highlights operator characters for every language

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Press alt-enter to track a remote branch locally (origin/foo becomes foo)
" Press ctrl-b to create a branch or tag with the current query as name
" Press ctrl-d to delete a branch or tag
" Press ctrl-e to merge a branch
" Press ctrl-r to rebase a branch
Plug 'stsewd/fzf-checkout.vim'

Plug '907th/vim-auto-save'

Plug 'tpope/vim-abolish'

Plug 'tpope/vim-markdown', { 'for': ['markdown'] }

Plug 'tpope/vim-fugitive'

" Plug 'majutsushi/tagbar'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-obsession'

Plug 'itchyny/lightline.vim'

" Plug 'preservim/nerdtree', { 'on': ['NerdTreeToggle', 'NerdTreeFind'] } |
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons'

" Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

Plug 'amix/open_file_under_cursor.vim'

Plug 'godlygeek/tabular'

Plug 'ervandew/supertab'

Plug 'ludovicchabant/vim-gutentags'

Plug 'schickling/vim-bufonly'

Plug 'mattn/emmet-vim', { 'for': ['html'] }

Plug 'honza/vim-snippets'

" Plug 'papanikge/vim-voogle' "searching word in google

Plug 'benshuailyu/online-thesaurus-vim'

" Plug 'reedes/vim-litecorrect' "autocorrection

Plug 'panozzaj/vim-autocorrect'

" Plug 'vim-scripts/vis'

Plug 'christoomey/vim-tmux-navigator'

Plug 'soulston/vim-listtrans' "transform a sentence to a list

Plug 'michaeljsmith/vim-indent-object'

Plug 'OrangeT/vim-csharp', { 'for': ['cs'] }

Plug 'hrai/vim-csharp-snippets', { 'for': ['cs'], 'do': 'cp -f ./UltiSnips/* ~/.config/coc/ultisnips/' }

Plug 'justinmk/vim-gtfo' "Go to Terminal or File manager

Plug 'tpope/vim-eunuch'

Plug 'editorconfig/editorconfig-vim'

" These plugins are superseded by coc-highlight
" Plug 'chrisbra/Colorizer'
" Plug 'RRethy/vim-illuminate' "automatically highlighting other uses of the word under the cursor

Plug 'chrisbra/csv.vim', { 'for':['csv']}

Plug 'rhysd/git-messenger.vim'

Plug 'flwyd/vim-conjoin' "handles line joining in the presence of line continuation characters

" Plug 'tpope/vim-endwise'

Plug 'tpope/vim-unimpaired'

Plug 'ConradIrwin/vim-bracketed-paste'

Plug 'chrisbra/vim-diff-enhanced'

Plug 'tmux-plugins/vim-tmux', { 'for': ['conf'] }

Plug 'justinmk/vim-sneak' "Jump to any location specified by two characters.

Plug 'luochen1990/rainbow' "read complex code by showing diff level of parentheses in diff color !

Plug 'tmhedberg/matchit' "extended % matching for HTML, LaTeX, and many other languages

" Plug 'wellle/context.vim'

Plug 'wellle/targets.vim'

Plug 'mbbill/undotree' "history

Plug 'bagrat/vim-buffet' "show tabs and buffers on tabline

Plug 'spinks/vim-leader-guide'

Plug 'axelf4/vim-strip-trailing-whitespace'

Plug 'mhinz/vim-startify'

Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['py'] }

Plug 'strboul/urlview.vim' "List and open URLs easily

Plug 'Jorengarenar/vim-SQL-UPPER', { 'for': ['sql']}

Plug 't9md/vim-quickhl' "quickly highlight <cword> or visually selected word; <M-m>,<M-M>

Plug 'rmagatti/alternate-toggler' "toggle boolean values; <leader>ta

Plug 'psliwka/vim-smoothie' "Smooth scrolling

" gS to split a one-liner into multiple lines
" gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
Plug 'AndrewRadev/splitjoin.vim'

" Peekaboo extends  and @ in normal mode and <"CTRL-R> in insert mode so you can see the contents of the registers
Plug 'junegunn/vim-peekaboo'

" Plugin to help you stop repeating the basic movement keys
Plug 'takac/vim-hardtime'

" Plug 'kana/vim-textobj-indent'

" gs2j => Sort down two lines (current + 2 below)
" gsip => Sort the current paragraph
" gsii => Sort the current indentation level (requires text-obj-indent plugin)
Plug 'christoomey/vim-sort-motion'

" Reorder delimited items eg function parameters/arguments testMe(a1,a2,a3) to testMe(a2,a1,a3)
" Mappings - g<, g>, gs
Plug 'machakann/vim-swap'

Plug 'tyru/open-browser.vim' "mapping - gx

" Javascript plugins
Plug 'dense-analysis/ale', { 'for': ['javascript', 'typescript.tsx', 'jsx'] }

" Plug 'prettier/vim-prettier', {
" \ 'do': 'yarn install',
" \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Vim debug
" Plug 'vim-scripts/genutils', { 'for': ['vim'] }
" Plug 'albfan/vim-breakpts', { 'for': ['vim'] }

" Local plugins
" Plug '~/.vim_runtime/sources_non_forked/damian_conway'

source ~/.vim_runtime/vimrcs/plugins_config.vim

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autocorrect settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup autocorrect
    autocmd!
    " autocmd FileType markdown,md call litecorrect#init(user_dict)
    " autocmd FileType notes,txt call litecorrect#init(user_dict)

    autocmd filetype * call AutoCorrect()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colourscheme settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable this for console application
let g:solarized_termcolors=256

if has('nvim')
    set termguicolors
    " colorscheme NeoSolarized

    " changing codelens colour
    hi CocCodeLens guifg=darkgreen

    "Setting the file history count to 200
    set shada=!,'200,<50,s10,h

endif

colorscheme PaperColor

