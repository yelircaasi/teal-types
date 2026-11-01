local _tmp = require("_tmp")

local record Spec
	label:   string
	postfix: string | nil
	prefix:  string | nil

	extractor: function(s: string): {string}
end

local record ReplayOpts
	extractors:    Replay  | {Spec} | nil
	recall_key:    string  | nil
	replay_key:    string  | nil
	skip_keybinds: boolean | nil
end

local record _ActionCallback
	EmitEvent: string
end

local record Replay
	apply_to_config: function(config: _tmp.Config, opts: ReplayOpts|nil): nil

	recall: function(): _ActionCallback

	replay: function(): _ActionCallback
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
