
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use('nvim-treesitter/playground')
  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }} 
  use('xiyaowong/transparent.nvim')
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  -- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "rose-pine/neovim", as = "rose-pine", variant="moon", dark_variant="moon"}
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('mbbill/undotree')
  use('ThePrimeagen/vim-be-good')
  use('tpope/vim-fugitive')
  use('christoomey/vim-tmux-navigator')
  use{
    "folke/zen-mode.nvim",
    requires = {
        "folke/twilight.nvim",
    }
  }
  use('nvim-tree/nvim-tree.lua')
  use 'rcarriga/nvim-notify'
  use({
  "epwalsh/obsidian.nvim",
  tag = "*",  -- recommended, use latest release instead of latest commit
  requires = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  }})
  use {
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  }
}
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {
      "folke/noice.nvim",
      opts = {
        -- Add any options here
        notify = {
            enabled = true,
        },
      },
      requires = {
            {"MunifTanjim/nui.nvim"},
        }
    }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
