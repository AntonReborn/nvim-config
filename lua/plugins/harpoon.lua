return {
	"AntonReborn/harpoon",
	branch = "sync-cursor",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
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
			"<A-a>",
			function()
				require("harpoon"):list():select(1)
			end,
			mode = "n",
		},

		{
			"<A-s>",
			function()
				require("harpoon"):list():select(2)
			end,
			mode = "n",
		},

		{
			"<A-d>",
			function()
				require("harpoon"):list():select(3)
			end,
			mode = "n",
		},

		{
			"<A-f>",
			function()
				require("harpoon"):list():select(4)
			end,
			mode = "n",
		},

		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			mode = "n",
			{ desc = "[1]st buffer (<C-h>)" },
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
