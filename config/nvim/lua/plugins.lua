local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
   vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

return require('packer').startup(function(use)
   -- make sure to add this line to let packer manage itself
   use 'wbthomason/packer.nvim'

   -- plugins
   use {
     'nvim-telescope/telescope.nvim', tag = '0.1.0',
     requires = { {'nvim-lua/plenary.nvim'} }
   }
   use {
    'lewis6991/gitsigns.nvim',
     config = function()
       require('gitsigns').setup()
     end
   }
   use 'norcalli/nvim-colorizer.lua'
   use 'shaunsingh/nord.nvim'

   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   if packer_bootstrap then
     require('packer').sync()
   end
end)
