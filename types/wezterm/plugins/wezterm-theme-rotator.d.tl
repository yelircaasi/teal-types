local _tmp = require("_tmp")

local record ThemeRotatorOpts
	default_theme_key:  string | nil   ---Customize "Default Theme" key.
	default_theme_mods: string | nil

	next_theme_key:     string | nil   ---Customize "Next Theme" key.
	next_theme_mods:    string | nil

	prev_theme_key:     string | nil   ---Customize "Previous Theme" key.
	prev_theme_mods:    string | nil

	random_theme_key:   string | nil   ---Customize "Random Theme" key.
	random_theme_mods:  string | nil
end

local record ThemeRotator
	apply_to_config: function(config: _tmp.Config, options: ThemeRotatorOpts|nil): _tmp.Config
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
