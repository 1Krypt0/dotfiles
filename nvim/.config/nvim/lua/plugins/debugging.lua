return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		local utils = require("dap.utils")

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue stepping" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
		vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step Over" })
		vim.keymap.set("n", "<leader>db", dap.step_back, { desc = "Step Back" })
		vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart" })
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Add a breakpoint" })
		vim.keymap.set("n", "<leader>dg", dap.run_to_cursor, { desc = "Go to cursor" })
		vim.keymap.set("n", "<leader>ds", dap.terminate, { desc = "Stop a session" })
		vim.keymap.set("n", "<leader>d?", function()
			dapui.eval(nil, { enter = true })
		end, { desc = "Eval under cursor" })

		dap.adapters = {
			["pwa-node"] = {
				type = "server",
				port = "${port}",
				executable = {
					command = "js-debug-adapter",
					args = {
						"${port}",
					},
				},
			},
		}

		dap.configurations["typescript"] = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to process ID",
				processId = utils.pick_process,
				cwd = "${workspaceFolder}",
			},
		}

		require("easy-dotnet.netcoredbg").register_dap_variables_viewer()
	end,
}
