return {
	{
		"Civitasv/cmake-tools.nvim",
		opts = {
			cmake_command = "cmake", -- this is used to specify cmake command path
			ctest_command = "ctest", -- this is used to specify ctest command path
			cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
			cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
			cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
			-- support macro expansion:
			--       ${kit}
			--       ${kitGenerator}
			--       ${variant:xx}
			cmake_build_directory = "out/${variant:buildType}", -- this is used to specify generate directory for cmake, allows macro expansion, relative to vim.loop.cwd()
			cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
			cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
			cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
			cmake_variants_message = {
				short = { show = true }, -- whether to show short message
				long = { show = true, max_length = 40 }, -- whether to show long message
			},
			cmake_dap_configuration = { -- debug settings for cmake
				name = "cpp",
				type = "codelldb",
				request = "launch",
				stopOnEntry = false,
				runInTerminal = true,
				console = "integratedTerminal",
			},
			cmake_executor = { -- executor to use
				name = "quickfix", -- name of the executor
				opts = {
					show = "always", -- "always", "only_on_error"
					position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
					size = 10,
					encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
					auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
				}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
			},
			cmake_runner = { -- runner to use
				name = "overseer", -- name of the runner
				opts = {
					new_task_opts = {
						strategy = {
							"toggleterm",
							direction = "float",
							auto_scroll = true,
						},
					}, -- options to pass into the `overseer.new_task` command
					-- on_new_task = function(task)
					-- 	require("overseer").open({ enter = false, direction = "right" })
					-- end,
				}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
			},
			cmake_notifications = {
				runner = { enabled = true },
				executor = { enabled = true },
				spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
				refresh_rate_ms = 100, -- how often to iterate icons
			},
		},
		dependencies = {
			{ "akinsho/toggleterm.nvim", version = "*", config = true },
			{
				"stevearc/overseer.nvim",
				config = true,
				keys = {
					{ "<A-w>", "<cmd>OverseerToggle<CR>" },
				},
			},
		},
	},
}
