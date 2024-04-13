return {
	"AntonReborn/harpoon",
	branch = "sync-cursor",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			mode = "n",
			{ desc = "[A]dd to Harpoon2" },
		},

		{
			"<C-e>",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			mode = "n",
		},

		{
			"<C-f>",
			function()
				require("harpoon"):list():select(1)
			end,
			mode = "n",
		},

		{
			"<C-s>",
			function()
				require("harpoon"):list():select(2)
			end,
			mode = "n",
		},
		{
			"<C-t>",
			function()
				require("harpoon"):list():select(3)
			end,
			mode = "n",
		},

		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			mode = "n",
			{ desc = "[1]st buffer (<C-f>)" },
		},

		{
			"<leader>h2",
			function()
				require("harpoon"):list():select(2)
			end,
			mode = "n",
			{ desc = "[2]st buffer (<C-s>)" },
		},

		{
			"<leader>h3",
			function()
				require("harpoon"):list():select(3)
			end,
			mode = "n",
			{ desc = "[3]st buffer (<C-t>)" },
		},

		{
			"<leader>h4",
			function()
				require("harpoon"):list():select(4)
			end,
			mode = "n",
			{ desc = "[4]st buffer" },
		},

		-- Toggle previous & next buffers stored within Harpoon list
		{
			"<A-n>",
			function()
				require("harpoon"):list():next()
			end,
			mode = "n",
		},

		{
			"<A-p>",
			function()
				require("harpoon"):list():prev()
			end,
			mode = "n",
		},
	},

	init = function()
		if require("harpoon"):list():length() > 0 and vim.fn.argv()[1] == "." then
			require("harpoon"):list():select(1)
		end
	end,

	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = false,
				sync_on_ui_close = false,
			},
		})
	end,
}
