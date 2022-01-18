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

Plug 'neoclide/coc.nvim', {'branch': 'release'}
source ~/.vim_runtime/vimrcs/coc_config.vim

Plug 'danilamihailov/beacon.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'Xuyuanp/scrollbar.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'ggandor/lightspeed.nvim'

" Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak' "Jump to any location specified by two characters.

"""" Themes """"
Plug 'NLKNguyen/papercolor-theme'

Plug 'mg979/vim-visual-multi'

Plug 'junegunn/vim-easy-align'

Plug 'tomtom/enabler_vim'

Plug 'ntpeters/vim-better-whitespace'

Plug 'tpope/vim-sleuth'

" Plug 'dkarter/bullets.vim'

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

Plug 'tpope/vim-surround'

Plug 'tpope/vim-obsession'

Plug 'itchyny/lightline.vim'

" Plug 'preservim/nerdtree' |
"             \ Plug 'Xuyuanp/nerdtree-git-plugin' |
"             \ Plug 'ryanoasis/vim-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'amix/open_file_under_cursor.vim'

Plug 'godlygeek/tabular'

Plug 'ervandew/supertab'

Plug 'ludovicchabant/vim-gutentags'

Plug 'schickling/vim-bufonly'

Plug 'mattn/emmet-vim', { 'for': ['html'] }

Plug 'honza/vim-snippets'

Plug 'benshuailyu/online-thesaurus-vim'

Plug 'panozzaj/vim-autocorrect'

Plug 'christoomey/vim-tmux-navigator'

Plug 'schoettl/listtrans.vim' "transform a sentence to a list - <leader>l

Plug 'OrangeT/vim-csharp', { 'for': ['cs'] }

Plug 'hrai/vim-csharp-snippets', { 'for': ['cs'], 'do': 'cp -f ./UltiSnips/* ~/.config/coc/ultisnips/' }

Plug 'justinmk/vim-gtfo' "Go to Terminal or File manager

Plug 'tpope/vim-eunuch'

Plug 'editorconfig/editorconfig-vim'

Plug 'chrisbra/csv.vim', { 'for':['csv']}

Plug 'rhysd/git-messenger.vim'

" gS to split a one-liner into multiple lines
" gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
Plug 'AndrewRadev/splitjoin.vim'

Plug 'flwyd/vim-conjoin' "handles line joining in the presence of line continuation characters

Plug 'tpope/vim-unimpaired'

Plug 'ConradIrwin/vim-bracketed-paste'

Plug 'chrisbra/vim-diff-enhanced'

Plug 'tmux-plugins/vim-tmux', { 'for': ['conf'] }

Plug 'luochen1990/rainbow' "read complex code by showing diff level of parentheses in diff color !

Plug 'andymass/vim-matchup' "even better % 👊 navigate and highlight matching words 👊

Plug 'wellle/targets.vim'

Plug 'mbbill/undotree' "history

Plug 'bagrat/vim-buffet' "show tabs and buffers on tabline

Plug 'spinks/vim-leader-guide'

Plug 'axelf4/vim-strip-trailing-whitespace'

Plug 'mhinz/vim-startify'

Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['py'] }

Plug 'Jorengarenar/vim-SQL-UPPER', { 'for': ['sql']}

Plug 't9md/vim-quickhl' "quickly highlight <cword> or visually selected word; <M-m>,<M-M>

Plug 'rmagatti/alternate-toggler' "toggle boolean values; <leader>bt

Plug 'psliwka/vim-smoothie' "Smooth scrolling

" Peekaboo extends  and @ in normal mode and <"CTRL-R> in insert mode so you can see the contents of the registers
Plug 'junegunn/vim-peekaboo'

" Plugin to help you stop repeating the basic movement keys
Plug 'takac/vim-hardtime'

" Reorder delimited items eg function parameters/arguments testMe(a1,a2,a3) to testMe(a2,a1,a3)
" Mappings - g<, g>, gs
" Plug 'machakann/vim-swap'

Plug 'tyru/open-browser.vim' "Open URLs; gx

Plug 'nanotee/zoxide.vim'

Plug 'liuchengxu/vista.vim' "View and search LSP symbols, tags

" Javascript plugins
Plug 'dense-analysis/ale', { 'for': ['javascript', 'typescript.tsx', 'jsx'] }

" Local plugins
source ~/.vim_runtime/vimrcs/plugins_config.vim

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
" => Lua nvim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('nvim-config')


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
