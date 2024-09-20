return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mxsdev/nvim-dap-vscode-js",
		},
	},

	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = {
			"microsoft/vscode-js-debug",
		},
		config = function()
			require("dap-vscode-js").setup({
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = { "pwa-node", "node-terminal" },
			})

			for _, language in ipairs({ "typescript", "javascript" }) do
				require("dap").configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					-- {
					-- 	type = "pwa-node",
					-- 	request = "attach",
					-- 	name = "Attach",
					-- 	processId = require("dap.utils").pick_process,
					-- 	cwd = "${workspaceFolder}",
					-- },
					{
						type = "pwa-node",
						request = "launch",
						name = "Debug Nest Framework",
						runtimeExecutable = "pnpm",
						runtimeArgs = { "run", "start:debug", "--", "--inspect-brk" },
						cwd = "${workspaceFolder}",
						autoAttachChildProcesses = true,
						restart = true,
						sourceMaps = true,
						stopOnEntry = false,
						console = "integratedTerminal",
					},
				}
			end
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},

	{
		"microsoft/vscode-js-debug",
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
		lazy = true,
	},
}
