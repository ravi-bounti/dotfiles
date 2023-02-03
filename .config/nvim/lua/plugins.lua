local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Bootstrap Packer
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Run PackerCompile whenever we edit this file with `nvim`.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")
	use("dstein64/vim-startuptime")

	use({
		"phha/zenburn.nvim",
		config = function()
			vim.cmd("colorscheme zenburn")
		end,
	})

	use({
		"folke/tokyonight.nvim",
	})

	use({
		"akinsho/bufferline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		after = "tokyonight.nvim",
		config = function()
			local colors = require("tokyonight.colors").setup({})

			require("bufferline").setup({
				options = {
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

			vim.api.nvim_set_keymap("n", "gn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gq", ":BufferLinePickClose<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gh", ":BufferLinePick<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gb", ":b#<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "g]", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "g[", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		after = "zenburn.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "zenburn",
				},
				sections = {
					lualine_c = {
						{
							"filename",
							path = 1,
						},
					},
					lualine_x = {
						"encoding",
						"fileformat",
						"filetype",
					},
				},
			})
		end,
	})

	use("neovim/nvim-lspconfig")
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "python", "json", "markdown", "sql", "yaml" },
				highlight = {
					enable = true,
					disable = { "latex" },
				},
				indent = {
					enable = true,
				},
				additional_vim_regex_highlighting = true,
			})
		end,
	})

	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"liuchengxu/vista.vim",
		config = function()
			vim.g.vista_default_executive = "nvim_lsp"
		end,
	})

	use("L3MON4D3/LuaSnip")

	use({
		"hrsh7th/nvim-cmp",
		requires = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer" },
		after = "LuaSnip",
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
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
				},
			})
		end,
	})

	use({
		"saadparwaiz1/cmp_luasnip",
		after = "nvim-cmp",
	})

	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("nvim-autopairs").setup({})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
		end,
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
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
					layout_strategy = 'flex',
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
						},
						n = {
							["<esc>"] = actions.close,
							["<tab>"] = actions.toggle_selection + actions.move_selection_next,
							["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
							["<cr>"] = custom_actions.multi_selection_open,
							["<c-v>"] = custom_actions.multi_selection_open_vsplit,
							["<c-s>"] = custom_actions.multi_selection_open_split,
							["<c-t>"] = custom_actions.multi_selection_open_tab,
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

			vim.keymap.set("n", "<leader><space>", builtin.buffers, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({})
			end, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true })
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		cmd = "NvimTreeToggle",
		config = function()
			require("nvim-tree").setup({})

			vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		end,
	})

	use("ggandor/lightspeed.nvim")

	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")

	-- use({
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

	use({
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
	})

	use("mfussenegger/nvim-dap")
	-- use 'williamboman/nvim-lsp-installer'
	if packer_bootstrap then
		require("packer").sync()
	end
end)
