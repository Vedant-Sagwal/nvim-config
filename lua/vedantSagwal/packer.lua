vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }	

--  use({
--      'rose-pine/neovim',
--      as = 'rose-pine',
--      config = function ()
--          require('rose-pine').setup({
--              disable_italics = true  -- Disable all italics  -- Optional: choose a variant ('main', 'moon', or 'dawn')
--          })
--          vim.cmd('colorscheme rose-pine');
--      end
--  })

use({
    'vague2k/vague.nvim',
    requires = { 'rktjmp/lush.nvim' },
    config = function()
        -- Optionally, customize vague.nvim settings here
        -- Example: require('vague').setup({})
        -- Uncomment the line below to apply vague theme instead of rose-pine
        vim.cmd('colorscheme vague')
    end
})
use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
}

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})	
use ('nvim-treesitter/playground')
use ('ThePrimeagen/harpoon')
use ('mbbill/undotree')
use ('tpope/vim-fugitive')
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  } 
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
          require('lualine').setup {
              options = {
                  theme = 'auto',  -- Choose a theme (e.g., 'rose-pine', 'gruvbox', etc.)
                  section_separators = { left = '', right = '' },
                  component_separators = { left = '', right = '' },
              },
              sections = {
                  lualine_a = {'mode'},
                  lualine_b = {'branch', 'diff', 'diagnostics'},
                  lualine_c = {'filename'},
                  lualine_x = {'encoding', 'fileformat', 'filetype'},
                  lualine_y = {'progress'},
                  lualine_z = {'location'}
              },
          }
      end
  }

end)

