local _tmp = require("_tmp")

local record Icons --QuickDomainsOpts.Icons
	bash:       string | nil
	docker:     string | nil
	exec:       string | nil
	fish:       string | nil
	hosts:      string | nil
	kubernetes: string | nil
	powershell: string | nil
	pwsh:       string | nil
	ssh:        string | nil
	tls:        string | nil
	unix:       string | nil
	windows:    string | nil
	wsl:        string | nil
	zsh:        string | nil
end

local record QuickDomainsKey
	key:  string
	mods: string
	tbl:  string
end

local record Keys --QuickDomainsOpts.Keys
	attach: QuickDomainsKey | nil   ---Open domain in new tab.
	hsplit: QuickDomainsKey | nil   ---Open domain in horizontally split pane.
	vsplit: QuickDomainsKey | nil   ---Open domain in vertically split pane.
end

local record _Ignores
	ssh:        boolean | nil
	docker:     boolean | nil
	kubernetes: boolean | nil
end

local record Auto --QuickDomainsOpts.Auto
	exec_ignore: _Ignores | nil   ---Disable exec domain auto configs.
	ssh_ignore:  boolean  | nil   ---Disable SSH multiplex auto config.
end

local record QuickDomainsOpts
	auto:             Auto   | nil   ---Auto-configuration.
	docker_shell:     string | nil
	icons:            Icons  | nil   ---Swap in and out icons for specific domains.
	keys:             Keys   | nil
	kubernetes_shell: string | nil
end

local record QuickDomains
	apply_to_config: function(config: _tmp.Config, user_settings: QuickDomainsOpts|nil): nil

	formatter: function(icon: string, name: string): string
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
