local wezterm = require("wezterm")
return {
	font = wezterm.font("FiraCode Nerd Font", { weight = 'Medium' }),
    font_size = 16.0,
	color_scheme = "rose-pine",
	window_padding = {
		left = 0,
		right = 0,
		top = 10,
		bottom = 10,
	},
	-- window_background_opacity = 0.8,
	max_fps = 120,
	-- text_background_opacity = 0,
	hide_tab_bar_if_only_one_tab = true,
}
