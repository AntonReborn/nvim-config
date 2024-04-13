return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
	config = function()
		local harpoon = require("harpoon")
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "[A]dd to Harpoon2" })

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-f>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(3)
		end)

		vim.keymap.set("n", "<leader>h1", function()
			harpoon:list():select(1)
		end, { desc = "[1]st buffer (<C-f>)" })

		vim.keymap.set("n", "<leader>h2", function()
			harpoon:list():select(2)
		end, { desc = "[2]st buffer (<C-s>)" })

		vim.keymap.set("n", "<leader>h3", function()
			harpoon:list():select(3)
		end, { desc = "[3]st buffer (<C-t>)" })

		vim.keymap.set("n", "<leader>h4", function()
			harpoon:list():select(4)
		end, { desc = "[4]st buffer" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<A-n>", function()
			harpoon:list():next()
		end)

		-- NEW COMMENT
		vim.keymap.set("n", "<A-p>", function()
			harpoon:list():prev()
		end)

		if harpoon:list():length() > 0 and vim.fn.argv()[1] == "." then
			harpoon:list():select(1)
		end
	end,
}
