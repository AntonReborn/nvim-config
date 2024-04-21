-- return {
-- 	"simrat39/rust-tools.nvim",
-- 	ft = "rust",
-- 	opts = {
-- 		server = {
-- 			on_attach = function(_, bufnr)
-- 				local rt = require("rust-tools")
-- 				-- Hover actions
-- 				vim.keymap.set("n", "<Leader>rk", rt.hover_actions.hover_actions, { buffer = bufnr })
-- 				-- Code action groups
-- 				vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr })
-- 			end,
-- 		},
-- 		tools = {
-- 			hover_actions = {
-- 				auto_focus = true,
-- 			},
-- 		},
-- 	},
-- }

return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	lazy = false, -- This plugin is already lazy
	init = function()
		vim.g.rustaceanvim = {
			server = {
				cmd = function()
					local mason_registry = require("mason-registry")
					local ra_binary = mason_registry.is_installed("rust-analyzer")
							-- This may need to be tweaked, depending on the operating system.
							and mason_registry.get_package("rust-analyzer"):get_install_path() .. "/rust-analyzer-aarch64-apple-darwin"
						or "rust-analyzer"
					return { ra_binary } -- You can add args to the list, such as '--log-file'
				end,
			},
		}
	end,
	-- keys = {
	-- 	"<leader>ca",
	-- 	function()
	-- 		vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- 		-- or vim.lsp.buf.codeAction() if you don't want grouping.
	-- 	end,
	-- },
}
