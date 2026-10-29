-- global type WezTerm.Url = Wezterm.Url
-- global type Wezterm.URL = Wezterm.Url
-- global type WezTerm.URL = Wezterm.Url

---The `Url` object represents a parsed URL.
---An example:
---```lua
---local wezterm = require('wezterm')
---local url = wezterm.url.parse('file://myhost/some/path%20with%20spaces')
---assert(url.scheme == 'file')
---assert(url.file_path == '/some/path with spaces')
---local url = wezterm.url.parse('https://github.com/rust-lang/rust/issues?labels=E-easy&state=open')
---assert(url.scheme == 'https')
---assert(url.username == '')
---assert(url.password == nil)
---assert(url.host == 'github.com')
---assert(url.path == '/rust-lang/rust/issues')
---assert(url.query == 'labels=E-easy&state=open')
---```

local enum UrlType
	"file"
	"https"
	"http"
end

local record Url
	---The URL scheme such as `"file"`, or `"https"`.
	scheme: UrlType | nil
	---Decodes the path field and interprets it as a file path.
	file_path: string | nil
	---The `username` portion of the URL, or an empty string
	---if none is specified.
	username: string
	---The password portion of the URL, or `nil` if none is specified.
	password: string | nil
	---The `hostname` portion of the URL, with IDNA decoded to UTF-8.
	host: string | nil
	---The `path` portion of the URL, complete with percent encoding.
	path: string | nil
	---The `fragment` portion of the URL.
	fragment: string | nil
	---The `query` portion of the URL.
	query: string | nil
end

---The `wezterm.url` module exposes functions that
---allow working with URLs.
local record WeztermUrl
	---The `Url` object represents a parsed URL.
	url: Url
end

local record url
	---Attempts to parse the provided URL_STRING as a URL.
	---If successful, returns a `Url` object representing said URL.
	parse: function(url_string: string): Url|nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
