---@diagnostic disable:unused-local

local type Schema SchemaScope|(string|Entry)[]

local record SchemaScope
	---@field [integer] Schema
	options: SchemaOptions
---@field processing (fun(schema: Entry[]): entries: Entry[])[]

local record SchemaOptions
	always_fuzzy: boolean | nil
	callback: fun | nil(window: Window, pane: Pane, id: string, label: string)
	prompt: string | nil
	title: string | nil
end

local record Entry
	id: string
	label: string
end

local record Sessionizer.DefaultWorkspaceOpts
	id_overwrite: string | nil
	label_overwrite: string | nil
end

local record Sessionizer.AllActiveWorkspacesOpts
	filter_current: boolean | nil
	filter_default: boolean | nil
end

local record Sessionizer.FdSearchOpts
	---@field [1] string
	exclude: string | nil[]
	extra_args: string | nil[]
	fd_path: string | nil
	format: string | nil
	include_submodules: boolean | nil
	max_depth: integer | nil
end

local record Sessionizer
local M = {}

function M.AllActiveWorkspaces(opts: Sessionizer.AllActiveWorkspacesOpts): (fun():

---@param window Window The `Window` object.
---@param pane Pane The `Pane` object.
function M.DefaultCallback(id: string, pane, id, label: string) end

function M.DefaultWorkspace(opts: Sessionizer.DefaultWorkspaceOpts): (fun():

function M.FdSearch(opts: string|Sessionizer.FdSearchOpts): (fun():

function M.apply_to_config(config: Config) end

function M.for_each_entry(f: fun(entry: Entry)): fun(entries:

function M.show(schema: Schema) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
