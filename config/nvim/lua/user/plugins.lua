local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return require('packer').startup(function(use)
  -- My plugins here
   use 'wbthomason/packer.nvim' -- Have packer manage itself
   use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
   use "numToStr/Comment.nvim" -- Easily comment stuff

   -- Colorschemes
   use 'shaunsingh/nord.nvim' -- An arctic, north-bluish clean and elegant Vim theme

   -- cmp plugins
   use 'hrsh7th/nvim-cmp' -- The completion plugin
   use 'hrsh7th/cmp-buffer' -- buffer completions
   use 'hrsh7th/cmp-path' -- path completions
   use 'hrsh7th/cmp-cmdline' -- cmdline completions
   use 'saadparwaiz1/cmp_luasnip' -- snippet completions
   use 'hrsh7th/cmp-nvim-lsp' -- LSP completions
   use 'hrsh7th/cmp-nvim-lua' -- neovim Lua API completions
   use 'onsails/lspkind.nvim' -- vscode-like pictograms for neovim lsp completion items
   use 'David-Kunz/cmp-npm' -- npm package and version completions
   -- snippets
   use "L3MON4D3/LuaSnip" --snippet engine
   use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

   -- LSP
   use "neovim/nvim-lspconfig" -- Quickstart configs for Nvim LSP
   use "williamboman/mason.nvim" -- Easily install and manage LSP servers, DAP servers, linters, and formatters
   use "williamboman/mason-lspconfig.nvim" -- makes it easier to use lspconfig with mason.nvim

   -- Telescope
   use {
     'nvim-telescope/telescope.nvim', tag = '0.1.0', -- Find, Filter, Preview, Pick
     requires = { {'nvim-lua/plenary.nvim'} }
   }

   -- Treesitter
   use {
     'nvim-treesitter/nvim-treesitter', -- Nvim Treesitter configurations and abstraction layer
     run = ':TSUpdate'
   }
   use "nvim-treesitter/playground" -- Treesitter playground integrated into Neovim
   use 'JoosepAlviste/nvim-ts-context-commentstring'

   -- Git
   use 'ruifm/gitlinker.nvim' -- Generate shareable file permalinks for several git hosts

   use {
     'nvim-lualine/lualine.nvim',
     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
   }
   use {
     'lewis6991/gitsigns.nvim',
     config = function()
       require('gitsigns').setup{
         on_attach = function(bufnr)
           local gs = package.loaded.gitsigns

           local function map(mode, l, r, opts)
             opts = opts or {}
             opts.buffer = bufnr
             vim.keymap.set(mode, l, r, opts)
           end

           -- Navigation
           map('n', ']c', function()
             if vim.wo.diff then return ']c' end
             vim.schedule(function() gs.next_hunk() end)
             return '<Ignore>'
           end, {expr=true})

           map('n', '[c', function()
             if vim.wo.diff then return '[c' end
             vim.schedule(function() gs.prev_hunk() end)
             return '<Ignore>'
           end, {expr=true})

           -- Actions
           map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
           map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
           map('n', '<leader>hS', gs.stage_buffer)
           map('n', '<leader>hu', gs.undo_stage_hunk)
           map('n', '<leader>hR', gs.reset_buffer)
           map('n', '<leader>hp', gs.preview_hunk)
           map('n', '<leader>hb', function() gs.blame_line{full=true} end)
           map('n', '<leader>tb', gs.toggle_current_line_blame)
           map('n', '<leader>hd', gs.diffthis)
           map('n', '<leader>hD', function() gs.diffthis('~') end)
           map('n', '<leader>td', gs.toggle_deleted)

           -- Text object
           map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
         end
       }
     end
   }
   use 'norcalli/nvim-colorizer.lua'
   use 'gpanders/editorconfig.nvim'
   use 'ggandor/leap.nvim'

   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   if packer_bootstrap then
     require('packer').sync()
   end
end)
