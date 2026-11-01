local _tmp = require("_tmp")

local record PresentationWezConfigMode
	enabled:              boolean | nil
	font_size_multiplier: number | nil
	font_weight:          _tmp.FontWeight | nil
	keybind:              _tmp.Key | nil
end

local record PresentationWezConfig
	font_size_multiplier: number | nil
	font_weight:          _tmp.FontWeight | nil
	presentation:         PresentationWezConfigMode | nil
	presentation_full:    PresentationWezConfigMode | nil
end

local record PresentationWez
	apply_to_config: function(config: _tmp.Config, opts: PresentationWezConfig|nil): _tmp.Config
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
