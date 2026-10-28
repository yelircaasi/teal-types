---@diagnostic disable:unused-local

local type SpawnDirection =
	"Bottom"|"Left"|"Right"|"Top"

local record StackWezAction
---@field SpawnPane { EmitEvent: string }
local Action = {}

function Action.ActivatePaneRelative(direction: integer): {

local record StackWezTabInfo
	count: integer
	index: integer
end

local record StackWezOpts
	enrich_tab_title: boolean | nil
	spawn_direction: SpawnDirection
---@field spawn_domain? "CurrentPaneDomain"

local record StackWez
	action: StackWezAction
local M = {}

function M.apply_to_config(_, user_config: StackWezOpts) end

function M.tab_info(tab_id: integer): StackWezTabInfo|nil|? | nil

function M.tab_title(tab_info: TabInformation): string

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
