local record PresentationWezConfigMode
	enabled: boolean | nil
	font_size_multiplier: number | nil
	font_weight: FontWeight | nil
	keybind: Key | nil
end

local record PresentationWezConfig
	font_size_multiplier: number | nil
	font_weight: FontWeight | nil
	presentation: PresentationWezConfigMode | nil
	presentation_full: PresentationWezConfigMode | nil
end

local record PresentationWez
local M = {}

---@param config Config
---@param opts? PresentationWezConfig
function M.apply_to_config(config, opts): Config

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
