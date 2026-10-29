local type WezTerm.Serde Wezterm.Serde

---The `wezterm.serde` module provides functions for parsing the given string as
---JSON, YAML, or TOML, returning the corresponding Lua values, and vice versa.
local record Wezterm.Serde
local M = {}

---Parses the supplied string as JSON and returns the equivalent Lua values.
json_decode: function(value: string): table

---Encodes the supplied Lua value as JSON.
json_encode: function(value: table): string

---Encodes the supplied Lua value as a pretty-printed string of JSON.
json_encode_pretty: function(value: table): string

---Parses the supplied string as TOML and returns the equivalent Lua values.
toml_decode: function(value: string): table

---Encodes the supplied Lua value as TOML.
toml_encode: function(value: table): string

---Encodes the supplied Lua value as a pretty-printed string of TOML.
toml_encode_pretty: function(value: table): string

---Parses the supplied string as YAML and returns the equivalent Lua values.
yaml_decode: function(value: string): table

---Encodes the supplied Lua value as YAML.
yaml_encode: function(value: table): string

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
