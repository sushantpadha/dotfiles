-- vim.opt.tabstop = 4     -- Number of spaces that a tab counts for (dont need to change)
vim.opt.shiftwidth = 4     -- Width for auto-indents
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.softtabstop = 4    -- Insert/delete 4 spaces when pressing tab/backspace

-- tnoremap <Esc> <C-\><C-n>

-- remap ctrl shift c for copy instead of "+y or y after doing `set clipboard=unnamedplus`
vim.opt.clipboard = "unnamedplus"  -- assumes a clipboard manager is installed by default
vim.keymap.set('v', '<C-S-c>', 'y', { noremap = true })


