local _tmp = require("_tmp")

local enum PaletteName
	"dragon"
	"lotus"
	"wave"
end

---Role-based overrides for `kanagawa.apply_by_appearance()`.
---See:
--- - [`kanagawa.apply_by_appearance()`](lua://Kanagawa.apply_by_appearance)
local record AppearanceOverrides
	dark:_tmp.Palette | nil          ---Overrides applied when the dark role is selected.
	fallback:_tmp.Palette | nil      ---Overrides applied when the fallback role is selected.
	light:_tmp.Palette | nil         ---Overrides applied when the light role is selected.
end

---Options for `kanagawa.apply_by_appearance()`.
---See:
--- - [`kanagawa.apply_by_appearance()`](lua://Kanagawa.apply_by_appearance)
local record AppearanceApplyOpts --kanagawa.AppearanceApplyOpts
	appearance: string | nil      ---Explicit appearance string for testing or manual selection.
	dark:       string | nil      ---Scheme name used for dark appearances. Defaults to `"wave"`.
	fallback:   string | nil      ---Scheme name used when appearance is unknown. Defaults to `"wave"`.
	light:      string | nil      ---Scheme name used for light appearances. Defaults to `"lotus"`.
	overrides:  AppearanceOverrides | nil  ---Role-based overrides.
end

---Options for `kanagawa.register()`.
---See:
--- - [`kanagawa.register()`](lua://Kanagawa.register)
local record RegisterOpts --kanagawa.RegisterOpts
	overrides:_tmp.Palette | nil   ---Partial overrides deep-merged into every scheme.
	scheme_overrides: {string:_tmp.Palette} | nil   ---Per-scheme overrides keyed by scheme name.
end

---Options for `apply_to_config`.
local record KanagawaOpts
	overrides:_tmp.Palette | nil              ---Partial overrides deep-merged into the scheme.
	scheme: Kanagawa |PaletteName | nil   ---Scheme name. Defaults to `"wave"`.
end

local enum _Name
	"wave"
	"lotus"
	"dragon"
end

local record Kanagawa
	dragon:_tmp.Palette ---Base Dragon preset (shared reference).
	lotus:_tmp.Palette  ---Base Lotus preset (shared reference).
	wave:_tmp.Palette   ---Base Wave preset (shared reference).

	apply_by_appearance: function(config: _tmp.Config, opts: AppearanceApplyOpts|nil): nil

	---Resolve a scheme (with optional overrides), register it in `config.color_schemes`
	---under its display name, and set `config.color_scheme` to that name.
	---This follows WezTerm's own precedence model: `color_scheme` wins over `colors`,
	---so the user can still layer extra per-key tweaks through `config.colors` and
	---they will act as overrides on top of the scheme.
	apply_to_config: function(config: _tmp.Config, opts: KanagawaOpts|nil): nil

	---Return a **new** scheme table, optionally deep-merged with user overrides.
	---The base preset is never mutated.
	---@param name Kanagawa.PaletteName Scheme name: `"wave"`, `"lotus"`, or `"dragon"`.
	---@param overrides?_tmp.Palette Partial table, deep-merged into the cloned scheme.
	get: function(name: _Name, overrides: _tmp.Palette|nil): _tmp.Palette

	---Register all Kanagawa schemes in `config.color_schemes` without activating
	---one through `config.color_scheme`.
	---`opts.overrides` applies to every registered scheme. `opts.scheme_overrides`
	---can apply additional per-scheme overrides keyed by `wave`, `dragon`, or `lotus`;
	---per-scheme overrides win over global overrides.
	register: function(config: _tmp.Config): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
