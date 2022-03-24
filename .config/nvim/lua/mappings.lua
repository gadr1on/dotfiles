-- Mapping helper
local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true, expr = false })
end

-- Expressive Mapping helper
local expressive_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { silent = true, expr = true })
end

-- Default Mapping helper
local plug_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {})
end

-- Define Mapleader
vim.g.mapleader = ' '

-- Saving files
-- mapper('n', '<leader>w', ':%s/\\s\\+$//e<CR>:w<CR>') -- strip trailling spaces
mapper('n', '<leader>w', ':w<CR>')

-- Delete charater without yank
mapper('n', 'x', '"_x')

-- Fast vertical navigation
mapper('n', '<C-J>', '10j')
mapper('n', '<C-K>', '10k')
mapper('v', '<C-J>', '10j')
mapper('v', '<C-K>', '10k')

-- Paste contents of register 0
mapper('n', '<leader>p', '"0p') -- To get last yanked content

-- Duplitcate Line
mapper('n', 'tt', ':t.<CR>')

-- Search and Replace
mapper('v', '/', "y/<C-R>=escape(@\",'/\')<CR><CR>") -- Search selection
mapper('n', '<leader>ra', ':%s///gc<Left><Left><Left>') -- * with confirmation
mapper('v', '<leader>ra', ':s///gc<Left><Left><Left>') -- * with confirmation
mapper('v', '<leader>rr', "\"sy:let @/=@s<CR>cgn") -- replace selection (press . to repeat replacement)
mapper('n', '<leader>rr', "cgn") -- replace highlight (press . to repeat replacement)

--  Toggle Numbers
mapper('n', '<leader>n', ':set nu! rnu!<CR>')

-- use ESC to turn off search highlighting
mapper('n', '<Esc>', ':noh<CR>')

-- Terminal
mapper('t', '<Esc>', '<C-\\><C-n>') -- escape from terminal mode
mapper('n', '<leader>t', ':terminal<CR>')

-- Increment/Decrement numbers
mapper('n', '+', '<C-a>')
mapper('n', '-', '<C-x>')

-- Quick semicolon (end of line)
mapper('n', '<leader>;', '$a;<Esc>')

----------------------
--    Move Text     --
----------------------
-- Move text up/down
mapper('n', '<A-j>', ':m .+1<CR>==')
mapper('i', '<A-j>', '<Esc>:m .+1<CR>==')
mapper('v', '<A-j>', ":m '>+1<CR>gv=gv")
mapper('n', '<A-k>', ':m .-2<CR>==')
mapper('i', '<A-k>', '<Esc>:m .-2<CR>==')
mapper('v', '<A-k>', ":m '<-2<CR>gv=gv")
-- Indent block
mapper('v', '>', '>gv')
mapper('v', '<', '<gv')
-- Keeping it centered
mapper('n', 'J', 'mzJ`z')

----------------------
--     Buffers      --
----------------------
-- Navigate buffers
mapper('n', '<S-l>', ':bnext<CR>')
mapper('n', '<S-h>', ':bprevious<CR>')
-- Modify buffers
mapper('n', '<leader>bv', ':vnew<CR>') -- Open new buffer in vertical mode
mapper('n', '<leader>bk', ':bp|bd#<CR>') -- Kill current buffer
mapper('n', '<leader>ba', ':%bd|e#|bd#<CR>') -- Kill all buffers except current

----------------------
--      Ctrl        --
----------------------
-- Copy to OS clipboard.
mapper('v', '<C-c>', '"+y')
mapper('n', '<C-c>', '"+yy')
-- Select all
mapper('n', '<C-a>', 'gg<S-v>G')

----------------------
--     Windows      --
----------------------
-- Close window
mapper('n', '<leader>q', ':q<CR>')
mapper('n', '<leader>Q', ':qa!<CR>')
-- Spit window
mapper('n', 'ss', ':split<CR>')
mapper('n', 'sv', ':vsplit<CR>')
-- Move window
mapper('n', '<Down>', '<C-w>j')
mapper('n', '<Up>', '<C-w>k')
mapper('n', '<Left>', '<C-w>h')
mapper('n', '<Right>', '<C-w>l')
-- Resize window
mapper('n', '<C-Down>', ':resize -2<CR>')
mapper('n', '<C-Up>', ':resize +2<CR>')
mapper('n', '<C-Right>', ':vertical resize -2<CR>')
mapper('n', '<C-Left>', ':vertical resize +2<CR>')

----------------------
-- Plugins Mappings --
----------------------
-- Telescope
mapper('n', '<Leader>ff', ':Telescope find_files<CR>')
mapper('n', '<Leader>fg', ':Telescope live_grep<CR>')
mapper('n', '<Leader>fb', ':Telescope buffers<CR>')
mapper('n', '<Leader>fk', ':Telescope keymaps<CR>')
-- Tree
mapper('n', '<leader>e', ':NvimTreeToggle<CR>')
