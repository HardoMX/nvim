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

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'AlexvZyl/nordic.nvim'
    use { 'catppuccin/nvim", as = "catppuccin' }
    use 'rebelot/kanagawa.nvim'
    use 'jacoborus/tender.vim'
    use {'nyoom-engineering/oxocarbon.nvim'}
    use 'rmehri01/onenord.nvim'
    use 'folke/tokyonight.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use {'kdheepak/tabline.nvim', 
        requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'm4xshen/autoclose.nvim'
    use 'jghauser/mkdir.nvim'
    use 'shellRaining/hlchunk.nvim'
    use 'NvChad/nvim-colorizer.lua'
    use 'sitiom/nvim-numbertoggle'
    use 'RRethy/vim-illuminate'
    use { 'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'bennypowers/nvim-regexplainer',
        config = function() require'regexplainer'.setup() end,
        requires = {
            'nvim-treesitter/nvim-treesitter',
            'MunifTanjim/nui.nvim',
        } 
    }
    use 'gelguy/wilder.nvim'
    use 'folke/which-key.nvim'
    use 'numToStr/FTerm.nvim'
    use 'moll/vim-bbye'
    use { 'folke/noice.nvim',
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    }
    use { 'abecodes/tabout.nvim',
        wants = {'nvim-treesitter'}, 
    }
    use 'ms-jpq/coq_nvim'
    use 'ms-jpq/coq.artifacts'
    use 'ms-jpq/coq.thirdparty'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
