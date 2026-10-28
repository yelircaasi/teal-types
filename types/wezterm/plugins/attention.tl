---@diagnostic disable:unused-local

local type WeztermAttentionOpts.Attention =
	"notify"|"review"|"stop"|"thinking"
local type WeztermAttentionOpts.Renderer =
	"manual"|"tab"
local type WeztermAttention.TitleFormatter fun(tab: TabInformation, ctx: WeztermAttention.WrapTitleFormatterCtx): title: string

local record WeztermAttention.WrapTitleFormatterCtx
	attention: string[]|string
	config: Config
	default_title: string
	hover: boolean
	max_width: integer
	panes: PaneInformation[]
	tabs: TabInformation[]

local record WeztermAttentionOpts.ReviewKey: SendKeyParams
	key: string | nil
end

local record WeztermAttentionOpts.Colors
	notify: string | nil
	review: string | nil
	stop: string | nil
	thinking: string | nil
end

local record WeztermAttentionOpts.Indicators
	notify: string | nil
	review: string | nil
	stop: string | nil
	thinking_frames: string | nil[]
end

local record WeztermAttentionOpts
	---@field acknowledge_types? ("notify"|"stop"|string)[]
	auto_clear: WeztermAttentionOpts | nil.Attention[]
	colors: WeztermAttentionOpts | nil.Colors
	dir: string | nil
	indicators: WeztermAttentionOpts | nil.Indicators
	priority: WeztermAttentionOpts | nil.Attention[]
	renderer: WeztermAttentionOpts | nil.Renderer
	review_key: WeztermAttentionOpts | nil.ReviewKey
	---@field stale_after_ms? { thinking: integer }|false
	title_formatter: WeztermAttention | nil.TitleFormatter
end

local record WeztermAttention.Internal
local I = {}

---@param pane_id integer
---@param opts? WeztermAttentionOpts|{ now_ms?: integer }|{ write_acknowledgement?: fun(dir: string, pane_id: string, identity: string): success: boolean }
function I.acknowledge_focused_pane(pane_id, opts): "absent"|"acknowledged"|"failed"|"kept"

---@param pane_ids string[]
---@param opts? WeztermAttentionOpts
function I.resolve_visible_attention(pane_ids, opts): {

local record WeztermAttention
	private: _active_acknowledge_set table<string, boolean>
	private: _active_colors WeztermAttentionOpts.Colors
	private: _active_dir string
	private: _internal WeztermAttention.Internal
local M = {}

---@param config Config
---@param opts? WeztermAttentionOpts
function M.apply_to_config(config, opts) end

---Read the cached attention state for a pane.
---Returns a `type`, `frame` tuple, or `nil`.
---@param pane_id integer
---@param opts? WeztermAttentionOpts
---@return string|nil|? type
function M.get_attention(pane_id, opts): integer|nil|? | nil

---Remove the attention marker for a pane.
---@param pane_id integer
---@param opts? WeztermAttentionOpts
function M.remove_marker(pane_id, opts) end

---Poll marker files and update cache.
---Call from your own `update-status` handler if you set `auto_poll` to `false`,
---or if WezTerm only fires one handler.
---Only refreshes entries for panes in the current window. Cross-window cache entries
---are left alone — pruning them here would cause cache thrash when multiple windows fire
---`update-status` (each window would wipe the other's entries every tick, producing visible
---tab-indicator blinking). Stale entries are cleaned up by the pane-destroyed handler.
---@param window Window
---@param opts? WeztermAttentionOpts
function M.poll(window, opts) end

function M.wrap_title_formatter(base_fn: WeztermAttention.TitleFormatter): fun(tab:

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
