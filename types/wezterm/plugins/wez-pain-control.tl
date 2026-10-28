---@diagnostic disable:unused-local

local record WezPainControlOpts
	pane_resize: integer | nil
end

local record WezPainControl
local M = {}

---@param config Config
---@param opts? WezPainControlOpts
function M.apply_to_config(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
