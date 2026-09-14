-- Indentation
-- vim.opt.tabstop = 4     -- Number of spaces that a tab counts for (don't need to change)
vim.opt.shiftwidth = 4     -- Width for auto-indents
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.softtabstop = 4    -- Insert/delete 4 spaces when pressing Tab/Backspace

-- Cursor
vim.opt.guicursor = "a:block"

-- Terminal
-- tnoremap <Esc> <C-\><C-n>

-- System clipboard
-- Use the system clipboard for normal yanks/deletes.
vim.opt.clipboard = "unnamedplus"

-- Ctrl+Shift+C: explicitly copy the visual selection to the system clipboard.
vim.keymap.set("v", "<C-S-c>", '"+y', { noremap = true })

-- Delete without overwriting the system clipboard.
-- "_ is the black-hole register.
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "D", '"_D')
vim.keymap.set("n", "x", '"_x')
