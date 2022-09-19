local is_available = astronvim.is_available

local maps = { n = {}, v = {}, t = {}, [""] = {} }

maps[""]["<Space>"] = "<Nop>"

-- Easier splits 
maps.n["<leader>sv"] = { "<cmd>vsplit<CR>", desc="Create vertical splits" }
maps.n["<leader>s"] = { "<cmd>split<CR>", desc="Create horizontal splits" }

-- Normal --
-- Standard Operations
maps.n["<leader>h"] = { "<cmd>nohlsearch<cr>", desc = "No Highlight" }
maps.n["<leader>u"] = { function() astronvim.toggle_url_match() end, desc = "Toggle URL Highlights" }
maps.n["<leader>fn"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["gx"] = { function() astronvim.url_opener() end, desc = "Open the file under cursor with system app" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
maps.n["<C-q>"] = { "<cmd>q!<cr>", desc = "Force quit" }
maps.n["Q"] = "<Nop>"

-- Alpha
if is_available "alpha-nvim" then maps.n["<leader>d"] = { "<cmd>Alpha<cr>", desc = "Alpha Dashboard" } end

-- Bufdelete
if is_available "bufdelete.nvim" then
  maps.n["<leader>x"] = { "<cmd>Bdelete<cr>", desc = "Close window" }
else
  maps.n["<leader>x"] = { "<cmd>bdelete<cr>", desc = "Close window" }
end

-- Navigate buffers
if is_available "bufferline.nvim" then
  maps.n["<leader>]"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer tab" }
  maps.n["<leader>["] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer tab" }
else
  maps.n["<leader>]"] = { "<cmd>bnext<cr>", desc = "Next buffer" }
  maps.n["<leader>["] = { "<cmd>bprevious<cr>", desc = "Previous buffer" }
end

-- Comment
if is_available "Comment.nvim" then
  maps.n["<leader>cc"] = { function() require("Comment.api").toggle.linewise.current() end, desc = "Comment line" }
  maps.n["<leader>cs"] = { function() require("Comment.api").toggle.blockwise.current() end, desc = "Comment line" }
  maps.v["<leader>cc"] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    desc = "Toggle comment line",
  }
  maps.v["<leader>cs"] = {
    "<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<cr>",
    desc = "Toggle comment line",
  }

end

-- NeoTree
if is_available "neo-tree.nvim" then
  maps.n["<leader>n"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
end

-- Session Manager
if is_available "neovim-session-manager" then
  maps.n["<leader>Sl"] = { "<cmd>SessionManager! load_last_session<cr>", desc = "Load last session" }
  maps.n["<leader>Ss"] = { "<cmd>SessionManager! save_current_session<cr>", desc = "Save this session" }
  maps.n["<leader>Sd"] = { "<cmd>SessionManager! delete_session<cr>", desc = "Delete session" }
  maps.n["<leader>Sf"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" }
  maps.n["<leader>S."] =
  { "<cmd>SessionManager! load_current_dir_session<cr>", desc = "Load current directory session" }
end

-- Package Manager
-- TODO: v2 rework these key bindings to be more general
if is_available "mason.nvim" then maps.n["<leader>lI"] = { "<cmd>Mason<cr>", desc = "LSP installer" } end

-- LSP Installer
if is_available "mason-lspconfig.nvim" then maps.n["<leader>li"] = { "<cmd>LspInfo<cr>", desc = "LSP information" } end

-- Smart Splits
if is_available "smart-splits.nvim" then
  -- Better window navigation
  maps.n["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" }
  maps.n["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" }
  maps.n["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" }
  maps.n["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" }

  -- Resize with arrows
  maps.n["<C-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" }
  maps.n["<C-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" }
  maps.n["<C-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" }
  maps.n["<C-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" }
else
  maps.n["<C-h>"] = { "<C-w>h", desc = "Move to left split" }
  maps.n["<C-j>"] = { "<C-w>j", desc = "Move to below split" }
  maps.n["<C-k>"] = { "<C-w>k", desc = "Move to above split" }
  maps.n["<C-l>"] = { "<C-w>l", desc = "Move to right split" }
  maps.n["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
  maps.n["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
  maps.n["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
  maps.n["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }
end

-- SymbolsOutline
if is_available "aerial.nvim" then maps.n["<leader>lS"] = { "<cmd>AerialToggle<cr>", desc = "Symbols outline" } end

-- Telescope
if is_available "telescope.nvim" then
  maps.n["<leader>g"] = { function() require("telescope.builtin").live_grep() end, desc = "Search words" }
  maps.n["<leader>G"] = {
    function()
      require("telescope.builtin").live_grep {
        additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
      }
    end,
    desc = "Search words in all files",
  }
  maps.n["<leader>p"] = {
    function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
    desc = "Search all files",
  }
  maps.n["<leader>m"] = { function() require("telescope.builtin").man_pages() end, desc = "Search man" }
  maps.n["<leader>r"] = { function() require("telescope.builtin").lsp_references() end, desc = "Search references" }
  maps.n["<leader>e"] = { function() require("telescope.builtin").diagnostics() end, desc = "Search diagnostics" }
end

-- Terminal
if is_available "toggleterm.nvim" then
  local toggle_term_cmd = astronvim.toggle_term_cmd
  maps.n["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  maps.n["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
  maps.n["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
  maps.n["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
end

-- Stay in indent mode
maps.v["<"] = { "<gv", desc = "unindent line" }
maps.v[">"] = { ">gv", desc = "indent line" }

-- Improved Terminal Mappings
maps.t["<esc>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" }
maps.t["jk"] = { "<C-\\><C-n>", desc = "Terminal normal mode" }
maps.t["<C-h>"] = { "<c-\\><c-n><c-w>h", desc = "Terminal left window navigation" }
maps.t["<C-j>"] = { "<c-\\><c-n><c-w>j", desc = "Terminal down window navigation" }
maps.t["<C-k>"] = { "<c-\\><c-n><c-w>k", desc = "Terminal up window navigation" }
maps.t["<C-l>"] = { "<c-\\><c-n><c-w>l", desc = "Terminal right window naviation" }

astronvim.set_mappings(astronvim.user_plugin_opts("mappings", maps))


