---The TlsDomainClient struct specifies information about how to connect to a [TLS Domain](https://wezterm.org/multiplexing.html#tls-domains).
local record TlsDomainClient
	---Explicitly controls whether the client checks that the certificate presented by the server
	---matches the hostname portion of `remote_address`.
	---The default is `true`.
	---This option is made available for troubleshooting purposes and should not be used outside of a
	---controlled environment as it weakens the security of the TLS channel.
	accept_invalid_hostnames: boolean | nil
	---If set, use `ssh` to connect, start the server, and obtain a certificate.
	---The value is `"user@host:port"`, just like what `wezterm ssh` accepts.
	bootstrap_via_ssh: string
	---The name of this specific domain.
	---Must be unique amongst all types of domain in the configuration file.
	name: string
	---The path to an x509 PEM encoded CA chain file.
	---Omit this if you are using `bootstrap_via_ssh`.
	pem_ca: string | nil
	---The path to an x509 PEM encoded certificate file
	---Omit this if you are using `bootstrap_via_ssh`.
	pem_cert: string | nil
	---The path to an x509 PEM encoded private key file.
	---Omit this if you are using `bootstrap_via_ssh`.
	pem_private_key: string | nil
	---A set of paths to load additional CA certificates.
	---Each entry can be either the path to a directory or to a PEM encoded CA file.
	---If an entry is a directory, then its contents will be loaded as CA certs and added
	---to the trust store.
	---Omit this if you are using `bootstrap_via_ssh`.
	pem_root_certs: string | nil[]
	---Identifies the `host:port` pair of the remote server.
	remote_address: string
	---The hostname string that we expect to match against the common name field in the certificate
	---presented by the server.
	---This defaults to the hostname portion of the `remote_address` configuration.
	---**You should not normally need to override this value**.
	expected_cn: string | nil
	---If `true`, connect to this domain automatically at startup.
	connect_automatically: boolean | nil
	---If true, connect to this domain automatically at startup.
	read_timeout: integer | nil
	write_timeout: integer | nil
	---The path to the wezterm binary on the remote host.
	remote_wezterm_path: string | nil
	---Specifies the round-trip latency threshold for enabling predictive local echo.
	local_echo_threshold_ms: integer | nil
	---If you prefer to have the information overlaid on the content area, then you can this to `true`,
	---but note that this may be dropped in the future.
	overlay_lag_indicator: boolean

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
