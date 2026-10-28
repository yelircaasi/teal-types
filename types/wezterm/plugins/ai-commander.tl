---@diagnostic disable:unused-local

local type AICommanderConfig.Provider =
	"anthropic"|"openai"

local record AICommanderConfig.APIKey
	---Your Anthropic API key.
	anthropic: string | nil
	---Your OpenAI API key.
	openai: string | nil
end

local record AICommanderConfig.Model: AICommanderConfig.APIKey

local record AICommanderConfig
	api_key: AICommanderConfig | nil.APIKey
	---Number of commands to generate (default: `5`).
	command_count: integer | nil
	---History file location.
	history_file: string | nil
	---Maximum number of history items.
	max_history: integer | nil
	---Maximum response length.
	max_tokens: integer | nil
	model: AICommanderConfig | nil.Model
	---`"anthropic"` or `"openai"` (default: `"anthropic"`).
	provider: AICommanderConfig | nil.Provider
	---Response creativity (`0.0` - `1.0`).
	temperature: number | nil
end

local record AICommander
local M = {}

function M.apply_to_config(wezterm_config: Config, plugin_config: AICommanderConfig) end

function M.show_history(window: Window The `Window` object., pane: Pane The `Pane` object.) end

function M.show_prompt(window: Window The `Window` object., pane: Pane The `Pane` object.) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
