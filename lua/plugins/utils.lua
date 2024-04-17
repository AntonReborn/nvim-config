return {
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
}
