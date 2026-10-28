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
function M.apply_to_config(config: Config): nil

---Returns choices for the InputSelector.
---@param opts? SWSChoiceOpts
function M.get_choices(opts): SWSInputSelectorChoice[]


function M.switch_to_prev_workspace(): {

---@param opts? SWSChoiceOpts
function M.switch_workspace(opts): {

function M.workspace_formatter(label: string): string

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
