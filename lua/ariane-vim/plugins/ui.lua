return {
    -----------------------
    -- Colorscheme
    -----------------------
    {
        "vague2k/vague.nvim",
        lazy = false,
        opts = {
            transparent = true,
            colors = {
                -- slightly more vibrant colors than the original theme
                fg = "#d5d5d5",
                floatborder = "#999999",
                line = "#2a2a35",
                builtin = "#a5e0da",
                func = "#dd7474",
                string = "#f0b97a",
                number = "#f2a45c",
                property = "#cfcff0",
                constant = "#bebee6",
                comment = "#767696",
                parameter = "#d1a7c9",
                visual = "#4a5a70",
                error = "#ef5e76",
                warning = "#f2a45c",
                hint = "#90aaf0",
                operator = "#9aaacc",
                keyword = "#81a8cc",
                type = "#9ec8d0",
                search = "#4a5a70",
                plus = "#98c87a",
                delta = "#f5c37d",
            },
        },
        config = function(_, opts)
            require("vague").setup(opts)
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "vague",
                callback = function()
                    -- Override line numbers colors to be more visible
                    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#4d4d5f', bold = true })
                    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#a5e0da', bold = true })
                    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#4d4d5f', bold = true })
                end,
            })
            vim.cmd("colorscheme vague")
        end
    },

    -----------------------
    -- Better ui
    -----------------------
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = { "MunifTanjim/nui.nvim" }
    },

    -----------------------
    -- Syntax tree parsing
    -----------------------
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")
            ts.setup()
            ts.install({
                "lua",
                "vim",
                "vimdoc",
                "javascript",
                "typescript",
                "tsx",
                "go",
                "rust",
                "c",
                "cpp",
                "html",
                "css",
                "json",
                "bash",
                "dockerfile",
                "markdown",
                "markdown_inline",
            })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "lua",
                    "vim",
                    "javascript",
                    "typescript",
                    "typescriptreact",
                    "javascriptreact",
                    "go",
                    "rust",
                    "c",
                    "cpp",
                    "html",
                    "css",
                    "json",
                    "sh",
                    "dockerfile",
                    "markdown",
                },
                callback = function(args) vim.treesitter.start(args.buf) end,
            })
        end,
    },

    -----------------------
    -- Word highlighting
    -----------------------
    {
        "RRethy/vim-illuminate",
        opts = {
            delay = 100,
        },
        config = function() end,
    },

    -----------------------
    -- Status bar
    -----------------------
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('lualine').setup {
                sections = {
                    lualine_a = { { 'mode', fmt = function(res) return ' ' .. res end } },
                },
                options = {
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                },
            }
        end
    },

    -----------------------
    -- Keymap help
    -----------------------
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function() end
    },


    -----------------------
    -- Home screen
    -----------------------
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = {
                [[                                                                                                                       ]],
                [[                                                                                                                       ]],
                [[                                                                                                                       ]],
                [[                                                                                                                       ]],
                [[                                    '   .       .       .      .            '                  +         `             ]],
                [[                 +  . '           .      '                              .      .        .                   '          ]],
                [[                                                                                                 ⠀⠀⢀⣀⡀+⢀⣀⠀⣀⠀⠀⠀⠀ *      ]],
                [[.     *       '       .  ' .   .       '   .   '      ,      +       `                 .  '      ⠠⡪⠁⠄⢀⠟⠁⠀⠀⠀⠈⠢⠀⠀        ]],
                [[     .                   ████         █                          █          █              ⠀⠑⠄⡑⢌⡀⠀⠀⠀⠀⠀⠀⡗⠠⡀⠀ .    ]],
                [[                        █████    '    ███                .    '    ██   .     ███      .       ⠀⠀⠀⠈⠒⡬⢐⠢⠄⣀⠀⢠⠃⠱⡈⠢ .  ' ]],
                [[  '             '      █████                  .                   ███    █                  ⠀⠀⠀⠀⠀⠈⠒⠨⠥⠶⠆⠩⠭⠥⠤⠐      ]],
                [[                      ██ ███ ██████ ███  █████  ██████   ███████  ███ ███ █████████ ⠀⠀.⠀⠀⠀⠀⠀⠀⡀  ⠀⠀⠀⠀   +  ]],
                [[     '      .        ██  ███ ████   ███ +   ██ ███ ██ █  ███████ ███ ███ ███ ██                      ]],
                [[   '                ██ ' ███ ███    ███ ███████ ███  ███ ████████ ██████  ███ ███  ███* ███     .      +       ' ]],
                [[          *        ██    ███ ███   . ███ ███  ███ ███  ███ ██    * ████ + ███ ███  ███  ███          .   '       ]],
                [[       +         .██     ███ ███     ███ ███████ ███  ███  █████    ██    ███ ███  ███  ███         '   .    .  ']],
                [[.         '       .  ' .   .       '          ' '   .   '      ,               .                                       ]],
                [[                .    '                         .    .                                      .      +                    ]],
                [[               .  '                  .      .  +          '                                     .   '           '      ]],
                [[             '          '      .          '                          *             .           '   .    .              ]],
                [[                                                                                                                       ]],
                [[                                                                                                                       ]],
            }
            alpha.setup(dashboard.opts)
        end,
    },
}
