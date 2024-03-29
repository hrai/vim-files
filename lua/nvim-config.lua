---------------------------------------------------------------
--=> Treesitter configs
---------------------------------------------------------------

-- require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      'bash'; 'css'; 'go'; 'html'; 'javascript'; 'json'; 'c_sharp'; 'tsx'; 'typescript';
      'dockerfile'; 'yaml'; 'lua'; 'python'; 'graphql'; 'vim'; --'markdown';
    },
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
                ["ic"] = "@class.inner",
                ["ab"]="@block.outer",
                ["ib"]="@block.inner",
            }
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer'
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer'
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer'
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer'
            }
        }
    },
    textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },
}

---------------------------------------------------------------
--=> lukas-reineke/indent-blankline.nvim configs
---------------------------------------------------------------
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("ibl").setup { }

---------------------------------------------------------------
--=> marko-cerovac/material.nvim
---------------------------------------------------------------
vim.g.material_style = "deep ocean"


---------------------------------------------------------------
--=> romgrk/barbar.nvim
---------------------------------------------------------------
vim.api.nvim_create_autocmd('Colorscheme', {
  group = vim.api.nvim_create_augroup('config_custom_highlights', {}),
  callback = function()
    -- Current tab colour adjustments for barbar.nvim
    vim.api.nvim_set_hl(0, 'BufferInactive', {bg = '#44475A'})
    vim.api.nvim_set_hl(0, 'BufferInactiveSign', {bg = '#44475A'})
    vim.api.nvim_set_hl(0, 'BufferInactiveMod', {bg = '#44475A'})
  end,
})
