local _tmp = require("_tmp")

local enum Show
	"base"
	"full"
end

local record Binding --WorkspacesionizerOpts.Binding: SendKeyParams
	mods: string | nil   ---The key to press.
	key: string | nil   ---The key to press.
end

local record WorkspacesionizerOpts
	binding:   WorkspacesionizerOpts | nil
	
	git_repos: boolean | nil    ---Set to `false` if you don't want to include the git repositories from your `HOME` directory in the directories to switch into.
	paths:     {string} | nil   ---The paths that contains the directories you want to switch into.
	show:      Show | nil       ---Wether to show directories base or full name.
end

local record Workspacesionizer
	apply_to_config: function(config: _tmp.Config, options: WorkspacesionizerOpts|nil): _tmp.Config
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
