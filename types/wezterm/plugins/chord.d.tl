local _tmp = require("_tmp")

local enum CommandSource
	"default"
	"key_table"
	"keys"
	"registered"
end

local record ModeActivateOptions
	one_shot:             boolean | nil
	replace_current:      boolean | nil
	timeout_milliseconds: integer | nil
	until_unknown:        boolean | nil
end

local record ConflictEntry
	action: _records.Action
	desc:   string | nil
	index:  integer
end

local record Conflict
	entries: {ConflictEntry}
	key:   string
	lhs:   string
	mods:  string | nil
	scope: string
end

local record ConflictOptions
	include_descriptions: boolean | nil
	include_key_tables:   boolean | nil
end

local record KeyEntry where self._tl_type == "KeyEntry"  --KeyEntry: Key
	_tl_type: string
	action: _records.Action       ---WezTerm action assigned to the key.
	desc: string | nil   ---Optional command-palette or hint-bar description.
end

local record VimMapping where self._tl_type == "VimMapping"
	_tl_type: string
	---Vim-style left-hand side, such as `<C-Space>`.
	---@field [1]? string
	---WezTerm action.
	---@field [2]? Action
	---Optional description.
	---@field [3]? string
	---WezTerm action.
	action: _records.Action | nil
	desc:   string | nil   ---Optional description.
	lhs:    string | nil    ---Vim-style left-hand side.
	rhs:    _records.Action | nil    ---WezTerm action.
end

local record OverrideSpec
	add:      Chord | {VimMapping} | nil                      ---Mappings to append.
	disable:  {string|KeyEntry|VimMapping} | nil  ---Mappings to remove.
	enabled:  boolean | nil                                   ---Disable a mapping group when set to `false`.
	override: {string: any} | nil                             ---Mappings to replace by Vim-style lhs.
end

local record _Enabled
	key_tables: boolean|nil
	keys:       boolean|nil
end
local record Overrides --Chord.Overrides
	enabled:    _Enabled | nil
	key_tables: {string:OverrideSpec} | nil
	keys:       Chord |OverrideSpec | nil
end

local record KeyMeta --Chord.KeyMeta
	bg:   string          ---Background color for the key table.
	i:    string          ---Short icon or label for the key table.
	name: string  | nil   ---Runtime key-table name.
	pad:  integer | nil   ---Optional display padding.
	txt:  string          ---Display text for the key table.
end

local record KeyTableDef --Chord.KeyTableDef
	keys: Chord |{VimMapping} | nil   ---Key definitions in Vim-style notation.
	meta: Chord |KeyMeta | nil        ---Key-table metadata used by hints and mode displays.
end

local record HintsConfig --Chord.HintsConfig
	page_cache_prefix: string | nil   ---Prefix for per-pane hint page cache keys.
	separator:         string | nil   ---Separator between hint entries.
end

