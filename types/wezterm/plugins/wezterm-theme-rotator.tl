---@diagnostic disable:unused-local

local record ThemeRotatorOpts
	---Customize "Default Theme" key.
	default_theme_key: string | nil
	default_theme_mods: string | nil
	---Customize "Next Theme" key.
	next_theme_key: string | nil
	next_theme_mods: string | nil
	---Customize "Previous Theme" key.
	prev_theme_key: string | nil
	prev_theme_mods: string | nil
	---Customize "Random Theme" key.
	random_theme_key: string | nil
	random_theme_mods: string | nil
end

local record ThemeRotator
local M = {}

---Apply configuration to WezTerm.
---@param config Config
---@param options? ThemeRotatorOpts
function M.apply_to_config(config, options): Config

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
