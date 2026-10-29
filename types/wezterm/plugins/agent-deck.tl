---@diagnostic disable:unused-local

local enum AgentDeckStatus
	"idle"
	"inactive"
	"waiting"
	"working"
end

local enum AgentDeck.ComponentSpec.Type
	"badge"
	"icon"
	"separator"
end

local type AgentDeckOpts.Icons.Style
	"emoji"
	"nerd"
	"unicode"
end

local type AgentDeck.Notifications.Backend
	"terminal-notifier"
	"native"
end

local record AgentDeck.AgentsSpec.StatusPatterns
	idle: string | {nil}
	inactive: string | {nil}
	waiting: string | {nil}
	working: string | {nil}
end

local record AgentDeck.AgentsSpec
	argv_patterns: string | {nil}
	executable_patterns: string | {nil}
	patterns: string | {nil}
	status_patterns: AgentDeck |AgentsSpec.StatusPatterns | nil
	title_patterns: string | {nil}
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
	type: AgentDeck | ComponentSpec.Type | nil
end

local record AgentDeckOpts.RightStatus
	components: AgentDeck | {ComponentSpec} | nil
	enabled: boolean | nil
end

local record AgentDeckOpts.TabTitle
	components: AgentDeck | {ComponentSpec} | nil
	enabled: boolean | nil
position: "left"|string | nil

local record AgentDeckOpts.Colors
	idle: string | nil
	inactive: string | nil
	waiting: string | nil
	working: string | nil
end

local record AgentDeck.IconStyleSpec: AgentDeckOpts.Colors

local record AgentDeckOpts.Icons
	emoji: AgentDeck |IconStyleSpec | nil
	nerd: AgentDeck |IconStyleSpec | nil
	style: AgentDeckOpts |Icons.Style | nil
	unicode: AgentDeck |IconStyleSpec | nil
end

local record AgentDeck.Notifications.TerminalNotifier
	activate: boolean | nil
	group: string | nil
	path: string | nil
	sound: string | nil
	title: string | nil
end

local record AgentDeckOpts.Notifications
	backend: AgentDeck |Notifications.Backend | nil
	enabled: boolean | nil
	on_waiting: boolean | nil
	suppress_osc_notifications: boolean | nil
	terminal_notifier: AgentDeck |Notifications.TerminalNotifier | nil
	timeout_ms: integer | nil
end

local record AgentDeckOpts
	agents: AgentDeckOpts |Agents|{string: | nil AgentDeck.AgentsSpec}
	colors: AgentDeckOpts |Colors | nil
	cooldown_ms: integer | nil
	enabled_agents: nil | nil|{string}
	icons: AgentDeckOpts |Icons | nil
	max_lines: integer | nil
	right_status: AgentDeckOpts |RightStatus | nil
	update_interval: integer | nil
	notifications: AgentDeckOpts |Notifications | nil
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

	apply_to_config: function(config: Config, opts: AgentDeckOpts | nil): nil

	count_agents_by_status: function(): AgentDeckStatusCounts

	get_agent_state: function(pane_id: integer): AgentDeckState

	get_all_agent_states: function(): table<integer>,


	get_config: function(): AgentDeckOpts

	get_status_color: function(status_name: AgentDeckStatus): string

	get_status_icon: function(status_name: AgentDeckStatus): string

	---@param opts? 
	set_config: function(opts): nil

	setup: function(opts: AgentDeckOpts | nil): nil

	update_pane: function(pane: Pane): AgentDeckState|nil|? | nil
end
-- vim: set ts=2 sts=2 sw=2 et ai si sta:
