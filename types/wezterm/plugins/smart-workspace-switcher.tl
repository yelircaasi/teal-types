---@diagnostic disable:unused-local

local record SWSChoiceOpts
	extra_args: string | nil
	workspace_ids: table | nil<string, boolean>
end

local record SWSInputSelectorChoice
	id: string
	label: string
end

local record SWSChoices
local C = {}

---@param choices SWSInputSelectorChoice[]
---@return SWSInputSelectorChoice[] choice_table
function C.get_workspace_elements(choices): table<string,

---@param choices SWSInputSelectorChoice[]
---@param opts? SWSChoiceOpts
function C.get_zoxide_elements(choices, opts): SWSInputSelectorChoice[]

local record SWS
	choices: SWSChoices
	zoxide_path: string
local M = {}

---Sets default keybind to ALT-s.
apply_to_config: function(config: Config): nil

---Returns choices for the InputSelector.
---@param opts? SWSChoiceOpts
get_choices: function(opts): SWSInputSelectorChoice[]


switch_to_prev_workspace: function(): {

---@param opts? SWSChoiceOpts
switch_workspace: function(opts): {

workspace_formatter: function(label: string): string

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
