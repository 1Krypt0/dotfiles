return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({

			formatters_by_ft = {
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				cs = { "csharpier" },
				astro = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			-- Override just in case your csharpier version is old
			formatters = {
				csharpier = {
					command = vim.fn.expand("~/.dotnet/tools/csharpier"), -- full path,
					args = { "format", "--write-stdout" }, -- if this errors, replace with "--stdout"
					stdin = true,
				},
			},
		})
	end,
}
