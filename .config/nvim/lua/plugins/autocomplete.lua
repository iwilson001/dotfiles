return {
	{
		"milanglacier/minuet-ai.nvim",
		config = function()
			require("minuet").setup({
				virtual_text = {
					auto_trigger_ft = {},
					keymap = {
						accept = "",
						accept_line = "<C-j>",
						accept_n_lines = "",
						prev = "",
						next = "",
						dismiss = "",
					},
				},

				provider = "openai_fim_compatible",
				n_completions = 1, -- recommend for local model for resource saving
				-- I recommend beginning with a small context window size and incrementally
				-- expanding it, depending on your local computing power. A context window
				-- of 512, serves as an good starting point to estimate your computing
				-- power. Once you have a reliable estimate of your local computing power,
				-- you should adjust the context window to a larger value.
				context_window = 512,
				request_timeout = 5,

				provider_options = {
					openai_fim_compatible = {
						-- For Windows users, TERM may not be present in environment variables.
						-- Consider using APPDATA instead.
						api_key = "TERM",
						name = "Ollama",
						end_point = "http://localhost:11434/v1/completions",
						-- model = 'qwen2.5-coder:7b',
						model = "qwen2.5-coder:3b",
						optional = {
							max_tokens = 56,
							top_p = 0.9,
						},
					},
				},
			})
		end,
	},

	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept" },
				["<C-Space>"] = { "show" },
			},
			fuzzy = { implementation = "prefer_rust" },
			sources = {
				default = { "lsp", "buffer", "snippets", "path" },
			},
			completion = {
				menu = {
					auto_show = true,
				},
				documentation = { auto_show = true, auto_show_delay_ms = 300 },
				list = {
					selection = { preselect = true, auto_insert = false },
				},
			},
		},
	},
}
