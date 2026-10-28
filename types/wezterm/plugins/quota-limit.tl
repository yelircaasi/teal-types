---@diagnostic disable:unused-local

local record QuotaLimitOpts.Icons
	bolt: string | nil
	week: string | nil
end

local record QuotaLimitOpts.DashboardKey: SendKeyParams
	mods: string
end

local record QuotaLimitOpts.Colors
	yellow: string | nil
	red: string | nil
	green: string | nil
	dim: string | nil
	bright: string | nil
end

local record QuotaLimitOpts
	---@field colors? "auto"|"dark"|"light"|QuotaLimitOpts.Colors
	dashboard_key: QuotaLimitOpts | nil.DashboardKey
	icons: QuotaLimitOpts | nil.Icons
	poll_interval_secs: integer | nil
---@field position? "left"|"right"

local record QuotaLimit
local M = {}

---@param config Config
---@param opts? QuotaLimitOpts
function M.apply_to_config(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
