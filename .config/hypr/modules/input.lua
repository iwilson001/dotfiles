hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = -0.5, -- -1.0 - 1.0, 0 means no modification.
		accel_profile = "flat",

		numlock_by_default = true,

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
		},

		repeat_delay = 240,
		repeat_rate = 22,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
