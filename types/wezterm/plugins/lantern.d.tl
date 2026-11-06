local _tmp = require("_tmp")

local enum ResetBehavior
	"clear"
	"persist"
end

local type GlowResult = {Choice}|Choice|string|number --Lantern.GlowResult

local record Choice --Lantern.Choice
	id: string
	label: string | nil
end

local record BuildContext --Lantern.BuildContext
	pane: _tmp.Pane
	window:_records.Window
end

local record Context --Lantern.Context
	choice: Choice
	pane: _tmp.Pane | nil
	wick: Lantern |Wick | nil
	window:_records.Window | nil
end

local record Flame --Lantern.Flame
	glow:   nil | function(ctx: BuildContext|nil): GlowResult   ---Return one choice, multiple choices, or a scalar value that Lantern can normalize.
	ignite: nil | function(config: _tmp.Config, ctx: Context)   ---Apply a selected choice to the provided config table.
	get:    nil | function(ctx?: BuildContext): GlowResult      ---Legacy alias for `glow`.
	pick:   nil | function(config: _tmp.Config, ctx: Context)   ---Legacy alias for `ignite`.
end

local record GpuFlame --Lantern.GpuFlame: Flame
	---Choose the best detected GPU adapter, if any.
	best: function(): _shared.GpuInfo | nil
end

local record InternalChoice --Lantern.InternalChoice
	flame: Flame
	module_path: string | nil
	choice: Choice
end

local type FormatChoices = function(choices: {string: InternalChoice}, ctx: BuildContext): {Choice}

local type FormatDescription = function(desc: string, fuzzy: boolean, icons: Icons): string

local record IconPair
	ico:   string
	punct: string
end

local record Icons
	lantern: string
	fuzzy:   IconPair
	exact:   IconPair
end

local record LogConfig
	enabled: boolean
end

local record LogOpts
	enabled: boolean | nil
end

local record PersistenceConfig
	enabled: boolean
	path: string | nil
	legacy_path: string | nil
	reset_behavior: ResetBehavior
end

local record PersistenceOpts
	enabled: boolean | nil
	path: string | nil
	legacy_path: string | nil
	reset_behavior: Lantern |ResetBehavior | nil
end

local record ColorConfig
	opacity: number
end

local record ColorOpts --Lantern.ColorOpts
	opacity: number | nil
end

local record DefaultFontConfig --Lantern.DefaultFontConfig
	font: _shared.TextStyle | nil
	font_rules: {_shared.FontRules} | nil
	font_size: number | nil
	line_height: number | nil
end

local record DefaultConfig --Lantern.DefaultConfig
	title: string
	sort_by: string
	fuzzy: boolean
	description: string
	fuzzy_description: string
	alphabet: string
	icons: Icons
	format_choices: FormatChoices
	format_description: FormatDescription

	-- DC.
	comp: function(sort_by: string): function(a: Choice, b: Choice): boolean
end

local record DefaultOpts --Lantern.DefaultOpts
	title: string | nil
	sort_by: string | nil
	fuzzy: boolean | nil
	description: string | nil
	fuzzy_description: string | nil
	alphabet: string | nil
	icons: Lantern |Icons | nil
	comp: nil | function(sort_by: string): function(a: Choice, b: Choice): boolean
	format_choices: Lantern |FormatChoices | nil
	format_description: Lantern |FormatDescription | nil
end

local record Config --Lantern.Config
	log: LogConfig
	persistence: PersistenceConfig
	defaults: DefaultConfig
	default_font: DefaultFontConfig
	color: ColorConfig
end

local record SetupOpts --Lantern.SetupOpts
	log: Lantern |LogOpts | nil
	persistence: Lantern |PersistenceOpts | nil
	defaults: Lantern |DefaultOpts | nil
	default_font: Lantern |DefaultFontConfig | nil
	color: Lantern |ColorOpts | nil
end

local record WickSpec where type(self.register) == nil
	register: nil
	name: string | nil
	title: string | nil
	flames: {string|Flame} | nil
	flame_dirs: {{string}|string} | nil
	sort_by: string | nil
	fuzzy: boolean | nil
	alphabet: string | nil
	description: string | nil
	fuzzy_description: string | nil
	persist: boolean | nil
	comp: nil | function(a: Choice, b: Choice): boolean
	format_choices: Lantern |FormatChoices | nil
	format_description: Lantern |FormatDescription | nil
