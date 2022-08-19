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
     'nvim-lualine/lualine.nvim',
     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
   }
   use {
     'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate'
   }
   -- cmp plugins
   use 'hrsh7th/nvim-cmp' -- The completion plugin
   use 'hrsh7th/cmp-buffer' -- buffer completions
   use 'hrsh7th/cmp-path' -- path completions
   use 'hrsh7th/cmp-cmdline' -- cmdline completions
   use 'saadparwaiz1/cmp_luasnip' -- snippet completions
   use 'hrsh7th/cmp-nvim-lsp'

   -- lsp plugins
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"

   -- snippets
   use "L3MON4D3/LuaSnip" --snippet engine
   use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
   use {
     'nvim-telescope/telescope.nvim', tag = '0.1.0',
     requires = { {'nvim-lua/plenary.nvim'} }
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
   use 'shaunsingh/nord.nvim'
   use 'terrortylor/nvim-comment'
   use 'gpanders/editorconfig.nvim'
   use 'ggandor/leap.nvim'

   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   if packer_bootstrap then
     require('packer').sync()
   end
end)