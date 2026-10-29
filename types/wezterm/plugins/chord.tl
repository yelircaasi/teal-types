---@diagnostic disable:unused-local

local type Chord.CommandSource =
	"default"|"key_table"|"keys"|"registered"

local record Chord.ModeActivateOptions
	one_shot: boolean | nil
	replace_current: boolean | nil
	timeout_milliseconds: integer | nil
	until_unknown: boolean | nil
end

local record Chord.ConflictEntry
	action: Action
	desc: string | nil
	index: integer
end

local record Chord.Conflict
	entries: Chord.{ConflictEntry}
	key: string
	lhs: string
	mods: string | nil
	scope: string
end

local record Chord.ConflictOptions
	include_descriptions: boolean | nil
	include_key_tables: boolean | nil
end

local record Chord.KeyEntry: Key
	---WezTerm action assigned to the key.
	action: Action
	---Optional command-palette or hint-bar description.
	desc: string | nil
end

local record Chord.VimMapping
	---Vim-style left-hand side, such as `<C-Space>`.
	---@field [1]? string
	---WezTerm action.
	---@field [2]? Action
	---Optional description.
	---@field [3]? string
	---WezTerm action.
	action: Action | nil
	---Optional description.
	desc: string | nil
	---Vim-style left-hand side.
	lhs: string | nil
	---WezTerm action.
	rhs: Action | nil
end

local record Chord.OverrideSpec
	---Mappings to append.
	add: Chord |{VimMapping} | nil
	---Mappings to remove.
	disable: (string|Chord.KeyEntry|Chord.VimMapping)[] | nil
	---Disable a mapping group when set to `false`.
	enabled: boolean | nil
	---Mappings to replace by Vim-style lhs.
	override: table | nil<string, any>
end

local record Chord.Overrides
	enabled: { key_tables?: boolean, keys?: boolean } | nil
	key_tables: table | nil<string, Chord.OverrideSpec>
	keys: Chord |OverrideSpec | nil
end

local record Chord.KeyMeta
	---Background color for the key table.
	bg: string
	---Short icon or label for the key table.
	i: string
	---Runtime key-table name.
	name: string | nil
	---Optional display padding.
	pad: integer | nil
	---Display text for the key table.
	txt: string
end

local record Chord.KeyTableDef
	---Key definitions in Vim-style notation.
	keys: Chord |{VimMapping} | nil
	---Key-table metadata used by hints and mode displays.
	meta: Chord |KeyMeta | nil
end

local record Chord.HintsConfig
	---Prefix for per-pane hint page cache keys.
	page_cache_prefix: string | nil
	---Separator between hint entries.
	separator: string | nil
end

