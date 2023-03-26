--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    -- pattern = "*.lua",
    pattern = "*",
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
-- vim.cmd("unmap ,")
lvim.leader = ","
vim.g.mapleader = "," --without this, the which-key breaks

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["n"] = { "<cmd>Telescope find_files<cr>", "Find File" }
lvim.builtin.which_key.mappings["t"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }
lvim.builtin.which_key.mappings["g"] = { "<cmd>Telescope live_grep<cr>", "Text" }

lvim.builtin.which_key.mappings['c'] = {}
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "stylua" },
    {
        command = "prettier",
        extra_args = { "--print-width", "100" },
        filetypes = { "typescript", "typescriptreact" },
    },
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "flake8", filetypes = { "python" } },
    {
        command = "shellcheck",
        args = { "--severity", "warning" },
    },
}

if (package.config:sub(1, 1) == '\\') --if OS is Windows
then
    -- Enable powershell as your default shell
    vim.opt.shell = "pwsh.exe -NoLogo"
    vim.opt.shellcmdflag =
    "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.cmd [[
		  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		  set shellquote= shellxquote=
      nnoremap <leader>c :e ~/AppData/Local/lvim/config.lua<cr>
    ]]
else
    vim.cmd [[
      nnoremap <leader>c :e ~/.config/lvim/config.lua<cr>
    ]]
end

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

vim.opt.relativenumber = true
vim.cmd([[
" disable folding of sections like JS functions
set foldmethod=indent       " manual fold
set foldnestmax=3           " deepest fold is 3 levels
set nofoldenable            " don't fold by default

let g:clipboard = {
  \   'name': 'WslClipboard',
  \   'copy': {
  \      '+': 'clip.exe',
  \      '*': 'clip.exe',
  \    },
  \   'paste': {
  \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \   },
  \   'cache_enabled': 0,
  \ }
""""""""""""""""""""""""""""""
" => notes section
""""""""""""""""""""""""""""""

autocmd FileType notes :setlocal spell

" automatically uppercase the first letter of the sentence
augroup AUTOCAPITALISE
  au!
  autocmd InsertCharPre *.notes,*.txt,*.md if search('\v(^|[-.!?:]\_s)\_s*%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
augroup END

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "silent! normal! g`\"" |
     \ endif
]])

vim.cmd([[
nnoremap <space> :

nnoremap <leader>cl :Telescope neoclip<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
nmap <leader>tn :tabnew<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Switch to home directory
map <leader>ch :cd ~<cr>

nmap <leader>ro :e ~/.nb/home/rough.notes<cr>

" Copies current buffer into a new tab
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

"Closing/saving files
nnoremap <leader>x :x!<CR>
nnoremap <leader>q :q!<CR>

"Map go to declaration for ctags
noremap <F12> <C-]>

"Repeat last Ex mode command
nnoremap \ @:
vnoremap \ @:

"Delete all the content of the file/buffer
nnoremap daf :%d<CR>

" Increase/decrease numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

"Indentation
nnoremap > >>
nnoremap < <<

"Copying the word under cursor to clipboard
nnoremap <C-C> viw"+y

"Yanking the file contents to clipboard
nnoremap <F6> gg"+yG

"Putting from clipboard
noremap <C-P> "+p
inoremap <C-P> <C-R>+
cnoremap <C-P> <C-R>+<space>

" => Add linebreak without entering insert mode
nnoremap <F9> o<Esc>
nnoremap <F8> O<Esc>

" Opening files
command! Vconf :e ~/.vimrc
command! Zc :e ~/.zshrc
command! Gconf :e ~/.gitconfig
command! Gignore :e ~/.gitignore
command! Bconf :e ~/.bashrc
command! Tconf :e ~/.tmux.conf
]])

vim.cmd([[
""""""Plugins""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap   gs    :Git status<CR>
nnoremap   gp    :Git pull<CR>
nnoremap   gps   :Git push<CR>
nnoremap   gpf   :Git push --force<CR>
nnoremap   gr    :Gread<CR>
nnoremap   gw    :Gwrite<CR>
nnoremap   gcm   :Git commit --m ""
nnoremap   gco   :Git commit<CR>
nnoremap   gca   :Gwrite<CR>:Git commit --amend<CR>
nnoremap   gbl   :Git blame<CR>
nnoremap   gd    :Gvdiff<CR>

]])

