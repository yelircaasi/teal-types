---@diagnostic disable:unused-local

local type Schema SchemaScope|(string|Entry)[]

local record SchemaScope
	---@field [integer] Schema
	options: SchemaOptions
processing: (fun(schema: {Entry}): entries: {Entry})[]

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
	exclude: string | {nil}
	extra_args: string | {nil}
	fd_path: string | nil
	format: string | nil
	include_submodules: boolean | nil
	max_depth: integer | nil
end

local record Sessionizer
local M = {}

AllActiveWorkspaces: function(opts: Sessionizer.AllActiveWorkspacesOpts): (fun():

---@param window Window The `Window` object.
---@param pane Pane The `Pane` object.
DefaultCallback: function(id: string, pane, id, label: string) end

DefaultWorkspace: function(opts: Sessionizer.DefaultWorkspaceOpts): (fun():

FdSearch: function(opts: string|Sessionizer.FdSearchOpts): (fun():

apply_to_config: function(config: Config) end

for_each_entry: function(f: fun(entry: Entry)): fun(entries:

show: function(schema: Schema) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
