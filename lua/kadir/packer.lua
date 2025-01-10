-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "rebelot/kanagawa.nvim"

  use ("nvim-treesitter/nvim-treesitter", { run = ':TSUpdate'})
  use ("mbbill/undotree")
	
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
       {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        {'neovim/nvim-lspconfig'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    }
  }



  -- for closing brackets
  use 'windwp/nvim-autopairs'   -- Autopairs plugin
  use {                        -- Treesitter for syntax parsing
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  use 'm4xshen/autoclose.nvim'

end)
