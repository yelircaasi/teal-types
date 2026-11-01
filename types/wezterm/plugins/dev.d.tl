local _tmp = require("_tmp")

local enum Behavior
	"error"
	"keep"
	"force"
end

local record DevOpts
	auto: boolean | nil
	fetch_branch: boolean | nil
	ignore_branch: {string} | nil
	keywords: {string} | nil
end

local record CacheElement
	auto: boolean | nil
	branch: string | nil
	error: boolean | nil
	fetch_branch: boolean | nil
	file: string | nil
	ignore_branch: {string} | nil
	keywords: {string} | nil
	plugin_path: string | nil
	require_path: string | nil
end

local record Dev
	bootstrap: boolean
	cache: {string: CacheElement}
	dev_cache_element: CacheElement
	substitutions: {string: string} | nil
	utils: boolean

	get_plugin_path: function(hashkey: string): string|nil

	get_require_path: function(hashkey: string): string|nil

	require: function(url: string, opts: DevOpts|nil): any

	set_substitutions: function(substitute_dict: {string: string}): nil

	set_wezterm_require_path: function(hashkey: string): nil   ---Set the wezterm require path for the plugin.

	setup: function(opts: DevOpts|nil): string|nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
