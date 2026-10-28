local record PluginSpec
	---The URL of the plugin repo, as provided to the `wezterm.plugin.require()` function.
	---See:
	--- - [`wezterm.plugin.require()`](lua://Wezterm.Plugin.require)
	url: string
	---The encoded name of the plugin, derived from the repo URL.
	component: string
	---The absolute location of the plugin checkout in the WezTerm runtime directory.
	---Use this to set the plugin path if needed.
	plugin_dir: string
end

local type WezTerm.Plugin Wezterm.Plugin

---The `wezterm.plugin` module provides functions to manage WezTerm plugins.
local record Wezterm.Plugin
local M = {}

---Will return a `PluginSpec` array listing all the plugin repos in the plugin directory.
---For info on the returned array, see:
--- - [`PluginSpec`](lua://PluginSpec)
function M.list(): PluginSpec[]

---Will clone the plugin repo if it doesn't already exist and store it in the runtime directory
---under `plugins/NAME` where `NAME` is derived from the repo URL.
---_Once cloned, the repo is **NOT** automatically updated when `wezterm.plugin.require()`
---is called again._
---The function takes a single string parameter:
--- - `url`: The Git repo URL.
---Only HTTP(S) or local filesystem repos are allowed for the Git URL.
---```lua
---local remote_plugin = wezterm.plugin.require("https://github.com/owner/repo")
---local local_plugin = wezterm.plugin.require("file:///Users/developer/projects/my.Plugin")
---```
function M.require(url: string): unknown

---Attempt to fast-forward or run `git pull --rebase` for each of the repos in the plugin directory.
---Note: The configuration is not reloaded afterwards; the user will need to do that themselves.
---A useful way to reload the configuration is with:
--- - [`wezterm.reload_configuration()`](lua://Wezterm.reload_configuration)
function M.update_all(): nil

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
