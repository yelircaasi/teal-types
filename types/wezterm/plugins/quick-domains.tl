---@diagnostic disable:unused-local

local record QuickDomainsOpts.Icons
	bash: string | nil
	docker: string | nil
	exec: string | nil
	fish: string | nil
	hosts: string | nil
	kubernetes: string | nil
	powershell: string | nil
	pwsh: string | nil
	ssh: string | nil
	tls: string | nil
	unix: string | nil
	windows: string | nil
	wsl: string | nil
	zsh: string | nil
end

local record QuickDomainsKey
	key: string
	mods: string
	tbl: string
end

local record QuickDomainsOpts.Keys
	---Open domain in new tab.
	attach: QuickDomainsKey | nil
	---Open domain in horizontally split pane.
	hsplit: QuickDomainsKey | nil
	---Open domain in vertically split pane.
	vsplit: QuickDomainsKey | nil
end

local record QuickDomainsOpts.Auto
	---Disable exec domain auto configs.
	exec_ignore: { ssh?: boolean, docker?: boolean, kubernetes?: boolean } | nil
	---Disable SSH multiplex auto config.
	ssh_ignore: boolean | nil
end

local record QuickDomainsOpts
	---Auto-configuration.
	auto: QuickDomainsOpts |Auto | nil
	docker_shell: string | nil
	---Swap in and out icons for specific domains.
	icons: QuickDomainsOpts |Icons | nil
	keys: QuickDomainsOpts |Keys | nil
	kubernetes_shell: string | nil
end

local record QuickDomains
local M = {}

---@param config Config
---@param user_settings? QuickDomainsOpts
apply_to_config: function(config, user_settings) end

formatter: function(icon: string, name: string): string

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
