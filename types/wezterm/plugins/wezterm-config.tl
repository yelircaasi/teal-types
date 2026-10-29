local record weztermConfig
    ---Interpret the WezTerm user var that is passed in and make the appropriate changes
    ---to the given overrides table; for use within a callback function in the WezTerm config
    ---for the `user-var-changed` event.
    override_user_var: function(overrides: Config, name: string, value: string): Config
end
-- vim: set ts=2 sts=2 sw=2 et ai si sta:
