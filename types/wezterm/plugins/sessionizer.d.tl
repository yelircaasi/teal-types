local _tmp = require("_tmp")

local type Schema = SchemaScope | {string|Entry}

local record SchemaScope is {Schema}
	options:    SchemaOptions
	processing: {function(schema: {Entry}): {Entry}}
end

local record SchemaOptions
	always_fuzzy: boolean | nil
	callback:     nil     | function(window:_records.Window, pane: _tmp.Pane, id: string, label: string): nil --?
	prompt:       string  | nil
	title:        string  | nil
end

local record Entry
	id: string
	label: string
end

local record DefaultWorkspaceOpts --Sessionizer.DefaultWorkspaceOpts
	id_overwrite:    string | nil
	label_overwrite: string | nil
end

local record AllActiveWorkspacesOpts --Sessionizer.AllActiveWorkspacesOpts
	filter_current: boolean | nil
	filter_default: boolean | nil
end

local record FdSearchOpts is {string} where type(self[0]) == "string" --Sessionizer.FdSearchOpts
	---@field [1] string
	
	exclude:            {string} | nil
	extra_args:         {string} | nil
	fd_path:            string   | nil
	format:             string   | nil
	include_submodules: boolean  | nil
	max_depth:          integer  | nil
end

local type _EntryCallback =   function(entry: Entry): any
local type _EntriesCallback = function(entries: {Entry}): any
local type _EntriesMaker =    function(): {Entry}

local record Sessionizer
	AllActiveWorkspaces: function(opts: AllActiveWorkspacesOpts): _EntriesMaker
	DefaultCallback: function(id: string, window:_records.Window, pane: _tmp.Pane, id: string, label: string): nil
	DefaultWorkspace: function(opts: DefaultWorkspaceOpts): _EntriesMaker
	FdSearch:         function(opts: string|FdSearchOpts): _EntriesMaker
	apply_to_config:  function(config: _tmp.Config): nil
	for_each_entry:   function(f: function(entry: Entry): any): _EntriesCallback
	show:             function(schema: Schema): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
