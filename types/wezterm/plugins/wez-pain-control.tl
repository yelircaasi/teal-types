local record WezPainControlOpts
	pane_resize: integer | nil
end

local record WezPainControl
	apply_to_config: function(config: Config, opts: WezPainControlOpts|nil) end
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
