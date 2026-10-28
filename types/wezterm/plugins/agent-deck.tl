---@diagnostic disable:unused-local

local type AgentDeckStatus =
	"idle"|"inactive"|"waiting"|"working"
local type AgentDeck.ComponentSpec.Type =
	"badge"|"icon"|"separator"
local type AgentDeckOpts.Icons.Style =
	"emoji"|"nerd"|"unicode"
local type AgentDeck.Notifications.Backend =
	"terminal-notifier"|"native"

local record AgentDeck.AgentsSpec.StatusPatterns
	idle: string | nil[]
	inactive: string | nil[]
	waiting: string | nil[]
	working: string | nil[]
end

local record AgentDeck.AgentsSpec
	argv_patterns: string | nil[]
	executable_patterns: string | nil[]
	patterns: string | nil[]
	status_patterns: AgentDeck | nil.AgentsSpec.StatusPatterns
	title_patterns: string | nil[]
end

local record AgentDeckOpenCodeOpts: AgentDeck.AgentsSpec

local record AgentDeckClaudeOpts: AgentDeck.AgentsSpec

local record AgentDeckGeminiOpts: AgentDeck.AgentsSpec

local record AgentDeckCodexOpts: AgentDeck.AgentsSpec

local record AgentDeckAiderOpts: AgentDeck.AgentsSpec

local record AgentDeckOpts.Agents
	aider: AgentDeckAiderOpts | nil
	claude: AgentDeckClaudeOpts | nil
	codex: AgentDeckCodexOpts | nil
	gemini: AgentDeckGeminiOpts | nil
	opencode: AgentDeckOpenCodeOpts | nil
end

local record AgentDeck.ComponentSpec
	filter: AgentDeckStatus | nil
	label: string | nil
	text: string | nil
	type: AgentDeck | nil.ComponentSpec.Type
end

local record AgentDeckOpts.RightStatus
	components: AgentDeck | nil.ComponentSpec[]
	enabled: boolean | nil
end

local record AgentDeckOpts.TabTitle
	components: AgentDeck | nil.ComponentSpec[]
	enabled: boolean | nil
---@field position? "left"|string

local record AgentDeckOpts.Colors
	idle: string | nil
	inactive: string | nil
	waiting: string | nil
	working: string | nil
end

local record AgentDeck.IconStyleSpec: AgentDeckOpts.Colors

local record AgentDeckOpts.Icons
	emoji: AgentDeck | nil.IconStyleSpec
	nerd: AgentDeck | nil.IconStyleSpec
	style: AgentDeckOpts | nil.Icons.Style
	unicode: AgentDeck | nil.IconStyleSpec
end

local record AgentDeck.Notifications.TerminalNotifier
	activate: boolean | nil
	group: string | nil
	path: string | nil
	sound: string | nil
	title: string | nil
end

local record AgentDeckOpts.Notifications
	backend: AgentDeck | nil.Notifications.Backend
	enabled: boolean | nil
	on_waiting: boolean | nil
	suppress_osc_notifications: boolean | nil
	terminal_notifier: AgentDeck | nil.Notifications.TerminalNotifier
	timeout_ms: integer | nil
end

local record AgentDeckOpts
	agents: AgentDeckOpts | nil.Agents|table<string, AgentDeck.AgentsSpec>
	colors: AgentDeckOpts | nil.Colors
	cooldown_ms: integer | nil
	enabled_agents: nil | nil|string[]
	icons: AgentDeckOpts | nil.Icons
	max_lines: integer | nil
	right_status: AgentDeckOpts | nil.RightStatus
	update_interval: integer | nil
	notifications: AgentDeckOpts | nil.Notifications
end

local record AgentDeckState
	agent_type: string
	cooldown_start: integer | nil
	last_update: integer
	status: AgentDeckStatus

local record AgentDeckStatusCounts
	idle: integer
	inactive: integer
	waiting: integer
	working: integer
end

local record AgentDeck
local M = {}

---@param config Config
---@param opts? AgentDeckOpts
function M.apply_to_config(config, opts) end


function M.count_agents_by_status(): AgentDeckStatusCounts

function M.get_agent_state(pane_id: integer): AgentDeckState


function M.get_all_agent_states(): table<integer,


function M.get_config(): AgentDeckOpts

function M.get_status_color(status_name: AgentDeckStatus): string

function M.get_status_icon(status_name: AgentDeckStatus): string

---@param opts? AgentDeckOpts
function M.set_config(opts) end

---@param opts? AgentDeckOpts
function M.setup(opts) end

function M.update_pane(pane: Pane): AgentDeckState|nil|? | nil

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
