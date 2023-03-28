local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
    "dstein64/vim-startuptime",
    {
        "phha/zenburn.nvim",
        config = function()
            require("zenburn").setup()
            vim.cmd("colorscheme zenburn")
        end,
    },
    "folke/tokyonight.nvim",
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "tokyonight.nvim" },
        config = function()
            local colors = require("tokyonight.colors").setup({})

            require("bufferline").setup({
                options = {
                    numbers = "ordinal",
                    separator_style = "slant",
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            text_align = "left",
                        },
                    },
                },
                highlights = {
                    fill = {
                        bg = colors.bg_statusline,
                    },
                    separator = {
                        fg = colors.bg_statusline,
                    },
                    separator_selected = {
                        fg = colors.bg_statusline,
                    },
                    separator_visible = {
                        fg = colors.bg_statusline,
                    },
                },
            })

            vim.api.nvim_set_keymap("n", "gn", ":BufferLineCycleNext<CR>", {
                noremap = true,
                silent = true,
            })
            vim.api.nvim_set_keymap("n", "gp", ":BufferLineCyclePrev<CR>", {
                noremap = true,
                silent = true,
            })
            vim.api.nvim_set_keymap("n", "gq", ":BufferLinePickClose<CR>", {
                noremap = true,
                silent = true,
            })
            vim.api.nvim_set_keymap("n", "gh", ":BufferLinePick<CR>", {
                noremap = true,
                silent = true,
            })
            vim.api.nvim_set_keymap("n", "gb", ":b#<CR>", {
                noremap = true,
                silent = true,
            })
            vim.api.nvim_set_keymap("n", "g]", ":BufferLineMoveNext<CR>", {
                noremap = true,
                silent = true,
            })
            vim.api.nvim_set_keymap("n", "g[", ":BufferLineMovePrev<CR>", {
                noremap = true,
                silent = true,
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "phha/zenburn.nvim" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "zenburn",
                },
                sections = {
                    lualine_b = { "diff", "diagnostics" },
                    lualine_c = { {
                        "filename",
                        path = 1,
                    } },
                    lualine_x = { "fileformat", "filetype" },
                },
            })
        end,
    },
    "neovim/nvim-lspconfig",
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "python", "json", "markdown", "sql", "yaml" },
                highlight = {
                    enable = true,
                    disable = { "latex" },
                    additional_vim_regex_highlighting = true,
                },
                indent = {
                    enable = true,
                    disable = { "python" },
                },
            })
        end,
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    }, -- use({
    -- 	"liuchengxu/vista.vim",
    -- 	config = function()
    -- 		vim.g.vista_default_executive = "nvim_lsp"
    -- 	end,
    -- })
    "L3MON4D3/LuaSnip",
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "LuaSnip" },
        config = function()
            vim.opt.completeopt = { "menu", "menuone", "noselect" }

            local luasnip = require("luasnip")
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                    }),
                    ["<Tab>"] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end,
                    ["<S-Tab>"] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end,
                },
                sources = {
                    {
                        name = "nvim_lsp",
                    },
                    {
                        name = "luasnip",
                    },
                    {
                        name = "buffer",
                    },
                },
            })
        end,
    },
    {
        "saadparwaiz1/cmp_luasnip",
        dependencies = { "nvim-cmp" },
    },
    {
        "windwp/nvim-autopairs",
        dependencies = { "nvim-cmp" },
        config = function()
            require("nvim-autopairs").setup({})

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on(
                "confirm_done",
                cmp_autopairs.on_confirm_done({
                    map_char = {
                        tex = "",
                    },
                })
            )
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            -- Allow multi select https://github.com/nvim-telescope/telescope.nvim/issues/1048
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            local custom_actions = {}
            local builtin = require("telescope.builtin")

            function custom_actions._multiopen(prompt_bufnr, open_cmd)
                local picker = action_state.get_current_picker(prompt_bufnr)
                local num_selections = #picker:get_multi_selection()
                if num_selections > 1 then
                    local cwd = picker.cwd
                    if cwd == nil then
                        cwd = ""
                    else
                        cwd = string.format("%s/", cwd)
                    end
                    vim.cmd("bw!") -- wipe the prompt buffer
                    for _, entry in ipairs(picker:get_multi_selection()) do
                        vim.cmd(string.format("%s %s%s", open_cmd, cwd, entry.value))
                    end
                    vim.cmd("stopinsert")
                else
                    if open_cmd == "vsplit" then
                        actions.file_vsplit(prompt_bufnr)
                    elseif open_cmd == "split" then
                        actions.file_split(prompt_bufnr)
                    elseif open_cmd == "tabe" then
                        actions.file_tab(prompt_bufnr)
                    else
                        actions.select_default(prompt_bufnr)
                    end
                end
            end

            function custom_actions.multi_selection_open_vsplit(prompt_bufnr)
                custom_actions._multiopen(prompt_bufnr, "vsplit")
            end

            function custom_actions.multi_selection_open_split(prompt_bufnr)
                custom_actions._multiopen(prompt_bufnr, "split")
            end

            function custom_actions.multi_selection_open_tab(prompt_bufnr)
                custom_actions._multiopen(prompt_bufnr, "tabe")
            end

            function custom_actions.multi_selection_open(prompt_bufnr)
                custom_actions._multiopen(prompt_bufnr, "edit")
            end

            require("telescope").setup({
                defaults = {
                    layout_strategy = "flex",
                    layout_config = {
                        horizontal = {
                            prompt_position = "bottom",
                            preview_width = 0.55,
                        },
                        vertical = {
                            mirror = false,
                        },
                        flex = {
                            flip_columns = 120,
                        },
                        width = 0.8,
                        height = 0.80,
                        -- preview_cutoff = 120,
                    },
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
                            ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
                            ["<cr>"] = custom_actions.multi_selection_open,
                            ["<c-v>"] = custom_actions.multi_selection_open_vsplit,
                            ["<c-s>"] = custom_actions.multi_selection_open_split,
                            ["<c-t>"] = custom_actions.multi_selection_open_tab,
                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down,
                        },
                        n = {
                            ["<C-h>"] = "which_key",
                            ["<esc>"] = actions.close,
                            ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
                            ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
                            ["<cr>"] = custom_actions.multi_selection_open,
                            ["<c-v>"] = custom_actions.multi_selection_open_vsplit,
                            ["<c-s>"] = custom_actions.multi_selection_open_split,
                            ["<c-t>"] = custom_actions.multi_selection_open_tab,
                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down,
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                },
            })
            require("telescope").load_extension("fzf")

            vim.keymap.set("n", "<leader><space>", builtin.buffers, {
                noremap = true,
                silent = true,
            })
            vim.keymap.set("n", "<leader>ff", function()
                builtin.find_files({})
            end, {
                noremap = true,
                silent = true,
            })
            vim.keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, {
                noremap = true,
                silent = true,
            })
            vim.keymap.set("n", "<leader>fb", function()
                builtin.live_grep({
                    grep_open_files = true,
                })
            end, {
                noremap = true,
                silent = true,
            })

            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
                noremap = true,
                silent = true,
            })
            vim.keymap.set("n", "<leader>fs", builtin.grep_string, {
                noremap = true,
                silent = true,
            })
            vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {
                noremap = true,
                silent = true,
            })
        end,
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },
    {
        "anuvyklack/pretty-fold.nvim",
        config = function()
            require("pretty-fold").setup()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
        cmd = "NvimTreeToggle",
        keys = {
			{ "<C-n>", "<cmd>NvimTreeToggle<cr>"}, desc = "Toggle File Tree" },
        config = function()
            require("nvim-tree").setup({})
        end,
    },
    "ggandor/lightspeed.nvim",
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "tpope/vim-repeat", -- use({
    --   "mhinz/vim-signify",
    --   after = "tokyonight.nvim",
    --   config = function()
    --     local colors = require("tokyonight.colors").setup({})
    --     local util = require("tokyonight.util")
    --     util.highlight("SignifySignAdd", { link = "GitSignsAdd" })
    --     util.highlight("SignifySignChange", { link = "GitSignsChange" })
    --     util.highlight("SignifySignChangeDelete", { link = "GitSignsChange" })
    --     util.highlight("SignifySignDelete", { link = "GitSignsDelete" })
    --     util.highlight("SignifySignDeleteFirstLine", { link = "GitSignsDelete" })
    --     vim.g.signify_sign_add = "▊"
    --     vim.g.signify_sign_change = "▊"
    --     vim.g.signify_sign_change_delete = "~"
    --   end,
    -- })
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                char = "┊",
                filetype_exclude = { "help", "packer" },
                buftype_exclude = { "terminal", "nofile" },
                char_highlight = "LineNr",
                show_trailing_blankline_indent = false,
            })
        end,
    },
    "tribela/vim-transparent",
    "mfussenegger/nvim-dap",
})
