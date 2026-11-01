local _tmp = require("_tmp")

local enum Provider --AICommanderConfig.Provider
	"anthropic"
	"openai"
end

local record APIKey --AICommanderConfig.APIKey
anthropic: string | nil   ---Your Anthropic API key.
openai: string | nil   ---Your OpenAI API key.
end

local type Model = APIKey --AICommanderConfig.Model: AICommanderConfig.APIKey

local record AICommanderConfig
	api_key:       APIKey   | nil
	command_count: integer  | nil ---Number of commands to generate (default: `5`).
	history_file:  string   | nil ---History file location.
	max_history:   integer  | nil ---Maximum number of history items.
	max_tokens:    integer  | nil ---Maximum response length.
	model:         Model    | nil
	provider:      Provider | nil ---`"anthropic"` or `"openai"` (default: `"anthropic"`).
	temperature:   number   | nil ---Response creativity (`0.0` - `1.0`).
end

local record AICommander
	apply_to_config: function(wezterm_config: _tmp.Config, plugin_config: AICommanderConfig): nil

	show_history:    function(window: _tmp.Window, pane: _tmp.Pane): nil

	show_prompt:     function(window: _tmp.Window, pane: _tmp.Pane): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