vim.cmd([[
" This section contains custom methods

function! Push_Config()
  if has("win32")
    exec ":! push_lvim_config"
  else
    exec ":! source ~/.bashrc; push_lvim_config"
  endif
endfunction

function! Pull_Config()
  if has("win32")
    exec ":! pull_lvim_config"
  else
    exec ":! source ~/.bashrc; pull_lvim_config"
  endif
endfunction

nmap <leader>cpl :call Pull_Config()<CR>
nmap <leader>cps :call Push_Config()<CR>

function! GitCommitPush(commit_message)
  Gw
  exec "Git commit -m \"". a:commit_message. "\""
  Git push
endfunction

command! -nargs=1 Gap call GitCommitPush(<f-args>)

nnoremap gap :Gap<space>
nnoremap gcl :Gap cleanup<CR>
nnoremap gnw :Gap new words<CR>


function! ModifyInsideBrackets(commandType) abort
    let curr_line=getline('.')
    let cursor_pos=col('.')

    let brackets = ["[", "]", "(", ")", "{", "}", "\"", "'", "<", ">"]
    let str_till_cursor_pos=strpart(curr_line,0,cursor_pos)
    let reversed_str=join(reverse(split(str_till_cursor_pos, '.\zs')), '')

    for char in split(reversed_str, '\zs')
        let value_found_at = index(brackets, char)

        if(value_found_at >= 0)
            if(a:commandType ==? 'change')
              execute "normal! ci".char

              :normal! l
              :startinsert
            elseif(a:commandType==?'delete')
              execute "normal! ci".char
            elseif(a:commandType==? 'select')
              execute "normal! vi".char
            elseif(a:commandType==? 'yank')
              execute "normal! yi".char
            endif

            break
        endif
    endfor
endfunction

" command! ModifyInsideBrackets call ModifyInsideBrackets()
nmap dib :call ModifyInsideBrackets("delete")<CR>
nmap cib :call ModifyInsideBrackets("change")<CR>
nmap vib :call ModifyInsideBrackets("select")<CR>
nmap yib :call ModifyInsideBrackets("yank")<CR>


" function! ModifyAroundBrackets(commandType) abort
"     let curr_line=getline('.')
"     let cursor_pos=col('.')

"     let brackets = ["[", "]", "(", ")", "{", "}", "\"", "'", "<", ">"]
"     let str_till_cursor_pos=strpart(curr_line,0,cursor_pos)
"     let reversed_str=join(reverse(split(str_till_cursor_pos, '.\zs')), '')

"     for char in split(reversed_str, '\zs')
"         let value_found_at = index(brackets, char)

"         if(value_found_at >= 0)
"             if(a:commandType ==? 'change')
"               execute "normal! ca".char

"               :normal! l
"               :startinsert
"             elseif(a:commandType==?'delete')
"               execute "normal! ca".char
"             elseif(a:commandType==? 'select')
"               execute "normal! va".char
"             elseif(a:commandType==? 'yank')
"               execute "normal! ya".char
"             endif

"             break
"         endif
"     endfor
" endfunction

" nmap dab :call ModifyAroundBrackets("delete")<CR>
" nmap cab :call ModifyAroundBrackets("change")<CR>
" nmap vab :call ModifyAroundBrackets("select")<CR>
" nmap yab :call ModifyAroundBrackets("yank")<CR>

]])

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
--
local function get_tabnine_build_string()
    if (vim.fn.has('win32') == 1) then
        -- use special windows path
        return "pwsh.exe -file .\\install.ps1"
    else
        -- unix path
        return "./install.sh"
    end
end

lvim.plugins = {
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    { "marko-cerovac/material.nvim" }, --colorscheme
    { "Pocco81/auto-save.nvim", },

    { "tpope/vim-abolish" },
    { "tpope/vim-repeat" },
    { "tpope/vim-surround",            keys = { "c", "d", "y" } },
    { "kshenoy/vim-signature",         keys = { "m" } }, -- mx - Toggle mark 'x' and display it in the leftmost column
    { "godlygeek/tabular" },
    { "preservim/vim-markdown",        name = "vim-markdown",                ft = 'md' },
    { "tpope/vim-markdown",            name = "tpope-markdown",              ft = 'md' },
    { "christoomey/vim-tmux-navigator" },
    { "editorconfig/editorconfig-vim" },
    { "ggandor/lightspeed.nvim" },
    { "mg979/vim-visual-multi" },
    { "elzr/vim-json",                 ft = 'json' },
    { "justinmk/vim-gtfo" },     --Go to Terminal or File manager
    { "chrisbra/csv.vim",              ft = 'csv' },
    { "psliwka/vim-smoothie" },  --Smooth scrolling
    { "tyru/open-browser.vim" }, --Open URLs; gx
    { "uga-rosa/cmp-dictionary",       dependencies = { 'hrsh7th/nvim-cmp' } },
    {
        'tzachar/cmp-tabnine',
        after = "nvim-cmp",
        -- build = function()
        --     if jit.os == "Linux" then
        --         print("Executing install.sh...")
        --         vim.cmd [[execute ":! ~/.local/share/lunarvim/site/pack/lazy/opt/cmp-tabnine/install.sh"]]
        --     else
        --         print("Executing install.ps1...")
        --         vim.cmd [[execute ":! pwsh -File $HOME\\AppData\\Roaming\\lunarvim\\site\\pack\\packer\\start\\cmp-tabnine\\install.ps1"]]
        --         -- vim.cmd [[execute ":! pwsh -Command pwd"]]
        --         print("Executed install.ps1...")
        --     end
        -- end,
        build = get_tabnine_build_string(),
        dependencies = 'hrsh7th/nvim-cmp',
    },

    { "tpope/vim-fugitive" },

    {
        "AckslD/nvim-neoclip.lua", --Clipboard manager neovim plugin with telescope integration
        dependencies = {
            { 'kkharji/sqlite.lua',           module = 'sqlite' },
            { 'nvim-telescope/telescope.nvim' },
        },
        config = function()
            require('neoclip').setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
}

vim.cmd 'colorscheme material'
vim.g.material_style = "deep ocean"

vim.cmd([[
let g:gtfo#terminals = { 'win': 'powershell -NoLogo -NoExit -Command' }
]])

require 'nvim-treesitter.configs'.setup {
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                -- You can also use captures from other query groups like `locals.scm`
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V',  -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = true,
        },
    },
}

-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})
