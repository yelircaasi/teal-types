---@diagnostic disable:unused-local

local record Replay.Extractors.Spec
	label: string
	postfix: string | nil
	prefix: string | nil
local E = {}

function E.extractor(s: string): string[]

local record ReplayOpts
	extractors: Replay | nil.Extractors.Spec[]
	recall_key: string | nil
	replay_key: string | nil
	skip_keybinds: boolean | nil
end

local record Replay
local M = {}

---@param config Config
---@param opts? ReplayOpts
function M.apply_to_config(config, opts) end


function M.recall(): {


function M.replay(): {

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
