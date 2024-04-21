return {
	{
		"nvim-tree/nvim-tree.lua",
		config = true,
		keys = {
			{
				"+",
				"<CMD>NvimTreeFindFileToggle<CR>",
			},
		},
	},
	{
		"mbbill/undotree",
		init = function()
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
		keys = {
			{
				"<a-u>",
				function()
					vim.cmd(":UndotreeToggle")
				end,
			},
		},
	},
	{
		"monaqa/dial.nvim",
		keys = {
			{
				"<leader>ii",
				function()
					require("dial.map").manipulate("increment", "normal")
				end,
			},
			{
				"<leader>id",
				function()
					require("dial.map").manipulate("decrement", "normal")
				end,
			},
		},
	},
}