end

local record Wick where type(self.register) ~= nil
	title: string
	sort_by: string
	fuzzy: boolean
	alphabet: string
	description: string
	fuzzy_description: string
	persist: boolean

	---Register an inline flame or flame module path on this wick.
	register: function(self: Wick, flame_spec: string|Flame): nil

	---Apply one selected choice to a config override table.
	select: function(self: Wick, config: _tmp.Config, ctx: Context): nil

	---Return a WezTerm action that opens this wick.
	light: function(self: Wick): _records.Action
end

local record LightApi --Lantern.LightApi

	---Open any registered wick.
	__call:         function(self: LightApi, name: string): _records.Action

	---Open the built-in colorscheme wick.
	colorscheme:    function(): _records.Action

	---Open the built-in font wick.
	font:           function(): _records.Action

	---Open the built-in font-size wick.
	font_size:      function(): _records.Action

	---Open the built-in line-height wick.
	font_leading:   function(): _records.Action

	---Open the built-in GPU adapter wick.
	gpu:            function(): _records.Action

	---Open the built-in window-opacity wick.
	window_opacity: function(): _records.Action

	---Open the built-in window-padding wick.
	window_padding: function(): _records.Action

	---Open the built-in cursor-style wick.
	cursor_style:   function(): _records.Action

	---Open the built-in inactive-pane-opacity wick.
	inactive_pane_opacity: function(): _records.Action

	---Open the built-in font-ligatures wick.
	font_ligatures: function(): _records.Action

	---Open the built-in tab-bar-style wick.
	tab_bar_style:  function(): _records.Action
end

local record FlamesApi --Lantern.FlamesApi

	---Return cached flame module paths from one directory.
	---Pass a string for an absolute/custom directory, or path segments for a
	-- F.
	---built-in Lantern flame directory under `plugin/lantern/flames`.
	from_dir: function(dir: {string}|string): {string}

	---Return cached flame module paths from multiple directories.
	from_dirs: function(dirs: {string}|string): {string}
end

local record ColorApi --Lantern.ColorApi

	---Set tab button style in a config table from a Lantern colorscheme.
	set_tab_button: function(config: _tmp.Config, scheme:_enums.Palette): nil

	---Apply a colorscheme to a WezTerm config override table.
	apply_scheme: function(config: _tmp.Config, scheme:_enums.Palette, name: string): nil

	---Return a built-in Lantern colorscheme table by name.
	scheme: function(name: string):_enums.Palette|nil
end

local record StateEntry --Lantern.StateEntry
	id:     string
	label:  string | nil
	module: string | nil
	wick:   string | nil
end

local record StateApi --Lantern.StateApi

	---Persist current state to disk.
	flush: function(): nil

	---Save one wick selection.
	save: function(wick_name: string, entry: StateEntry): nil

	---Return one saved wick selection.
	get: function(wick_name: string): StateEntry|nil

	---Clear all saved state, or one wick when `wick_name` is passed.
	clear: function(wick_name: string|nil): nil

	---Return all saved Lantern state.
	all: function(): {string}

	---Return the active state file path.
	path: function(): string

	---Return the legacy picker state file path used for migration.
	legacy_path: function(): string
end

local record ConfigApi --Lantern.ConfigApi

	---Merge user configuration into Lantern defaults.
	setup: function(opts: SetupOpts|nil): Config

	---Return the active Lantern configuration.
	get: function(): Config

	---Return a copy of the default Lantern configuration.
	defaults: function(): Config
end

local record Lantern
	light:    LightApi    ---Built-in and custom wick action helpers.

	flames:   FlamesApi   ---Helpers for discovering flame modules.

	config:   ConfigApi   ---Configuration helpers.

	color:    ColorApi    ---Colorscheme helpers.

	state:    StateApi    ---Persistence helpers.

	setup:    function(opts: SetupOpts|nil): Config               ---Configure

	add_wick: function(name: string, spec: WickSpec|Wick): Wick   ---Register a user-defined wick.

	wick:     function(name: string): Wick|nil                    ---Return a registered wick by name.

	rekindle: function(config: _tmp.Config): _tmp.Config          ---Restore persisted Lantern selections into a config table.

	gpu:      function(): GpuFlame                                ---Return the built-in GPU flame module.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
