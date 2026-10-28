---@diagnostic disable:unused-local

local record WorkspacePickerColors
	current_indicator: string | nil
	path: string | nil
	text: string | nil
	workspace_prefix: string | nil
	zoxide_prefix: string | nil
end

local record WorkspacePickerKeybind: SendKeyParams
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
local M = {}

---Add keybindings to your WezTerm config.
---@param config Config
---@param opts? WorkspacePickerConfig
function M.apply_to_config(config, opts): Config

---Create new workspace manually.
function M.create_workspace_manually(): {

---Rename workspace.
function M.rename_workspace(): {

---Initialize configuration.
---@param opts? WorkspacePickerConfig
function M.setup(opts): WorkspacePicker

---Display workspace selector.
function M.show_workspace_selector(window: Window The `Window` object., pane: Pane The `Pane` object.): nil

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
