return {
  -- Solarized color scheme
  'ishan9299/nvim-solarized-lua',

  -- Status line
  {
    'hoob3rt/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
  },

  -- Indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {},
  },

  -- nvim-autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  -- Commenting
  {
    'numToStr/Comment.nvim',
    config = true,
  },

  -- Surrounding
  {
    'kylechui/nvim-surround',
    config = true,
  },

  -- Which-key
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = true,
  },

  -- Git Signs
  'lewis6991/gitsigns.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = true,
}
