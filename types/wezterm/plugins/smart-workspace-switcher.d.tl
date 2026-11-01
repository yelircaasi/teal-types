local _tmp = require("_tmp")

local record _ActionCallback
	EmitEvent: string
end

local record SWSChoiceOpts
	extra_args:    string | nil
	workspace_ids: {string: boolean} | nil
end

local record SWSInputSelectorChoice
	id:    string
	label: string
end

local record SWSChoices
	get_workspace_elements: function(choices: {SWSInputSelectorChoice}): {{string}, {SWSInputSelectorChoice}}
	get_zoxide_elements:    function(choices: {SWSInputSelectorChoice}, opts: SWSChoiceOpts|nil): {SWSInputSelectorChoice}
end

local record SWS
	choices:     SWSChoices
	zoxide_path: string
	apply_to_config: function(config: _tmp.Config): nil   ---Sets default keybind to ALT-s.
	get_choices:     function(opts: SWSChoiceOpts|nil): {SWSInputSelectorChoice}
	switch_to_prev_workspace: function(): _ActionCallback
	switch_workspace: function(opts: SWSChoiceOpts|nil): _ActionCallback
	workspace_formatter: function(label: string): string
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
