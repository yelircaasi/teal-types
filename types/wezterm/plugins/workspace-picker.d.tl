local _tmp = require("_tmp")

local record WorkspacePickerColors
	current_indicator: string | nil
	path: string | nil
	text: string | nil
	workspace_prefix: string | nil
	zoxide_prefix: string | nil
end

local record WorkspacePickerKeybind --: SendKeyParams
	mods: string
end

local record WorkspacePickerKeybinds
	create_workspace: WorkspacePickerKeybind | nil
	rename_workspace: WorkspacePickerKeybind | nil
	show_picker: WorkspacePickerKeybind | nil
end

local record WorkspacePickerLabels
	current: string | nil
	workspace: string | nil
	zoxide: string | nil
end

local record WorkspacePickerConfig
	colors: WorkspacePickerColors | nil
	keybinds: WorkspacePickerKeybinds | nil
	labels: WorkspacePickerLabels | nil
	zoxide_path: string | nil
end

local record WorkspacePicker

	apply_to_config: function(config: _tmp.Config, opts: WorkspacePickerConfig|nil): _tmp.Config   ---Add keybindings to your WezTerm config.

	create_workspace_manually: function(): {string: {string: any}} --{ PromptInputLine: PromptInputLineParams }   ---Create new workspace manually.

	rename_workspace: function(): {string: {string: any}} --{ PromptInputLine: PromptInputLineParams }   ---Rename workspace.

	setup: function(opts: WorkspacePickerConfig|nil): WorkspacePicker      ---Initialize configuration.

	show_workspace_selector: function(window:_records.Window, pane: _tmp.Pane): nil   ---Display workspace selector.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
