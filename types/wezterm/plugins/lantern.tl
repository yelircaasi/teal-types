---@diagnostic disable:unused-local

local type Lantern.ResetBehavior =
	"clear"|"persist"
local type Lantern.GlowResult Lantern.Choice[]|Lantern.Choice|string|number

local record Lantern.Choice
	id: string
	label: string | nil
end

local record Lantern.BuildContext
	pane: Pane
	window: Window

local record Lantern.Context
	choice: Lantern.Choice
	pane: Pane | nil
	wick: Lantern | nil.Wick
	window: Window | nil
end

local record Lantern.Flame
	---Return one choice, multiple choices, or a scalar value that Lantern can normalize.
	glow: fun | nil(ctx?: Lantern.BuildContext): Lantern.GlowResult
	---Apply a selected choice to the provided config table.
	ignite: fun | nil(config: Config, ctx: Lantern.Context)
	---Legacy alias for `glow`.
	get: fun | nil(ctx?: Lantern.BuildContext): Lantern.GlowResult
	---Legacy alias for `ignite`.
	pick: fun | nil(config: Config, ctx: Lantern.Context)
end

local record Lantern.GpuFlame: Lantern.Flame
local G = {}

---Choose the best detected GPU adapter, if any.
function G.best(): GpuInfo|nil|?

local record Lantern.InternalChoice
	flame: Lantern.Flame
	module_path: string | nil
	choice: Lantern.Choice

local type Lantern.FormatChoices fun(choices: table<string, Lantern.InternalChoice>, ctx: Lantern.BuildContext): Lantern.Choice[]

local type Lantern.FormatDescription fun(desc: string, fuzzy: boolean, icons: Lantern.Icons): string

local record Lantern.IconPair
	ico: string
	punct: string
end

local record Lantern.Icons
	lantern: string
	fuzzy: Lantern.IconPair
	exact: Lantern.IconPair

local record Lantern.LogConfig
	enabled: boolean
end

local record Lantern.LogOpts
	enabled: boolean | nil
end

local record Lantern.PersistenceConfig
	enabled: boolean
	path: string | nil
	legacy_path: string | nil
	reset_behavior: Lantern.ResetBehavior

local record Lantern.PersistenceOpts
	enabled: boolean | nil
	path: string | nil
	legacy_path: string | nil
	reset_behavior: Lantern | nil.ResetBehavior
end

local record Lantern.ColorConfig
	opacity: number
end

local record Lantern.ColorOpts
	opacity: number | nil
end

local record Lantern.DefaultFontConfig
	font: TextStyle | nil
	font_rules: FontRules | nil[]
	font_size: number | nil
	line_height: number | nil
end

local record Lantern.DefaultConfig
	title: string
	sort_by: string
	fuzzy: boolean
	description: string
	fuzzy_description: string
	alphabet: string
	icons: Lantern.Icons
	format_choices: Lantern.FormatChoices
	format_description: Lantern.FormatDescription
local DC = {}

