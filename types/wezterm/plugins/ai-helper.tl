---@diagnostic disable:unused-local

local record AIHelperConfigSpec
	keybinding_with_pane: Key | nil
	luarocks_path: string | nil
	share_n_lines: integer | nil
	show_loading: boolean | nil
	timeout: integer | nil
end

local record AIHelperConfigLocal: AIHelperConfigSpec
	lms_path: string
---@field type? 'local'

local record AIHelperConfigGemini: AIHelperConfigSpec
	api_key: string
---@field type 'google'

local record AIHelperConfigOllama: AIHelperConfigSpec
	model: string | nil
	ollama_path: string,
---@field type 'ollama'

local record AIHelperConfigOpenAI: AIHelperConfigSpec
	api_key: string
	api_url: string
	headers: table | nil<string, string>
	model: string
---@field type 'http'

local type AIHelperConfig =
	AIHelperConfigGemini
	|AIHelperConfigLocal
	|AIHelperConfigOllama
	|AIHelperConfigOpenAI
end

local record AIHelper
local M = {}

function M.apply_to_config(wezterm_config: Config, user_config: AIHelperConfig) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
