-- web-dev-icons :
-- require("pluginsetup/devicons")

-- lualine :
require("pluginsetup/lualine")

-- neotree
require("pluginsetup/neotree")

-- smart-splits
require("pluginsetup/smartsplit")

-- barbar
require("pluginsetup/barbar")

-- lsp
require("pluginsetup/lsp")

-- completion framework
require("pluginsetup/cmp")

-- telescope setup, only for fzf keybinds cus ugh muscle memory
require("pluginsetup/telescope")


-- telescope setup, only for fzf keybinds cus ugh muscle memory
require("pluginsetup/treesitter")
require("pluginsetup/startup")
require("pluginsetup.harpoon")


-- Other simple setups, without seperate file:
require("nvim-autopairs").setup {}
require('nvim-autopairs').enable()
require('cmp_nvim_lsp').setup()
-- require('nvim-lightbulb').setup({ autocmd = { enabled = true } })
require "fidget".setup {}
require("ibl").setup()

-- linter when there is no language server
-- require('lint').linters_by_ft = {
--   markdown = {'vale',}
-- }
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--
--     -- try_lint without arguments runs the linters defined in `linters_by_ft`
--     -- for the current filetype
--     require("lint").try_lint()
--   end,
-- })
