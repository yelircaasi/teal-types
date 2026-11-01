local _tmp = require("_tmp")

local record PinnedTabsCreateOpts
	args: {string} | nil
	cwd: string | nil
	name: string | nil
	program: string | nil
end

local record PinnedTabsKey --: Key
	tab: PinnedTabsCreateOpts | nil
end

local record PinnedTabsOpts
	create: boolean | nil   ---Instead of WezTerm startup, you can do the cleanup on config reload.
	debug: boolean | nil   ---You don't want any debug logs (errors will still be logged).
	keys: {PinnedTabsKey} | nil
end

local record PinnedTabs
	apply_to_config: function(config: _tmp.Config, opts: PinnedTabsOpts|nil): nil

	cleanup: function(): nil   ---Clean up stale state files.

	create: function(opts: PinnedTabsCreateOpts): nil   ---Creates a pinned tab. Use this to configure the keybindings in your `wezterm.lua`.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
