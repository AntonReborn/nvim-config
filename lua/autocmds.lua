-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "?*" },
	desc = "save view (folds), when closing file",
	command = "mkview 1",
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "?*" },
	desc = "load view (folds), when opening file",
	command = "silent! loadview 1",
})

vim.api.nvim_create_autocmd({ "QuitPre" }, {
	pattern = "*",
	callback = function()
		-- Do this for all your lists
		require("harpoon"):list():sync_cursor()
	end,
})
