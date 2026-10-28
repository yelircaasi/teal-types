local record SshHost
	hostname: string
	identityagent: string
	identityfile: string
	port: string
	user: string
	userknownhostsfile: string

---The `SshDomain` struct specifies information about an individual SSH Domain.
local record SshDomain
	---If `true`, connect to this domain automatically at startup.
	connect_automatically: boolean | nil
	---The name of this specific domain.
	---Must be unique amongst all types of domain in the configuration file.
	name: string
	---Whether agent auth should be disabled.
	---Set to `true` to disable it.
	no_agent_auth: boolean | nil
	---Identifies the host:port pair of the remote server.
	---Can be a DNS name or an IP address with an optional `":<port>"` at the end.
	remote_address: string
	---The path to the wezterm binary on the remote host.
	---Primarily useful if it isn't installed in the `PATH` of the remote session.
	remote_wezterm_path: string | nil
	---Specifies an alternative read timeout.
	timeout: integer | nil
	---The username to use for authenticating with the remote host.
	username: string

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
