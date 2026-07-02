hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 8,

		border_size = 1,

		col = {
			active_border = { colors = { "rgb(ebdbb2)", "rgb(d65d0e)" }, angle = 60 },
			inactive_border = "rgb(272727)",
		},

		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 8,

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
		},
	},

	animations = {
		enabled = false,
	},

	misc = {
		disable_hyprland_logo = true,
		col = {
			splash = 0x665c54,
		},
		splash_font_family = "JetBrains Mono",
		force_default_wallpaper = false,
		font_family = "JetBrainsMono NL Nerd Font",
	},

	master = {
		new_status = "master",
	},
})
