-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/rkk/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/rkk/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/rkk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/rkk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rkk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\2â\a\0\0\6\0/\0]6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0026\1\0\0'\2\3\0B\1\2\0029\1\2\0015\2\a\0005\3\4\0004\4\3\0005\5\5\0>\5\1\4=\4\6\3=\3\b\0025\3\f\0005\4\n\0009\5\t\0=\5\v\4=\4\r\0035\4\14\0009\5\t\0=\5\15\4=\4\16\0035\4\17\0009\5\t\0=\5\15\4=\4\18\0035\4\19\0009\5\t\0=\5\15\4=\4\20\3=\3\21\2B\1\2\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3\26\0'\4\27\0005\5\28\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3\29\0'\4\30\0005\5\31\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3 \0'\4!\0005\5\"\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3#\0'\4$\0005\5%\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3&\0'\4'\0005\5(\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3)\0'\4*\0005\5+\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3,\0'\4-\0005\5.\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\28:BufferLineMovePrev<CR>\ag[\1\0\2\vsilent\2\fnoremap\2\28:BufferLineMoveNext<CR>\ag]\1\0\2\vsilent\2\fnoremap\2\f:b#<CR>\agb\1\0\2\vsilent\2\fnoremap\2\24:BufferLinePick<CR>\agh\1\0\2\vsilent\2\fnoremap\2\29:BufferLinePickClose<CR>\agq\1\0\2\vsilent\2\fnoremap\2\29:BufferLineCyclePrev<CR>\agp\1\0\2\vsilent\2\fnoremap\2\29:BufferLineCycleNext<CR>\agn\6n\20nvim_set_keymap\bapi\bvim\15highlights\22separator_visible\1\0\0\23separator_selected\1\0\0\14separator\afg\1\0\0\tfill\1\0\0\abg\1\0\0\18bg_statusline\foptions\1\0\0\foffsets\1\0\4\ttext\18File Explorer\15text_align\tleft\14highlight\14Directory\rfiletype\rNvimTree\1\0\2\fnumbers\fordinal\20separator_style\nslant\15bufferline\nsetup\22tokyonight.colors\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    after_files = { "/home/rkk/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2Ù\1\0\0\3\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\1B\0\2\1K\0\1\0\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\3\0\0\thelp\vpacker\1\0\3\19char_highlight\vLineNr\tchar\bâ”Š#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\2ð\1\0\0\5\0\14\0\0196\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\a\0005\3\6\0=\3\b\0024\3\3\0005\4\t\0>\4\1\3=\3\n\0025\3\v\0=\3\f\2=\2\r\1B\0\2\1K\0\1\0\rsections\14lualine_x\1\3\0\0\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\0\0\1\3\0\0\tdiff\16diagnostics\foptions\1\0\0\1\0\1\ntheme\fzenburn\nsetup\flualine\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2Ü\1\0\0\b\0\f\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0026\1\0\0'\2\4\0B\1\2\0029\2\5\1\18\3\2\0009\2\6\2'\4\a\0009\5\b\0005\6\n\0005\a\t\0=\a\v\6B\5\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs", "cmp_luasnip" },
    config = { "\27LJ\2\2-\0\1\3\1\2\0\5-\1\0\0009\1\0\0019\2\1\0B\1\2\1K\0\1\0\0À\tbody\15lsp_expandš\1\0\1\2\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\3\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\2ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\2ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\tjump\rjumpable\21select_prev_item\fvisibleÚ\4\1\0\b\0(\0C6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\1\5\0B\0\2\0026\1\4\0'\2\6\0B\1\2\0029\2\a\0015\3\v\0005\4\t\0003\5\b\0=\5\n\4=\4\f\0035\4\15\0009\5\r\0019\5\14\5B\5\1\2=\5\16\0049\5\r\0019\5\17\5B\5\1\2=\5\18\0049\5\r\0019\5\19\5)\6üÿB\5\2\2=\5\20\0049\5\r\0019\5\19\5)\6\4\0B\5\2\2=\5\21\0049\5\r\0019\5\22\5B\5\1\2=\5\23\0049\5\r\0019\5\24\5B\5\1\2=\5\25\0049\5\r\0019\5\26\0055\6\29\0009\a\27\0019\a\28\a=\a\30\6B\5\2\2=\5\31\0043\5 \0=\5!\0043\5\"\0=\5#\4=\4\r\0034\4\4\0005\5$\0>\5\1\0045\5%\0>\5\2\0045\5&\0>\5\3\4=\4'\3B\2\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\0\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\fluasnip\frequire\1\4\0\0\tmenu\fmenuone\rnoselect\16completeopt\bopt\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\2;\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2û\1\0\0\4\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0005\3\a\0=\3\b\2=\2\t\0015\2\n\0=\2\v\1B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\nlatex\1\0\1\venable\2\21ensure_installed\1\0\1&additional_vim_regex_highlighting\2\1\6\0\0\vpython\tjson\rmarkdown\bsql\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2â\3\0\2\16\2\21\0K-\2\0\0009\2\0\2\18\3\0\0B\2\2\2\18\4\2\0009\3\1\2B\3\2\2\21\3\3\0)\4\1\0\1\4\3\0X\4&€9\4\2\2\v\4\0\0X\5\2€'\4\3\0X\5\6€6\5\4\0009\5\5\5'\6\6\0\18\a\4\0B\5\3\2\18\4\5\0006\5\a\0009\5\b\5'\6\t\0B\5\2\0016\5\n\0\18\a\2\0009\6\1\2B\6\2\0A\5\0\4X\b\n€6\n\a\0009\n\b\n6\v\4\0009\v\5\v'\f\v\0\18\r\1\0\18\14\4\0009\15\f\tB\v\5\0A\n\0\1E\b\3\3R\bô\1276\5\a\0009\5\b\5'\6\r\0B\5\2\1X\4\25€\a\1\14\0X\4\5€-\4\1\0009\4\15\4\18\5\0\0B\4\2\1X\4\18€\a\1\16\0X\4\5€-\4\1\0009\4\17\4\18\5\0\0B\4\2\1X\4\v€\a\1\18\0X\4\5€-\4\1\0009\4\19\4\18\5\0\0B\4\2\1X\4\4€-\4\1\0009\4\20\4\18\5\0\0B\4\2\1K\0\1\0\1À\0À\19select_default\rfile_tab\ttabe\15file_split\nsplit\16file_vsplit\vvsplit\15stopinsert\nvalue\f%s %s%s\vipairs\bbw!\bcmd\bvim\b%s/\vformat\vstring\5\bcwd\24get_multi_selection\23get_current_picker3\0\1\4\1\2\0\6-\1\0\0009\1\0\1\18\2\0\0'\3\1\0B\1\3\1K\0\1\0\2À\vvsplit\15_multiopen2\0\1\4\1\2\0\6-\1\0\0009\1\0\1\18\2\0\0'\3\1\0B\1\3\1K\0\1\0\2À\nsplit\15_multiopen1\0\1\4\1\2\0\6-\1\0\0009\1\0\1\18\2\0\0'\3\1\0B\1\3\1K\0\1\0\2À\ttabe\15_multiopen1\0\1\4\1\2\0\6-\1\0\0009\1\0\1\18\2\0\0'\3\1\0B\1\3\1K\0\1\0\2À\tedit\15_multiopen(\0\0\2\1\1\0\5-\0\0\0009\0\0\0004\1\0\0B\0\2\1K\0\1\0\3À\15find_files;\0\0\2\1\2\0\5-\0\0\0009\0\0\0005\1\1\0B\0\2\1K\0\1\0\3À\1\0\1\20grep_open_files\2\14live_grep‡\r\1\0\v\0O\0ž\0016\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0024\2\0\0006\3\0\0'\4\3\0B\3\2\0023\4\5\0=\4\4\0023\4\a\0=\4\6\0023\4\t\0=\4\b\0023\4\v\0=\4\n\0023\4\r\0=\4\f\0026\4\0\0'\5\14\0B\4\2\0029\4\15\0045\0050\0005\6\16\0005\a\18\0005\b\17\0=\b\19\a5\b\20\0=\b\21\a5\b\22\0=\b\23\a=\a\24\0065\a+\0005\b\26\0009\t\25\0=\t\27\b9\t\28\0=\t\29\b9\t\30\0=\t\31\b9\t \0009\n\28\0 \t\n\t=\t!\b9\t \0009\n\30\0 \t\n\t=\t\"\b9\t\f\2=\t#\b9\t\6\2=\t$\b9\t\b\2=\t%\b9\t\n\2=\t&\b9\t'\0=\t(\b9\t)\0=\t*\b=\b,\a5\b-\0009\t\25\0=\t\27\b9\t \0009\n\28\0 \t\n\t=\t!\b9\t \0009\n\30\0 \t\n\t=\t\"\b9\t\f\2=\t#\b9\t\6\2=\t$\b9\t\b\2=\t%\b9\t\n\2=\t&\b9\t'\0=\t(\b9\t)\0=\t*\b=\b.\a=\a/\6=\0061\0055\0063\0005\a2\0=\a4\6=\0065\5B\4\2\0016\4\0\0'\5\14\0B\4\2\0029\0046\4'\0054\0B\4\2\0016\0047\0009\0048\0049\0049\4'\5.\0'\6:\0009\a;\0035\b<\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6=\0003\a>\0005\b?\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6@\0009\aA\0035\bB\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6C\0003\aD\0005\bE\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6F\0009\aG\0035\bH\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6I\0009\aJ\0035\bK\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6L\0009\aM\0035\bN\0B\4\5\0012\0\0€K\0\1\0\1\0\2\vsilent\2\fnoremap\2\19lsp_references\15<leader>fr\1\0\2\vsilent\2\fnoremap\2\16grep_string\15<leader>fs\1\0\2\vsilent\2\fnoremap\2\14live_grep\15<leader>fg\1\0\2\vsilent\2\fnoremap\2\0\15<leader>fb\1\0\2\vsilent\2\fnoremap\2\30current_buffer_fuzzy_find\15<leader>fc\1\0\2\vsilent\2\fnoremap\2\0\15<leader>ff\1\0\2\vsilent\2\fnoremap\2\fbuffers\20<leader><space>\bset\vkeymap\bvim\19load_extension\15extensions\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\rdefaults\1\0\0\rmappings\6n\1\0\1\n<C-h>\14which_key\6i\1\0\0\n<C-d>\27preview_scrolling_down\n<C-u>\25preview_scrolling_up\n<c-t>\n<c-s>\n<c-v>\t<cr>\f<s-tab>\n<tab>\21toggle_selection\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\18layout_config\tflex\1\0\1\17flip_columns\3x\rvertical\1\0\1\vmirror\1\15horizontal\1\0\2\vheight\4š³æÌ\t™³¦ÿ\3\nwidth\4š³æÌ\t™³¦ÿ\3\1\0\2\18preview_width\4š³æÌ\t™³†ÿ\3\20prompt_position\vbottom\1\0\1\20layout_strategy\tflex\nsetup\14telescope\0\25multi_selection_open\0\29multi_selection_open_tab\0\31multi_selection_open_split\0 multi_selection_open_vsplit\0\15_multiopen\22telescope.builtin\28telescope.actions.state\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\2;\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zenburn.nvim"] = {
    after = { "lualine.nvim" },
    config = { "\27LJ\2\0025\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fzenburn\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/rkk/.local/share/nvim/site/pack/packer/start/zenburn.nvim",
    url = "https://github.com/phha/zenburn.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: zenburn.nvim
time([[Config for zenburn.nvim]], true)
try_loadstring("\27LJ\2\0025\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fzenburn\frequire\0", "config", "zenburn.nvim")
time([[Config for zenburn.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\2;\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2Ù\1\0\0\3\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\1B\0\2\1K\0\1\0\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\3\0\0\thelp\vpacker\1\0\3\19char_highlight\vLineNr\tchar\bâ”Š#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2û\1\0\0\4\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0005\3\a\0=\3\b\2=\2\t\0015\2\n\0=\2\v\1B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\nlatex\1\0\1\venable\2\21ensure_installed\1\0\1&additional_vim_regex_highlighting\2\1\6\0\0\vpython\tjson\rmarkdown\bsql\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2â\3\0\2\16\2\21\0K-\2\0\0009\2\0\2\18\3\0\0B\2\2\2\18\4\2\0009\3\1\2B\3\2\2\21\3\3\0)\4\1\0\1\4\3\0X\4&€9\4\2\2\v\4\0\0X\5\2€'\4\3\0X\5\6€6\5\4\0009\5\5\5'\6\6\0\18\a\4\0B\5\3\2\18\4\5\0006\5\a\0009\5\b\5'\6\t\0B\5\2\0016\5\n\0\18\a\2\0009\6\1\2B\6\2\0A\5\0\4X\b\n€6\n\a\0009\n\b\n6\v\4\0009\v\5\v'\f\v\0\18\r\1\0\18\14\4\0009\15\f\tB\v\5\0A\n\0\1E\b\3\3R\bô\1276\5\a\0009\5\b\5'\6\r\0B\5\2\1X\4\25€\a\1\14\0X\4\5€-\4\1\0009\4\15\4\18\5\0\0B\4\2\1X\4\18€\a\1\16\0X\4\5€-\4\1\0009\4\17\4\18\5\0\0B\4\2\1X\4\v€\a\1\18\0X\4\5€-\4\1\0009\4\19\4\18\5\0\0B\4\2\1X\4\4€-\4\1\0009\4\20\4\18\5\0\0B\4\2\1K\0\1\0\1À\0À\19select_default\rfile_tab\ttabe\15file_split\nsplit\16file_vsplit\vvsplit\15stopinsert\nvalue\f%s %s%s\vipairs\bbw!\bcmd\bvim\b%s/\vformat\vstring\5\bcwd\24get_multi_selection\23get_current_picker3\0\1\4\1\2\0\6-\1\0\0009\1\0\1\18\2\0\0'\3\1\0B\1\3\1K\0\1\0\2À\vvsplit\15_multiopen2\0\1\4\1\2\0\6-\1\0\0009\1\0\1\18\2\0\0'\3\1\0B\1\3\1K\0\1\0\2À\nsplit\15_multiopen1\0\1\4\1\2\0\6-\1\0\0009\1\0\1\18\2\0\0'\3\1\0B\1\3\1K\0\1\0\2À\ttabe\15_multiopen1\0\1\4\1\2\0\6-\1\0\0009\1\0\1\18\2\0\0'\3\1\0B\1\3\1K\0\1\0\2À\tedit\15_multiopen(\0\0\2\1\1\0\5-\0\0\0009\0\0\0004\1\0\0B\0\2\1K\0\1\0\3À\15find_files;\0\0\2\1\2\0\5-\0\0\0009\0\0\0005\1\1\0B\0\2\1K\0\1\0\3À\1\0\1\20grep_open_files\2\14live_grep‡\r\1\0\v\0O\0ž\0016\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0024\2\0\0006\3\0\0'\4\3\0B\3\2\0023\4\5\0=\4\4\0023\4\a\0=\4\6\0023\4\t\0=\4\b\0023\4\v\0=\4\n\0023\4\r\0=\4\f\0026\4\0\0'\5\14\0B\4\2\0029\4\15\0045\0050\0005\6\16\0005\a\18\0005\b\17\0=\b\19\a5\b\20\0=\b\21\a5\b\22\0=\b\23\a=\a\24\0065\a+\0005\b\26\0009\t\25\0=\t\27\b9\t\28\0=\t\29\b9\t\30\0=\t\31\b9\t \0009\n\28\0 \t\n\t=\t!\b9\t \0009\n\30\0 \t\n\t=\t\"\b9\t\f\2=\t#\b9\t\6\2=\t$\b9\t\b\2=\t%\b9\t\n\2=\t&\b9\t'\0=\t(\b9\t)\0=\t*\b=\b,\a5\b-\0009\t\25\0=\t\27\b9\t \0009\n\28\0 \t\n\t=\t!\b9\t \0009\n\30\0 \t\n\t=\t\"\b9\t\f\2=\t#\b9\t\6\2=\t$\b9\t\b\2=\t%\b9\t\n\2=\t&\b9\t'\0=\t(\b9\t)\0=\t*\b=\b.\a=\a/\6=\0061\0055\0063\0005\a2\0=\a4\6=\0065\5B\4\2\0016\4\0\0'\5\14\0B\4\2\0029\0046\4'\0054\0B\4\2\0016\0047\0009\0048\0049\0049\4'\5.\0'\6:\0009\a;\0035\b<\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6=\0003\a>\0005\b?\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6@\0009\aA\0035\bB\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6C\0003\aD\0005\bE\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6F\0009\aG\0035\bH\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6I\0009\aJ\0035\bK\0B\4\5\0016\0047\0009\0048\0049\0049\4'\5.\0'\6L\0009\aM\0035\bN\0B\4\5\0012\0\0€K\0\1\0\1\0\2\vsilent\2\fnoremap\2\19lsp_references\15<leader>fr\1\0\2\vsilent\2\fnoremap\2\16grep_string\15<leader>fs\1\0\2\vsilent\2\fnoremap\2\14live_grep\15<leader>fg\1\0\2\vsilent\2\fnoremap\2\0\15<leader>fb\1\0\2\vsilent\2\fnoremap\2\30current_buffer_fuzzy_find\15<leader>fc\1\0\2\vsilent\2\fnoremap\2\0\15<leader>ff\1\0\2\vsilent\2\fnoremap\2\fbuffers\20<leader><space>\bset\vkeymap\bvim\19load_extension\15extensions\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\rdefaults\1\0\0\rmappings\6n\1\0\1\n<C-h>\14which_key\6i\1\0\0\n<C-d>\27preview_scrolling_down\n<C-u>\25preview_scrolling_up\n<c-t>\n<c-s>\n<c-v>\t<cr>\f<s-tab>\n<tab>\21toggle_selection\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\18layout_config\tflex\1\0\1\17flip_columns\3x\rvertical\1\0\1\vmirror\1\15horizontal\1\0\2\vheight\4š³æÌ\t™³¦ÿ\3\nwidth\4š³æÌ\t™³¦ÿ\3\1\0\2\18preview_width\4š³æÌ\t™³†ÿ\3\20prompt_position\vbottom\1\0\1\20layout_strategy\tflex\nsetup\14telescope\0\25multi_selection_open\0\29multi_selection_open_tab\0\31multi_selection_open_split\0 multi_selection_open_vsplit\0\15_multiopen\22telescope.builtin\28telescope.actions.state\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\2ð\1\0\0\5\0\14\0\0196\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\a\0005\3\6\0=\3\b\0024\3\3\0005\4\t\0>\4\1\3=\3\n\0025\3\v\0=\3\f\2=\2\r\1B\0\2\1K\0\1\0\rsections\14lualine_x\1\3\0\0\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\0\0\1\3\0\0\tdiff\16diagnostics\foptions\1\0\0\1\0\1\ntheme\fzenburn\nsetup\flualine\frequire\0", "config", "lualine.nvim")

vim.cmd [[ packadd tokyonight.nvim ]]
vim.cmd [[ packadd bufferline.nvim ]]

-- Config for: bufferline.nvim
try_loadstring("\27LJ\2\2â\a\0\0\6\0/\0]6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0026\1\0\0'\2\3\0B\1\2\0029\1\2\0015\2\a\0005\3\4\0004\4\3\0005\5\5\0>\5\1\4=\4\6\3=\3\b\0025\3\f\0005\4\n\0009\5\t\0=\5\v\4=\4\r\0035\4\14\0009\5\t\0=\5\15\4=\4\16\0035\4\17\0009\5\t\0=\5\15\4=\4\18\0035\4\19\0009\5\t\0=\5\15\4=\4\20\3=\3\21\2B\1\2\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3\26\0'\4\27\0005\5\28\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3\29\0'\4\30\0005\5\31\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3 \0'\4!\0005\5\"\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3#\0'\4$\0005\5%\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3&\0'\4'\0005\5(\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3)\0'\4*\0005\5+\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\2\25\0'\3,\0'\4-\0005\5.\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\28:BufferLineMovePrev<CR>\ag[\1\0\2\vsilent\2\fnoremap\2\28:BufferLineMoveNext<CR>\ag]\1\0\2\vsilent\2\fnoremap\2\f:b#<CR>\agb\1\0\2\vsilent\2\fnoremap\2\24:BufferLinePick<CR>\agh\1\0\2\vsilent\2\fnoremap\2\29:BufferLinePickClose<CR>\agq\1\0\2\vsilent\2\fnoremap\2\29:BufferLineCyclePrev<CR>\agp\1\0\2\vsilent\2\fnoremap\2\29:BufferLineCycleNext<CR>\agn\6n\20nvim_set_keymap\bapi\bvim\15highlights\22separator_visible\1\0\0\23separator_selected\1\0\0\14separator\afg\1\0\0\tfill\1\0\0\abg\1\0\0\18bg_statusline\foptions\1\0\0\foffsets\1\0\4\ttext\18File Explorer\15text_align\tleft\14highlight\14Directory\rfiletype\rNvimTree\1\0\2\fnumbers\fordinal\20separator_style\nslant\15bufferline\nsetup\22tokyonight.colors\frequire\0", "config", "bufferline.nvim")

vim.cmd [[ packadd LuaSnip ]]
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\2-\0\1\3\1\2\0\5-\1\0\0009\1\0\0019\2\1\0B\1\2\1K\0\1\0\0À\tbody\15lsp_expandš\1\0\1\2\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\3\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\2ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\2ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\0À\tjump\rjumpable\21select_prev_item\fvisibleÚ\4\1\0\b\0(\0C6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\1\5\0B\0\2\0026\1\4\0'\2\6\0B\1\2\0029\2\a\0015\3\v\0005\4\t\0003\5\b\0=\5\n\4=\4\f\0035\4\15\0009\5\r\0019\5\14\5B\5\1\2=\5\16\0049\5\r\0019\5\17\5B\5\1\2=\5\18\0049\5\r\0019\5\19\5)\6üÿB\5\2\2=\5\20\0049\5\r\0019\5\19\5)\6\4\0B\5\2\2=\5\21\0049\5\r\0019\5\22\5B\5\1\2=\5\23\0049\5\r\0019\5\24\5B\5\1\2=\5\25\0049\5\r\0019\5\26\0055\6\29\0009\a\27\0019\a\28\a=\a\30\6B\5\2\2=\5\31\0043\5 \0=\5!\0043\5\"\0=\5#\4=\4\r\0034\4\4\0005\5$\0>\5\1\0045\5%\0>\5\2\0045\5&\0>\5\3\4=\4'\3B\2\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\0\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\fluasnip\frequire\1\4\0\0\tmenu\fmenuone\rnoselect\16completeopt\bopt\bvim\0", "config", "nvim-cmp")

vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\2Ü\1\0\0\b\0\f\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0026\1\0\0'\2\4\0B\1\2\0029\2\5\1\18\3\2\0009\2\6\2'\4\a\0009\5\b\0005\6\n\0005\a\t\0=\a\v\6B\5\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")

vim.cmd [[ packadd cmp_luasnip ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'NvimTreeToggle', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeToggle ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
