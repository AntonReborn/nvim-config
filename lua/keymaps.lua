vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
-- vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>")

vim.keymap.set("n", "<A-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<A-k>", "<cmd>cprevious<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>,", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })

vim.keymap.set("n", "<C-g>", "<cmd>silent !tmux neww ~/.config/utils/tmux-sessionizer.sh<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.config/utils/tmux-sessionizer-favorites.sh<CR>")

vim.keymap.set("n", "<leader>wa", function()
	vim.cmd("silent !~/.config/utils/favorites.sh add " .. vim.fn.getcwd())
end, { desc = "[A]dd project to the favorites" })

vim.keymap.set("n", "<leader>wr", function()
	vim.cmd("silent !~/.config/utils/favorites.sh remove " .. vim.fn.getcwd())
end, { desc = "[R]emove project from the favorites" })

local keymap = vim.keymap.set

-- cmake
keymap("n", "<leader>cc", "<cmd>CMakeGenerate<CR>", { desc = "Generate" })
keymap("n", "<leader>cb", "<cmd>CMakeBuild<CR>", { desc = "Build" })
keymap("n", "<leader>cx", "<cmd>CMakeRun<CR>", { desc = "Run" })
keymap("n", "<leader>cd", "<cmd>CMakeDebug<CR>", { desc = "Debug" })
keymap("n", "<leader>ct", "<cmd>CMakeSelectBuildType<CR>", { desc = "Select Build Type" })
keymap("n", "<leader>cu", "<cmd>CMakeSelectBuildTarget<CR>", { desc = "Select Build Target" })
keymap("n", "<leader>cl", "<cmd>CMakeSelectLaunchTarget<CR>", { desc = "Select Launch Target" })
keymap("n", "<leader>ceo", "<cmd>CMakeOpenExecutor<CR>", { desc = "Open CMake Executor" })
keymap("n", "<leader>cec", "<cmd>CMakeCloseExecutor<CR>", { desc = "Close CMake Executor" })
keymap("n", "<leader>cro", "<cmd>CMakeOpenRunner<CR>", { desc = "Open CMake Runner" })
keymap("n", "<leader>crc", "<cmd>CMakeCloseRunner<CR>", { desc = "Close CMake Runner" })
keymap("n", "<leader>ci", "<cmd>CMakeInstall<CR>", { desc = "Intall CMake target" })
keymap("n", "<leader>cn", "<cmd>CMakeClean<CR>", { desc = "Clean CMake target" })
keymap("n", "<leader>cs", function()
	vim.cmd([[CMakeStopRunner]])
	vim.cmd([[CMakeStopExecutor]])
end, { desc = "Stop CMake Process" })

-- Define a function to toggle the quickfix window
function ToggleQuickfix()
	-- Check if the quickfix window is open
	local windows = vim.api.nvim_list_wins()
	local quickfix_open = false

	for _, win_id in ipairs(windows) do
		local buf_id = vim.api.nvim_win_get_buf(win_id)
		if vim.api.nvim_get_option_value("buftype", { buf = buf_id }) == "quickfix" then
			quickfix_open = true
			break
		end
	end

	-- Toggle the quickfix window
	if quickfix_open then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end

-- Map <A-q> to toggle_quickfix function in normal mode
keymap({ "n", "i" }, "<A-q>", ":lua ToggleQuickfix()<CR>", { noremap = true, silent = true })
