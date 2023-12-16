return require('packer').startup(function(use)
   use({
      'nvimdev/lspsaga.nvim',
      after = 'nvim-lspconfig',
      config = function()
         require('lspsaga').setup({
            symbol_in_winbar = {
               enable = true,
               show_file = true,
               separator = "  ",
               color_mode = false,
            },
         })
      end,
   })
   use 'wbthomason/packer.nvim'
   use 'NavinShrinivas/PupBin'
   -- Apperance :
   use { 'nyoom-engineering/oxocarbon.nvim' }
   use 'folke/tokyonight.nvim'
   use 'ayu-theme/ayu-vim'
   use 'KabbAmine/yowish.vim'
   -- use 'ryanoasis/vim-devicons'
   use 'nvim-tree/nvim-web-devicons'
   -- use 'onsails/lspkind.nvim'
   use 'nvim-lualine/lualine.nvim' -- Statusline, done
   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
   }
   -- use "folke/trouble.nvim"
   -- use 'folke/lsp-colors.nvim'
   -- use({
   --    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
   --    config = function()
   --       require("lsp_lines").setup()
   --    end,
   -- })

   -- LSP stuff
   use({
      -- 'ray-x/navigator.lua',
      'ray-x/navigator.lua',
      requires = { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
   })
   use { "williamboman/mason.nvim" }
   use { 'williamboman/mason-lspconfig.nvim' }
   use 'hrsh7th/cmp-nvim-lsp' --done
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/nvim-cmp'
   use { "L3MON4D3/LuaSnip" }
   use { "jose-elias-alvarez/null-ls.nvim" }
   use 'neovim/nvim-lspconfig'    -- Configurations for Nvim LSP
   -- use { "ray-x/lsp_signature.nvim" } --Done
   use "simrat39/rust-tools.nvim" -- Done, default config

   -- UI utils
   -- use({
   --    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
   --    config = function()
   --       require("lsp_lines").setup()
   --    end,
   -- })
   use { 'romgrk/barbar.nvim', wants = 'nvim-web-devicons' } -- Done
   use "rebelot/kanagawa.nvim"                               -- No setup, usage in theme.lua
   use 'AlexvZyl/nordic.nvim'                                -- No setup, usage in theme.lua
   use "nvim-lua/plenary.nvim"                               -- done
   use 'ThePrimeagen/harpoon'
   use('mrjones2014/smart-splits.nvim')                      -- done, only mappings
   use 'nvim-telescope/telescope.nvim'                       -- done, only mappings
   use {
      "nvim-neo-tree/neo-tree.nvim",                         -- done
      branch = "v2.x",
      requires = {
         "MunifTanjim/nui.nvim",
      }
   }
   use {
      "startup-nvim/startup.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
   }
   use 'kdheepak/lazygit.nvim' -- git plugins

   -- Using fzf as lsp wrappers only, Below all are just UI for lsp stuff
   use "junegunn/fzf"
   -- use 'gfanto/fzf-lsp.nvim'
   -- use {
   --    'kosayoda/nvim-lightbulb',
   --    requires = 'antoinemadec/FixCursorHold.nvim',
   -- }
   use 'j-hui/fidget.nvim'

   -- Generic utils
   use 'windwp/nvim-autopairs' -- Done, only calling setup function on require
   use 'tpope/vim-surround'    -- Done, no setup
   use {
      'numToStr/Comment.nvim', -- Done, only binds
      config = function()
         require('Comment').setup()
      end
   }
   use {
      "m4xshen/hardtime.nvim",
      requires = { 'MunifTanjim/nui.nvim', "nvim-lua/plenary.nvim" }
   }
   -- debuggers :
   use 'mfussenegger/nvim-dap'
   use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

   if install_plugins then
      require('packer').sync()
   end
end)
