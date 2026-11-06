local _tmp = require("_tmp")

local interface AIHelperConfigSpec
	keybinding_with_pane: _records.Key | nil
	luarocks_path: string | nil
	share_n_lines: integer | nil
	show_loading:  boolean | nil
	timeout:       integer | nil
end

local enum _Local
	"local"
end
local record AIHelperConfigLocal is AIHelperConfigSpec where self.type == "local"
	lms_path: string
	type: _Local | nil
end

local enum _Google
	"google"
end
local record AIHelperConfigGemini is AIHelperConfigSpec where self.type == "google"
	api_key: string
	type: _Google
end

local enum _Ollama
	"ollama"
end
local record AIHelperConfigOllama is AIHelperConfigSpec where self.type == "ollama"
	model: string | nil
	ollama_path: string
	type: _Ollama
end

local enum _Http
	"http"
end
local record AIHelperConfigOpenAI is AIHelperConfigSpec where self.type == "http"
	api_key: string
	api_url: string
	headers: {string: string} | nil
	model: string
	type: _Http
end


local type AIHelperConfig = AIHelperConfigGemini|AIHelperConfigLocal|AIHelperConfigOllama|AIHelperConfigOpenAI

local record AIHelper
	apply_to_config: function(wezterm_config: _tmp.Config, user_config: AIHelperConfig): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