local record CommandConfig --Chord.CommandConfig
	alphabet:             string  | nil    ---InputSelector shortcut alphabet.
	dedupe:               boolean | nil    ---Dedupe entries by binding identity.
	desc:                 string  | nil    ---Description for the injected command picker binding.
	description:          string  | nil    ---`InputSelector` description.
	fuzzy:                boolean | nil    ---Whether InputSelector fuzzy matching is enabled.
	fuzzy_description:    string  | nil    ---InputSelector fuzzy description.
	include_defaults:     boolean | nil    ---Include `wezterm.gui.default_keys()` entries.
	include_key_tables:   boolean | nil    ---Include `config.key_tables` entries.
	include_keys:         boolean | nil    ---Include top-level `config.keys` entries.
	include_registered:   boolean | nil    ---Include commands registered through `chord.command.register()`. See: [`chord.command.register()`](lua://Chord.CommandApi.register)
	include_undocumented: boolean | nil    ---Include entries without `desc` or `label`.
	key:                  string  | nil    ---Key binding that opens the command picker.
	title:                string  | nil    ---`InputSelector` title.
end

local record LogConfig --Chord.LogConfig
	enabled:   boolean | nil
	threshold: string | nil|integer
end

local record ChordConfig --ChordConfig
	aliases:   {string: string} | nil       ---Vim-style key aliases mapped to WezTerm key names.
	command:   Chord | CommandConfig | nil
	hints:     Chord | HintsConfig   | nil
	leader:    string                       ---Leader token used in Vim-style key notation.
	log:       Chord | LogConfig     | nil
	modifiers: {string: string}      | nil  ---Vim-style modifier aliases mapped to WezTerm modifiers.
end

local record Command --Chord.Command
	action:     _records.Action                ---WezTerm action executed when the command is selected.
	binding_id: string | nil          ---Normalized binding identity used for deduplication.
	id:         string                ---Stable command identifier.
	label:      string                ---User-facing command label.
	lhs:        string | nil          ---Vim-style key label, when the command is key-backed.
	source:    CommandSource   ---Source collection where the command came from.
	table_name: string | nil          ---Key table name for `key_table` commands.
end

local record CommandSpec --Chord.CommandSpec
	---Vim-style left-hand side.
	---@field [1]? string
	---WezTerm action.
	---@field [2]? Action
	---Optional command label.
	---@field [3]? string
	---WezTerm action.
	action: _records.Action | nil
	desc:  string  | nil   ---User-facing command label.
	id:    string  | nil   ---Stable command identifier.
	key:   string  | nil   ---Native WezTerm key name.
	label: string  | nil   ---User-facing command label.
	lhs:   string  | nil   ---Vim-style left-hand side.
	mods:  string  | nil   ---Native WezTerm modifier string.
	rhs:   _records.Action  | nil   ---WezTerm action.
end

local type _Def = KeyTableDef | function(theme: table): KeyTableDef

local record Mode --Chord.Mode
	__chord_mode: boolean
	def: _Def
	name: string

	activate: function(self: Mode, lhs: string|table, desc: string|nil, opts: ModeActivateOptions|nil): KeyEntry|nil
end

local record CommandApi --Chord.CommandApi

	---Return a WezTerm action that opens the command picker.
	action: function(config_table: _tmp.Config, opts: CommandConfig|nil): _records.Action

	---Inject a trigger binding that opens the command picker.
	---@param config_table  WezTerm config table.
	---@param opts?CommandConfig Command options merged over `Chord.CommandConfig`.
	apply: function(config_table: _tmp.Config, opts: CommandConfig|nil): _records.Action

	---Clear commands registered through `chord.command.register()`.
	---See:
	--- - [`chord.command.register()`](lua://Chord.CommandApi.register)
	clear: function(): nil

	---Collect commands from registered entries, config keys, key tables, and defaults.
	collect: function(config_table: _tmp.Config, opts: CommandConfig|nil): {Command}

	---Register an action-only command or a key-backed command.
	register: function(spec:CommandSpec):Command|nil

	---Register many commands.
	register_many: function(specs:{CommandSpec}): nil
end

local record Chord
	aliases: {string: string}
	command:CommandApi
	modifiers: {string: string}

	---Apply user overrides to already-built keys and key tables.
	apply_overrides: function(config_table: _tmp.Config, overrides: Overrides): nil

	---Return the active Chord configuration.
	config: function(): ChordConfig

	conflicts: function(config: _tmp.Config, opts: ConflictOptions|nil): {Conflict}

	---Return registered key-table metadata for mode displays.
	get_modes: function(theme: table): {string}

	---Render a plain-text key-hint bar for the active key table.
	hint: function(config: _tmp.Config, name: string|nil, width_cols: integer, window:_records.Window): string

	---Return an action callback that changes the visible hint page.
	hint_action: function(name: string, direction: integer): _records.Action

	record _Opts
		theme: table
		mode_bg: string
	end
	---Render a Ribbon key-hint bar for the active key table.
	---@param config_table Config WezTerm config table.
	---@param name? string Key-table name. `nil` uses top-level keys.
	---@param width_cols integer Available terminal columns.
	hint_layout: function(config_table: _tmp.Config, name: string|nil, width_cols: integer,  window:_records.Window, opts: _Opts): _tmp.Ribbon

	---Create a WezTerm key entry from either native syntax or Vim-style syntax.
	key: function(lhs_or_spec: string|VimMapping|KeyEntry, action: _records.Action|nil, desc: string|nil): KeyEntry|nil

	---Append a single key mapping to a target table.
	map: function(lhs_or_spec: string|VimMapping|KeyEntry, action: _records.Action, target: table): nil

	---Append a batch of key mappings to a target table.
	map_batch: function(mappings: {VimMapping|KeyEntry}, target: table): nil

	---Append mappings to `config.keys`.
	maps: function(config_table: _tmp.Config, mappings: (VimMapping|KeyEntry)): nil

	mode: function(name: string, def: _Def):Mode

	---Normalize a Vim-style key expression to a WezTerm key entry fragment.
	normalize: function(lhs: string): table|nil

	---Configure
	setup: function(opts: ChordConfig|nil): Chord

	---Convert Vim-style mappings to a WezTerm key table.
	table: function(mappings: {VimMapping|KeyEntry}): {KeyEntry}

	---Register modal key tables and write them into `config.key_tables`.
	tables: function(config_table: _tmp.Config, defs: {string:KeyTableDef|function(theme: table):KeyTableDef}): nil

	---Validate a Vim-style key expression.
	validate: function(lhs: string): {boolean, string|nil}
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
