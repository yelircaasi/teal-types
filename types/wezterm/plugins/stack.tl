---@diagnostic disable:unused-local

local type SpawnDirection =
	"Bottom"|"Left"|"Right"|"Top"

local record StackWezAction
SpawnPane: { EmitEvent: string }
local Action = {}

function Action.ActivatePaneRelative(direction: integer): {

local record StackWezTabInfo
	count: integer
	index: integer
end

local record StackWezOpts
	enrich_tab_title: boolean | nil
	spawn_direction: SpawnDirection
spawn_domain: "CurrentPaneDomain" | nil

local record StackWez
	action: StackWezAction
local M = {}

apply_to_config: function(_, user_config: StackWezOpts) end

tab_info: function(tab_id: integer): StackWezTabInfo|nil|? | nil

tab_title: function(tab_info: TabInformation): string

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
