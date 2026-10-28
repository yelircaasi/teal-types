local type WezTerm.Serde Wezterm.Serde

---The `wezterm.serde` module provides functions for parsing the given string as
---JSON, YAML, or TOML, returning the corresponding Lua values, and vice versa.
local record Wezterm.Serde
local M = {}

---Parses the supplied string as JSON and returns the equivalent Lua values.
function M.json_decode(value: string): table

---Encodes the supplied Lua value as JSON.
function M.json_encode(value: table): string

---Encodes the supplied Lua value as a pretty-printed string of JSON.
function M.json_encode_pretty(value: table): string

---Parses the supplied string as TOML and returns the equivalent Lua values.
function M.toml_decode(value: string): table

---Encodes the supplied Lua value as TOML.
function M.toml_encode(value: table): string

---Encodes the supplied Lua value as a pretty-printed string of TOML.
function M.toml_encode_pretty(value: table): string

---Parses the supplied string as YAML and returns the equivalent Lua values.
function M.yaml_decode(value: string): table

---Encodes the supplied Lua value as YAML.
function M.yaml_encode(value: table): string

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
