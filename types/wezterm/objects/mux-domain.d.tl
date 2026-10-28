---Represents a domain that is managed by the multiplexer.
local record MuxDomain
local M = {}

---Attempts to attach the domain.
---Attaching a domain will attempt to import the windows, tabs and panes from the remote system
---into those of the local GUI.
---Unlike the `AttachDomain` key assignment, calling `MuxDomain:attach()` will not implicitly spawn
---a new pane into the domain if the domain contains no panes. This is to provide flexibility
---when used in the `gui-startup` event.
---If the domain is already attached, calling this method again has no effect.
function M:attach(): nil

---Attempts to detach the domain.
---Detaching a domain causes it to disconnect and remove its set of windows, tabs and panes
---from the local GUI. Detaching does not cause those panes to close; if or when you later attach
---to the domain, they'll still be there.
---Note that not every domain supports detaching, and will log an error to the error log/debug
---overlay.
function M:detach(): nil

---Returns the domain ID.
function M:domain_id(): integer

---Returns `true` if the mux has any panes that belong to this domain.
---This can be useful when deciding whether to spawn additional panes after attaching to a domain.
function M:has_any_panes(): boolean

---Returns `false` if this domain will never be able to spawn a new pane/tab/window,
---`true` otherwise.
---Serial ports are represented by a serial domain that is not spawnable.
function M:is_spawnable(): boolean

---Computes a label describing the `name` and `state` of the domain. The label can change
---depending on the `state` of the domain.
---See also:
--- - [`MuxDomain:name()`](lua://MuxDomain.name)
function M:label(): string

---Returns the name of the domain.
---Domain names are unique; no two domains can have the same name, and the name is fixed for
---the lifetime of the domain.
---See also:
--- - [`MuxDomain:label()`](lua://MuxDomain.label)
function M:name(): string

---Returns whether the domain is attached or not.
---The result is a string that is either:
--- - `"Attached"`: the domain is attached
--- - `"Detached"`: the domain is not attached
---See also:
--- - [`MuxDomain:attach()`](lua://MuxDomain.attach)
--- - [`MuxDomain:detach()`](lua://MuxDomain.detach)
function M:state(): "Attached"|"Detached"

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
