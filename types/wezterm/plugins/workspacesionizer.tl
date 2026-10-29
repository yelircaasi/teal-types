local type WorkspacesionizerOpts.Show =
	"base"|"full"

local record WorkspacesionizerOpts.Binding: SendKeyParams
	---The key to press.
	key: string | nil
	---The key to press.
	mods: string | nil
end

local record WorkspacesionizerOpts
	binding: WorkspacesionizerOpts | nil
	---Set to `false` if you don't want to include the git repositories from your `HOME` directory
	---in the directories to switch into.
	git_repos: boolean | nil
	---The paths that contains the directories you want to switch into.
	paths: string | {nil}
	---Wether to show directories base or full name.
	show: WorkspacesionizerOpts |Show | nil
end

local record Workspacesionizer
	apply_to_config: function(config: Config, options: WorkspacesionizerOpts|nil): Config
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
