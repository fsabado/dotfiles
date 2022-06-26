
-- Background
vim.o.background = 'light'

-- Window-scoped options
vim.wo.colorcolumn = '80'

-- buffer-scoped
vim.opt.autoindent = true

-- window-scoped
vim.opt.cursorline = true

-- global scope
vim.opt.autowrite = true

-- Set the behavior of tab
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

-- Cursor Lines
vim.opt.cursorline = true


-- Guide: https://www.youtube.com/watch?v=QB9V__3VO2s
-- Init Vim Plug

-- vim.call('plug#begin', '~/.config/nvim/plugged')
-- Plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

-- The NERDTree is a file system explorer for the Vim editor
-- https://github.com/preservim/nerdtree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

-- Yet Another Remote Plugin Framework for Neovim
-- https://github.com/roxma/nvim-yarp
Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
-- "dark powered neo-completion": Code completion
-- https://github.com/Shougo/deoplete.nvim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

-- Brings JetBrains/IntelliJ IDEs magic to Neovim with minimal setup.
-- https://github.com/beeender/Comrade
Plug 'beeender/Comrade'

vim.call('plug#end')