local record Chord.CommandConfig
	---InputSelector shortcut alphabet.
	alphabet: string | nil
	---Dedupe entries by binding identity.
	dedupe: boolean | nil
	---Description for the injected command picker binding.
	desc: string | nil
	---`InputSelector` description.
	description: string | nil
	---Whether InputSelector fuzzy matching is enabled.
	fuzzy: boolean | nil
	---InputSelector fuzzy description.
	fuzzy_description: string | nil
	---Include `wezterm.gui.default_keys()` entries.
	include_defaults: boolean | nil
	---Include `config.key_tables` entries.
	include_key_tables: boolean | nil
	---Include top-level `config.keys` entries.
	include_keys: boolean | nil
	---Include commands registered through `chord.command.register()`.
	---See:
	--- - [`chord.command.register()`](lua://Chord.CommandApi.register)
	include_registered: boolean | nil
	---Include entries without `desc` or `label`.
	include_undocumented: boolean | nil
	---Key binding that opens the command picker.
	key: string | nil
	---`InputSelector` title.
	title: string | nil
end

local record Chord.LogConfig
	enabled: boolean | nil
	threshold: string | nil|integer
end

local record Chord.Config
	---Vim-style key aliases mapped to WezTerm key names.
	aliases: table | nil<string, string>
	command: Chord |CommandConfig | nil
	hints: Chord |HintsConfig | nil
	---Leader token used in Vim-style key notation.
	leader: string
	log: Chord |LogConfig | nil
	---Vim-style modifier aliases mapped to WezTerm modifiers.
	modifiers: table | nil<string, string>
end

local record Chord.Command
	---WezTerm action executed when the command is selected.
	action: Action
	---Normalized binding identity used for deduplication.
	binding_id: string | nil
	---Stable command identifier.
	id: string
	---User-facing command label.
	label: string
	---Vim-style key label, when the command is key-backed.
	lhs: string | nil
	---Source collection where the command came from.
	source: Chord.CommandSource
	---Key table name for `key_table` commands.
	table_name: string | nil
end

local record Chord.CommandSpec
	---Vim-style left-hand side.
	---@field [1]? string
	---WezTerm action.
	---@field [2]? Action
	---Optional command label.
	---@field [3]? string
	---WezTerm action.
	action: Action | nil
	---User-facing command label.
	desc: string | nil
	---Stable command identifier.
	id: string | nil
	---Native WezTerm key name.
	key: string | nil
	---User-facing command label.
	label: string | nil
	---Vim-style left-hand side.
	lhs: string | nil
	---Native WezTerm modifier string.
	mods: string | nil
	---WezTerm action.
	rhs: Action | nil
end

local record Chord.Mode
	__chord_mode: boolean
	def: Chord.KeyTableDef|fun(theme: table): def: Chord.KeyTableDef
	name: string
local Mode = {}

---@param lhs string|table
---@param desc? string
---@param opts? Chord.ModeActivateOptions
function Mode:activate(lhs, desc, opts): Chord.KeyEntry|nil|? | nil

local record Chord.CommandApi
local C = {}

---Return a WezTerm action that opens the command picker.
---@param config_table Config WezTerm config table.
---@param opts? Chord.CommandConfig Command options merged over `Chord.CommandConfig`.
function C.action(config_table, opts): Action

---Inject a trigger binding that opens the command picker.
---@param config_table Config WezTerm config table.
---@param opts? Chord.CommandConfig Command options merged over `Chord.CommandConfig`.
function C.apply(config_table, opts): Action

---Clear commands registered through `chord.command.register()`.
---See:
--- - [`chord.command.register()`](lua://Chord.CommandApi.register)
function C.clear(): nil

---Collect commands from registered entries, config keys, key tables, and defaults.
---@param config_table Config WezTerm config table.
---@param opts? Chord.CommandConfig Command options merged over `Chord.CommandConfig`.
function C.collect(config_table, opts): Chord.{Command}

---Register an action-only command or a key-backed command.
function C.register(spec: Chord.CommandSpec): Chord.Command|nil|? | nil

---Register many commands.
function C.register_many(specs: Chord.{CommandSpec}): nil

local record Chord
	aliases: {string: string}
	command: Chord.CommandApi
	modifiers: {string: string}
local M = {}

---Apply user overrides to already-built keys and key tables.
apply_overrides: function(config_table: Config WezTerm config table., overrides: Chord.Overrides): nil

---Return the active Chord configuration.
config: function(): Chord.Config

---@param config Config
---@param opts? Chord.ConflictOptions
conflicts: function(config, opts): Chord.{Conflict}

---Return registered key-table metadata for mode displays.
get_modes: function(theme: table Theme or color table passed to key-table definition functions.): table<string,

---Render a plain-text key-hint bar for the active key table.
---@param config_table Config WezTerm config table.
---@param name? string Key-table name. `nil` uses top-level keys.
hint: function(width_cols: integer Available terminal columns., name, width_cols, window: Window WezTerm window.): string

---Return an action callback that changes the visible hint page.
---@param name? string Key-table name.
hint_action: function(name, direction: integer Page delta.): Action

---Render a Ribbon key-hint bar for the active key table.
---@param config_table Config WezTerm config table.
---@param name? string Key-table name. `nil` uses top-level keys.
---@param width_cols integer Available terminal columns.
hint_layout: function(window: Window WezTerm window., name, width_cols, window, opts: { theme: table, mode_bg: string }): Ribbon

---Create a WezTerm key entry from either native syntax or Vim-style syntax.
---@param lhs_or_spec string|Chord.VimMapping|Chord.KeyEntry
---@param action? Action WezTerm action when `lhs_or_spec` is a string.
---@param desc? string Optional description.
key: function(lhs_or_spec, action, desc): Chord.KeyEntry|nil|? | nil

---Append a single key mapping to a target table.
---@param lhs_or_spec string|Chord.VimMapping|Chord.KeyEntry
map: function(action: Action WezTerm action., action, target: table Target list to mutate.) end

---Append a batch of key mappings to a target table.
map_batch: function(mappings: (Chord.VimMapping|Chord.KeyEntry)[], target: table Target list to mutate.): nil

---Append mappings to `config.keys`.
maps: function(config_table: Config WezTerm config table., mappings: (Chord.VimMapping|Chord.KeyEntry)[]): nil

mode: function(name: string, def: Chord.KeyTableDef|fun(theme: table): def: Chord.KeyTableDef): Chord.Mode

---Normalize a Vim-style key expression to a WezTerm key entry fragment.
---@param lhs string Vim-style key expression.
---@return table|nil|? entry
normalize: function(lhs): string|nil|? | nil

---Configure Chord.
---@param opts? Chord.Config Partial Chord configuration.
setup: function(opts): Chord

---Convert Vim-style mappings to a WezTerm key table.
table: function(mappings: (Chord.VimMapping|Chord.KeyEntry)[]): Chord.{KeyEntry}

---Register modal key tables and write them into `config.key_tables`.
tables: function(config_table: Config WezTerm config table., defs: {string: Chord.KeyTableDef|fun(theme: table): Chord.KeyTableDef}): nil

---Validate a Vim-style key expression.
---@param lhs string Vim-style key expression.
---@return boolean valid
validate: function(lhs): string|nil|? | nil

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
