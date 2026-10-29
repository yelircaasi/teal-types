---@diagnostic disable:unused-local

local type Kanagawa.PaletteName =
	"dragon"|"lotus"|"wave"

---Role-based overrides for `kanagawa.apply_by_appearance()`.
---See:
--- - [`kanagawa.apply_by_appearance()`](lua://Kanagawa.apply_by_appearance)
local record kanagawa.AppearanceOverrides
	---Overrides applied when the dark role is selected.
	dark: Palette | nil
	---Overrides applied when the fallback role is selected.
	fallback: Palette | nil
	---Overrides applied when the light role is selected.
	light: Palette | nil

---Options for `kanagawa.apply_by_appearance()`.
---See:
--- - [`kanagawa.apply_by_appearance()`](lua://Kanagawa.apply_by_appearance)
local record kanagawa.AppearanceApplyOpts
	---Explicit appearance string for testing or manual selection.
	appearance: string | nil
	---Scheme name used for dark appearances.
	---Defaults to `"wave"`.
	dark: string | nil
	---Scheme name used when appearance is unknown.
	---Defaults to `"wave"`.
	fallback: string | nil
	---Scheme name used for light appearances.
	---Defaults to `"lotus"`.
	light: string | nil
	---Role-based overrides.
	overrides: kanagawa |AppearanceOverrides | nil

---Options for `kanagawa.register()`.
---See:
--- - [`kanagawa.register()`](lua://Kanagawa.register)
local record kanagawa.RegisterOpts
	---Partial overrides deep-merged into every scheme.
	overrides: Palette | nil
	---Per-scheme overrides keyed by scheme name.
	scheme_overrides: table | nil<string, Palette>

---Options for `apply_to_config`.
local record KanagawaOpts
	---Partial overrides deep-merged into the scheme.
	overrides: Palette | nil
	---Scheme name. Defaults to `"wave"`.
	scheme: Kanagawa |PaletteName | nil
end

local record Kanagawa
	---Base Dragon preset (shared reference).
	dragon: Palette
	---Base Lotus preset (shared reference).
	lotus: Palette
	---Base Wave preset (shared reference).
	wave: Palette
end

local M = {}

---@param config Config
---@param opts? kanagawa.AppearanceApplyOpts Options table.
apply_by_appearance: function(config, opts) end

---Resolve a scheme (with optional overrides), register it in `config.color_schemes`
---under its display name, and set `config.color_scheme` to that name.
---This follows WezTerm's own precedence model: `color_scheme` wins over `colors`,
---so the user can still layer extra per-key tweaks through `config.colors` and
---they will act as overrides on top of the scheme.
---@param config Config WezTerm config builder.
---@param opts? KanagawaOpts Options table.
apply_to_config: function(config, opts) end

---Return a **new** scheme table, optionally deep-merged with user overrides.
---The base preset is never mutated.
---@param name Kanagawa.PaletteName Scheme name: `"wave"`, `"lotus"`, or `"dragon"`.
---@param overrides? Palette Partial table, deep-merged into the cloned scheme.
get: function(name, overrides): Palette

---Register all Kanagawa schemes in `config.color_schemes` without activating
---one through `config.color_scheme`.
---`opts.overrides` applies to every registered scheme. `opts.scheme_overrides`
---can apply additional per-scheme overrides keyed by `wave`, `dragon`, or `lotus`;
---per-scheme overrides win over global overrides.
register: function(config, config: Config): nil

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
