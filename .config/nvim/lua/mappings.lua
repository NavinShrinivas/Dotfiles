-- Personal keybinds
vim.keymap.set("n", "<C-f>", "<C-c>")

-- nerdtree keybinds
vim.keymap.set('n', '<leader>n', ":NeoTreeShowToggle<cr>")

-- splits keybinds
vim.keymap.set('n', "<leader>s", ":split <CR>")
vim.keymap.set('n', "<leader>vs", ":vsplit <CR>")
vim.keymap.set('n', "<leader><Up>", require("smart-splits").resize_up)
vim.keymap.set('n', "<leader><Down>", require("smart-splits").resize_down)
vim.keymap.set('n', "<leader><Left>", require("smart-splits").resize_left)
vim.keymap.set('n', "<leader><Right>", require("smart-splits").resize_right)

-- Buffer keybinds
vim.keymap.set('n', "<leader>[", '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', "<leader>]", '<Cmd>BufferNext<CR>')
vim.keymap.set('n', "<leader>x", '<Cmd>bd<CR>')

-- telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Comment keybinds
vim.keymap.set('n', "<leader>cc", "<cmd> lua require('Comment.api').toggle.linewise.current() <CR>")
vim.keymap.set('v', "<leader>cc", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")

-- LSP keybids :
vim.keymap.set('n', "<leader>lr", "<esc><cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set('n', "<leader>la", "<esc><cmd>lua require('navigator.codeAction').code_action()<CR>")
vim.keymap.set('n', "<leader>lf", "<esc><cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set('n', "<leader>ld", "<esc><cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set('n', "<leader>lp", "<esc><cmd>lua require('navigator.definition').definition_preview()<CR>")
vim.keymap.set('n', "<leader>ls", "<esc><cmd>lua vim.lsp.buf.document_symbol()<CR>")
vim.keymap.set('n', "<leader>lS", "<esc><cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set('n', "<leader>lD", "<esc><cmd>lua vim.lsp.buf.hover()<CR> ")
vim.keymap.set('n', "<leader>lc", "require('navigator.rename').rename()")

-- git plugins
vim.keymap.set("n", "<leader>lg", "<esc><cmd>:LazyGit<CR>")
vim.keymap.set("n", "<leader>lgb", "<esc><cmd>:LazyGitFilterCurrentFile<CR>")


-- harpoon keys :
vim.keymap.set("n", "<leader>m", "<esc><cmd>:lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set("n", "<leader>h", "<esc><cmd>:lua require('harpoon.ui').toggle_quick_menu()<CR>")
vim.keymap.set("n", "<leader>hh", "<esc><cmd>:lua require('harpoon.ui').nav_file(1)<CR>") -- opens first mark in list
vim.keymap.set("n", "<leader>hj", "<esc><cmd>:lua require('harpoon.ui').nav_file(2)<CR>") -- opens first mark in list
vim.keymap.set("n", "<leader>hk", "<esc><cmd>:lua require('harpoon.ui').nav_file(3)<CR>") -- opens first mark in list
vim.keymap.set("n", "<leader>hl", "<esc><cmd>:lua require('harpoon.ui').nav_file(4)<CR>") -- opens first mark in list
