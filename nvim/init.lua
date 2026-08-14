vim.wo.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
	vim.cmd('slient !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-tree/nvim-tree.lua')
Plug('norcalli/nvim-colorizer.lua')
Plug('nvim-treesitter/nvim-treesitter')
Plug('romgrk/barbar.nvim')
Plug('nvim-lualine/lualine.nvim')

vim.call('plug#end')

require('nvim-tree').setup()

require('nvim-treesitter').setup {
	install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'c', 'cpp', 'lua'}

require('colorizer').setup()
require('lualine').setup {
	options = { theme = 'horizon'}
}

vim.g.barbar_auto_setup = false
require('barbar').setup{
	animation = true,
	clickable = true,
	icons = { filetype = { enabled = false}}
}

-- vim pack
vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }
require('catppuccin').setup()

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n','<A-,>',':BufferPrevious<CR>')
vim.keymap.set('n','<A-.>',':BufferNext<CR>')

vim.cmd.colorscheme('catppuccin-mocha')

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
