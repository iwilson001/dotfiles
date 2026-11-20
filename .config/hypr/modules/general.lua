hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 2,

		border_size = 1,

		col = {
			active_border = "rgb(d79921)",
			inactive_border = "rgb(272727)",
		},

		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,

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
