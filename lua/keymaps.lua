vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

vim.keymap.set("n", "<C-w>.", "10<C-w>>", { noremap = false })
vim.keymap.set("n", "<C-w>,", "10<C-w><", { noremap = false })
vim.keymap.set("n", "<C-w>=", "10<C-w>+", { noremap = false })
vim.keymap.set("n", "<C-w>-", "10<C-w>-", { noremap = false })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
-- vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>")

function is_location_list_open()
	local tabs = vim.api.nvim_list_tabpages()
	local current_tab = vim.api.nvim_get_current_tabpage()
	local wins = vim.api.nvim_tabpage_list_wins(current_tab)

	for _, win in ipairs(wins) do
		local is_loc_list = vim.fn.getloclist(0, { winid = 0 }).winid ~= 0
		if is_loc_list then
			return true
		end
	end

	return false
end

vim.keymap.set("n", "<A-j>", function()
	if is_location_list_open() then
		vim.cmd("silent! lnext")
	else
		vim.cmd("silent! cnext")
	end
end)

vim.keymap.set("n", "<A-k>", function()
	if is_location_list_open() then
		vim.cmd("silent! lprevious")
	else
		vim.cmd("silent! cprevious")
	end
end)

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

vim.keymap.set("n", "<leader>hh", function()
	vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay [h]ints" })
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
function ToggleQuickfix(buf_prefix)
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
		vim.cmd(buf_prefix .. "close")
	else
		vim.cmd(buf_prefix .. "open")
	end
end

vim.keymap.set("n", "<Leader>q", function()
	vim.diagnostic.setloclist({ open = false })
	ToggleQuickfix("l")
end, { desc = "Toggle diagnostic [Q]uickfix list" })
-- Map <A-q> to toggle_quickfix function in normal mode
keymap({ "n", "i" }, "<A-q>", ":lua ToggleQuickfix('c')<CR>", { noremap = true, silent = true })

-- debug
keymap(
	"n",
	"<leader>dt",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Toggle Condition Breakpoint" }
)
keymap("n", "<leader>dk", "<cmd>lua require'dap'.up()<CR>", { desc = "Stack up" })
keymap("n", "<leader>dj", "<cmd>lua require'dap'.down()<CR>", { desc = "Stack down" })
keymap("n", "<leader>dn", "<cmd>lua require'dap'.run_to_cursor()<CR>", { desc = "Run To Cursor" })
keymap("n", "<leader>dq", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Terminate" })
--[[ .exit               Closes the REPL ]]
--[[ .c or .continue     Same as |dap.continue| ]]
--[[ .n or .next         Same as |dap.step_over| ]]
--[[ .into               Same as |dap.step_into| ]]
--[[ .into_target        Same as |dap.step_into{askForTargets=true}| ]]
--[[ .out                Same as |dap.step_out| ]]
--[[ .up                 Same as |dap.up| ]]
--[[ .down               Same as |dap.down| ]]
--[[ .goto               Same as |dap.goto_| ]]
--[[ .scopes             Prints the variables in the current scopes ]]
--[[ .threads            Prints all threads ]]
--[[ .frames             Print the stack frames ]]
--[[ .capabilities       Print the capabilities of the debug adapter ]]
--[[ .b or .back         Same as |dap.step_back| ]]
--[[ .rc or .reverse-continue   Same as |dap.reverse_continue| ]]
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", { desc = "Toggle Repl" })
keymap("n", "<leader>df", "<cmd>Telescope dap frames<CR>", { desc = "Stack frames" })
keymap("n", "<leader>db", "<cmd>Telescope dap list_breakpoints<CR>", { desc = "All breakpoints" })
keymap(
	"n",
	"<leader>ds",
	"<cmd>lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.scopes)<CR>",
	{ desc = "View current scope" }
)

keymap({ "n", "i" }, "<F5>", function()
	require("dap").toggle_breakpoint()
end, { silent = true })

-- Debug
keymap({ "n", "t" }, "<A-t>", function()
	require("dap").step_out()
end, { silent = true, desc = "step out" })

keymap({ "n", "t" }, "<A-i>", function()
	require("dap").step_into()
end, { silent = true, desc = "step into" })

keymap({ "n", "t" }, "<A-o>", function()
	require("dap").step_over()
end, { silent = true, desc = "step over" })

keymap({ "n", "t" }, "<A-c>", function()
	if require("dap").session() == nil then
		vim.cmd.RustLsp("debuggables")
	else
		require("dap").continue()
	end
end, { silent = true, desc = "continue" })

keymap({ "n", "t" }, "<A-h>", function()
	require("dap.ui.widgets").hover()
end, { silent = true, desc = "caculate expr" })
