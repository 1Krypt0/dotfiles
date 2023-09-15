return {
	'nvim-telescope/telescope.nvim', tag = '0.1.2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	},
}
