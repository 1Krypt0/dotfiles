return {
	{
		"GustavEikaas/easy-dotnet.nvim",
		-- commit = "b7a33fa",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"Cliffback/netcoredbg-macOS-arm64.nvim",
		},
		config = function()
			local dotnet = require("easy-dotnet")

			local netcoredbg_path = vim.fn.stdpath("data") .. "/lazy/netcoredbg-macOS-arm64.nvim/netcoredbg/netcoredbg"

			dotnet.setup({
				debugger = {
					bin_path = netcoredbg_path,
				},
			})
		end,
	},
	{
		"Cliffback/netcoredbg-macOS-arm64.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
	},
}
