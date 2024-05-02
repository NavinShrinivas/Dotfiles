return require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'
   use 'NavinShrinivas/PupBin'
   -- Apperance :
   use { 'nyoom-engineering/oxocarbon.nvim' }
   use("oxfist/night-owl.nvim")
   use 'folke/tokyonight.nvim'
   use 'ayu-theme/ayu-vim'
   use 'KabbAmine/yowish.vim'
   use 'nvim-tree/nvim-web-devicons'
   use 'nvim-lualine/lualine.nvim' -- Statusline, done
   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
   }

   -- LSP stuff
   use({
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
   use "simrat39/rust-tools.nvim" -- Done, default config
   use { 'nvimdev/lspsaga.nvim' }

   -- UI utils
   -- use({
   --    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
   --    config = function()
   --       require("lsp_lines").setup()
   --    end,
   -- })
   use "lukas-reineke/indent-blankline.nvim"
   use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
         require("trouble").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
         })
      end,
   })
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

   if install_plugins then
      require('packer').sync()
   end
end)
