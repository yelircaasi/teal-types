local _tmp = require("_tmp")

local record Icons --QuotaLimitOpts.Icons
	bolt: string | nil
	week: string | nil
end

local record DashboardKey --QuotaLimitOpts.DashboardKey: SendKeyParams
	mods: string
end

local record Colors --QuotaLimitOpts.Colors
	yellow: string | nil
	red: string | nil
	green: string | nil
	dim: string | nil
	bright: string | nil
end

local record QuotaLimitOpts
	enum _Appearance
		"auto"
		"dark"
		"light"
	end
	colors:             _Appearance | Colors | nil
	dashboard_key:      DashboardKey | nil
	icons:              Icons | nil
	poll_interval_secs: integer | nil
	enum _LR
		"left"
		"right"
	end
	position: _LR | nil
end

local record QuotaLimit
	apply_to_config: function(config: _tmp.Config, opts: QuotaLimitOpts|nil): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
