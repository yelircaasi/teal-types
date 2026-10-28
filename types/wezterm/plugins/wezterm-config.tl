---@diagnostic disable:unused-local

local record weztermConfig
local M = {}

---Interpret the WezTerm user var that is passed in and make the appropriate changes
---to the given overrides table; for use within a callback function in the WezTerm config
---for the `user-var-changed` event.
---@param overrides Config
function M.override_user_var(name: string, name, value: string): Config

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