function DC.comp(sort_by: string): fun(a:

local record Lantern.DefaultOpts
	title: string | nil
	sort_by: string | nil
	fuzzy: boolean | nil
	description: string | nil
	fuzzy_description: string | nil
	alphabet: string | nil
	icons: Lantern | nil.Icons
	comp: fun | nil(sort_by: string): fun(a: Lantern.Choice, b: Lantern.Choice): boolean
	format_choices: Lantern | nil.FormatChoices
	format_description: Lantern | nil.FormatDescription
end

local record Lantern.Config
	log: Lantern.LogConfig
	persistence: Lantern.PersistenceConfig
	defaults: Lantern.DefaultConfig
	default_font: Lantern.DefaultFontConfig
	color: Lantern.ColorConfig

local record Lantern.SetupOpts
	log: Lantern | nil.LogOpts
	persistence: Lantern | nil.PersistenceOpts
	defaults: Lantern | nil.DefaultOpts
	default_font: Lantern | nil.DefaultFontConfig
	color: Lantern | nil.ColorOpts
end

local record Lantern.WickSpec
	name: string | nil
	title: string | nil
	---@field flames? (string|Lantern.Flame)[]
	---@field flame_dirs? (string[]|string)[]
	sort_by: string | nil
	fuzzy: boolean | nil
	alphabet: string | nil
	description: string | nil
	fuzzy_description: string | nil
	persist: boolean | nil
	comp: fun | nil(a: Lantern.Choice, b: Lantern.Choice): boolean
	format_choices: Lantern | nil.FormatChoices
	format_description: Lantern | nil.FormatDescription
end

local record Lantern.Wick
	title: string
	sort_by: string
	fuzzy: boolean
	alphabet: string
	description: string
	fuzzy_description: string
	persist: boolean
local W = {}

---Register an inline flame or flame module path on this wick.
function W:register(flame_spec: string|Lantern.Flame): nil

---Apply one selected choice to a config override table.
function W:select(config: Config, ctx: Lantern.Context): nil

---Return a WezTerm action that opens this wick.
function W:light(): Action

local record Lantern.LightApi
---@operator call(string): Action
local L = {}

---Open any registered wick.
function L:__call(name: string): Action

---Open the built-in colorscheme wick.
function L.colorscheme(): Action

---Open the built-in font wick.
function L.font(): Action

---Open the built-in font-size wick.
function L.font_size(): Action

---Open the built-in line-height wick.
function L.font_leading(): Action

---Open the built-in GPU adapter wick.
function L.gpu(): Action

---Open the built-in window-opacity wick.
function L.window_opacity(): Action

---Open the built-in window-padding wick.
function L.window_padding(): Action

---Open the built-in cursor-style wick.
function L.cursor_style(): Action

---Open the built-in inactive-pane-opacity wick.
function L.inactive_pane_opacity(): Action

---Open the built-in font-ligatures wick.
function L.font_ligatures(): Action

---Open the built-in tab-bar-style wick.
function L.tab_bar_style(): Action

local record Lantern.FlamesApi
local F = {}

---Return cached flame module paths from one directory.
---Pass a string for an absolute/custom directory, or path segments for a
---built-in Lantern flame directory under `plugin/lantern/flames`.
function F.from_dir(dir: string[]|string): string[]

---Return cached flame module paths from multiple directories.
function F.from_dirs(dirs: (string[]|string)[]): string[]

local record Lantern.ColorApi
local C = {}

---Set tab button style in a config table from a Lantern colorscheme.
function C.set_tab_button(config: Config, scheme: Palette): nil

---Apply a colorscheme to a WezTerm config override table.
---@param config Config
function C.apply_scheme(scheme: Palette, scheme, name: string) end

---Return a built-in Lantern colorscheme table by name.
function C.scheme(name: string): Palette|nil|? | nil

local record Lantern.StateEntry
	id: string
	label: string | nil
	module: string | nil
	wick: string | nil
end

local record Lantern.StateApi
local S = {}

---Persist current state to disk.
function S.flush() end

---Save one wick selection.
function S.save(wick_name: string, entry: Lantern.StateEntry): nil

---Return one saved wick selection.
function S.get(wick_name: string): Lantern.StateEntry|nil|? | nil

---Clear all saved state, or one wick when `wick_name` is passed.
---@param wick_name? string
function S.clear(wick_name) end

---Return all saved Lantern state.
function S.all(): table<string,

---Return the active state file path.
function S.path(): string

---Return the legacy picker state file path used for migration.
function S.legacy_path(): string

local record Lantern.ConfigApi
local Cfg = {}

---Merge user configuration into Lantern defaults.
---@param opts? Lantern.SetupOpts
function Cfg.setup(opts): Lantern.Config

---Return the active Lantern configuration.
function Cfg.get(): Lantern.Config

---Return a copy of the default Lantern configuration.
function Cfg.defaults(): Lantern.Config

local record Lantern
	---Built-in and custom wick action helpers.
	light: Lantern.LightApi
	---Helpers for discovering flame modules.
	flames: Lantern.FlamesApi
	---Configuration helpers.
	config: Lantern.ConfigApi
	---Colorscheme helpers.
	color: Lantern.ColorApi
	---Persistence helpers.
	state: Lantern.StateApi
local M = {}

---Configure Lantern.
---@param opts? Lantern.SetupOpts
function M.setup(opts): Lantern.Config

---Register a user-defined wick.
function M.add_wick(name: string, spec: Lantern.WickSpec|Lantern.Wick): Lantern.Wick

---Return a registered wick by name.
function M.wick(name: string): Lantern.Wick|nil|? | nil

---Restore persisted Lantern selections into a config table.
---@param config? Config
function M.rekindle(config): Config

---Return the built-in GPU flame module.
function M.gpu(): Lantern.GpuFlame

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
