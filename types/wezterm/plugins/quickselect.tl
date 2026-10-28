---@diagnostic disable:unused-local

local record Quick_SelectOpts.Action
	filter: string
local A = {}

---@param window Window The `Window` object.
---@param pane Pane The `Pane` object.
function A.action(selection: string, pane, selection, opts: Quick_SelectOpts) end

local record Quick_SelectOpts
	actions: Quick_SelectOpts | nil.Action[]
	direction: PaneDirection | nil
	key: string | nil
	mods: string | nil
	patterns: string | nil[]
	text_extensions: table | nil<string, boolean>
end

local record Quick_Select.Filters
local F = {}

function F.match(str: string): fun(selection:

function F.startswith(str: string): fun(selection:

local record Quick_Select
	filters: Quick_Select.Filters
local M = {}

---@param config Config
---@param opts? Quick_SelectOpts
function M.apply_to_config(config, opts) end

---@param window Window The `Window` object.
---@param pane Pane The `Pane` object.
function M.open_with_hx(url: string, pane, url, opts: Quick_SelectOpts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
