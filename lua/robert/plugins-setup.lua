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

local plugins = {
   'nvim-treesitter/playground',
   "nvim-lua/plenary.nvim",
   {'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
   },
   'xiyaowong/transparent.nvim',
   {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { {"nvim-lua/plenary.nvim"} }
   },
   {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
   },
   --{
   -- "rose-pine/neovim",
   -- as = "rose-pine",
   -- variant="moon",
   -- dark_variant="moon"
   -- },
   { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
   {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
   },
   'mbbill/undotree',
   'ThePrimeagen/vim-be-good',
   'tpope/vim-fugitive',
   'christoomey/vim-tmux-navigator',
   {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        {
            'tpope/vim-dadbod',
            lazy = true
        },
        {
            'kristijanhusak/vim-dadbod-completion',
            ft = { 'sql', 'mysql', 'plsql' },
            lazy = true
        }, -- Optional
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
    end,
    },
    {
     "folke/zen-mode.nvim",
     dependencies = {
        "folke/twilight.nvim",
     }
    },
    'nvim-tree/nvim-tree.lua',
  --  'rcarriga/nvim-notify'
    {
    "epwalsh/obsidian.nvim",
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        }
    },
    {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    { "folke/neodev.nvim", opts = {} },
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    {
    "folke/noice.nvim",
    opts = {
        notify = {
            enabled = true,
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim"
    },
    },
    {
    "ossmos/analyzer4d.nvim"},
}

local opts = {}

require("lazy").setup(plugins, opts)
