# tl Types for Wezterm Lua API

WARNING! This is currently only a rough sketch. These types are not yet correct! Do not use.

This is ported from the [wezterm-types](https://github.com/DrKJeff16/wezterm-types) project, which provides LuaLS annotations for the WezTerm Lua API.

The first pass was performed via a script using Lua patterns, and the second pass
is a manual verification.

This is based on version [5.1.1-1](https://github.com/DrKJeff16/wezterm-types/releases/tag/v5.1.1-1) of `wezterm-types` as of October 2026, although efforts will made to track WezTerm itself.

## Roadmap

- [ ] Change overloads (esp. on `on`) to a common signature types,
      e.g. WeztermEvent and Callback enum: CallbackWindowPane | ...
