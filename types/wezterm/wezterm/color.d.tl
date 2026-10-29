---`Color` objects can be created by calling `wezterm.color.parse()` and may also be returned
---by various WezTerm functions and methods. They represent a color that is internally stored
---in `SRGBA` format.

local type NumberTriple = (number, number, number)
local type NumberQuadruple = (number, number, number, number)

local record Color
local Color = {}

---Adjust the hue angle by the specified number of degrees.
---180 degrees gives the complementary color. Three colors separated by 120 degrees form the triad.
---Four colors separated by 90 degrees form the square.
function Color:adjust_hue_fixed(degrees: number): Color

---Adjust the hue angle by the specified number of degrees.
---This method uses the `RYB` color model, which more closely matches how artists think of mixing
---colors and which is sometimes referred to as the _"artist's color wheel"_.
---180 degrees gives the complementary color. Three colors separated by 120 degrees form the triad.
---Four colors separated by 90 degrees form the square.
function Color:adjust_hue_fixed_ryb(degrees: number): Color

---Returns the complement of the color.
---The complement is computed by converting to `HSL`, rotating by 180 degrees and converting back
---to `RGBA`.
function Color:complement(): Color

---Returns the complement of the color using the `RYB` color model, which more closely matches
---how artists think of mixing colors.
---The complement is computed by converting to `HSL`, converting the hue angle to the
---equivalent `RYB` angle, rotating by 180 degrees and and then converting back to `RGBA`.
function Color:complement_ryb(): Color

---Computes the contrast ratio between the two colors.
---The contrast ratio is computed by first converting to `HSL`, taking the `L` components,
---and dividing the lighter one by the darker one.
---A contrast ratio of `1` means _no contrast_.
---Note: The maximum possible contrast ratio is `21`.
function Color:contrast_ratio(other: Color): number

---Scales the color towards the minimum lightness by the provided factor, which should be
---in the range `0.0` through `1.0`.
function Color:darken(amount: number): Color

---Decrease the lightness by `amount`, a value ranging from `0.0` to `1.0`.
function Color:darken_fixed(amount: number): Color

---Computes the `CIEDE2000` `DeltaE` value representing the difference between the two colors.
function Color:delta_e(other: Color): number

---Scales the color towards the minimum saturation by the provided factor, which should be
---in the range `0.0` through `1.0`.
function Color:desaturate(amount: number): Color

---Decrease the saturation by `amount`, a value ranging from `0.0` to `1.0`.
function Color:desaturate_fixed(amount: number): Color

---Converts the color to the `HSL` colorspace and returns those values + `alpha`.
function Color:hsla(): NumberQuadruple

---Converts the color to the `LAB` colorspace and returns those values + `alpha`.
function Color:laba(): NumberQuadruple

---Scales the color towards the maximum lightness by the provided factor, which should be
---in the range `0.0` through `1.0`.
function Color:lighten(amount: number): Color

---Increase the lightness by `amount`, a value ranging from `0.0` to `1.0`.
function Color:lighten_fixed(amount: number): Color

---Returns a tuple of the colors converted to linear `RGBA` and expressed as floating point numbers
---in the range of `0.0` and `1.0`.
function Color:linear_rgba(): NumberQuadruple

---Scales the color towards the maximum saturation by the provided factor, which should be
---in the range `0.0` through `1.0`.
function Color:saturate(amount: number): Color

---Increase the saturation by amount, a value ranging from `0.0` to `1.0`.
function Color:saturate_fixed(amount: number): Color

---Returns the other three colors that form a square. The other colors are `90` degrees apart
---on the `HSL` color wheel.
function Color:square(): (Color, Color, Color)

---Returns a tuple of the internal `SRGBA` colors expressed as unsigned 8-bit integers
---in the range of `0` and `255`.
function Color:srgb_u8(): (integer, integer, integer, integer)

---Returns the other two colors that form a triad.
---The other colors are at +/- 120 degrees in the `HSL` color wheel.
function Color:triad(): (Color, Color)

-- vim: set ts=2 sts=2 sw=2 et ai si sta:



local record ImageExtractorParams
	fuzziness: number | nil
	num_colors: number | nil
	max_width: number | nil
	max_height: number | nil
	min_brightness: number | nil
	max_brightness: number | nil
	threshold: number | nil
	min_contrast: number | nil
end

local type WezTerm.Color Wezterm.Color

---The `wezterm.color` module exposes functions that work with colors.
local record Wezterm.Color

	---This function loads an image from the specified filename
	---and analyzes it to determine a set of distinct colors present
	---in the image, ordered by how often a given color is found
	---in the image, descending.
	---For example, if an image is predominantly black with
	---a bit of white, then `black` will be listed first
	---in the returned array.
	---This is potentially useful if you wish to generate
	---a color scheme to match an image, for example.
	---The default is to extract 16 colors from an image.
	---For more info on the parameters you can use, see:
	--- - [`ImageExtractorParams`](lua://ImageExtractorParams)
	--- ---
	---The analysis is relatively expensive and can take
	---several seconds if used on a full 4K image file.
	---To reduce the runtime, WezTerm will by default
	---scale the image down and skip over nearby pixels.
	---The results of the analysis will be cached to avoid
	---repeating the same work each time the configuration
	---is re-evaluated.
	---You can find more examples [here](https://wezterm.org/config/lua/wezterm.color/extract_colors_from_image.html).
	extract_colors_from_image: function(filename: string): string[]

	---This function loads an image from the specified filename
	---and analyzes it to determine a set of distinct colors present
	---in the image, ordered by how often a given color is found
	---in the image, descending.
	---For example, if an image is predominantly black with
	---a bit of white, then `black` will be listed first
	---in the returned array.
	---This is potentially useful if you wish to generate
	---a color scheme to match an image, for example.
	---The default is to extract 16 colors from an image.
	---For more info on the parameters you can use, see:
	--- - [`ImageExtractorParams`](lua://ImageExtractorParams)
	--- ---
	---The analysis is relatively expensive and can take
	---several seconds if used on a full 4K image file.
	---To reduce the runtime, WezTerm will by default
	---scale the image down and skip over nearby pixels.
	---The results of the analysis will be cached to avoid
	---repeating the same work each time the configuration
	---is re-evaluated.
	---You can find more examples [here](https://wezterm.org/config/lua/wezterm.color/extract_colors_from_image.html).
	extract_colors_from_image: function(filename: string, params: ImageExtractorParams|nil): string[]

	---Constructs a new
	---[`Color`](lua://Color) object
	---from values in the HSL colorspace, plus `alpha`.
	---A useful source for info on parsing can be:
	--- - [`wezterm.color.parse()`](lua://Wezterm.Color.parse)
	from_hsla: function(h: string|number, s: string|number, l: string|number, a: string|number): Color

	---Returns a Lua table keyed by color scheme name,
	---whose values are the color scheme definition
	---of the builtin color schemes.
	---This is useful for programmatically deciding things
	---about the scheme to use based on its color,
	---or for taking a scheme and overriding a couple of entries
	---just from your `wezterm.lua` configuration file.
	get_builtin_schemes: function(): table<string,

	---Returns the set of colors that would be used by default.
	---This is useful if you want to reference those colors
	---in a color scheme definition.
	get_default_colors: function(): Palette

	---Given a gradient spec and a number of colors,
	---returns a table holding that many colors spaced evenly
	---across the range of the gradient.
	---Returns an array of tables of type
	---[`Color`](lua://Color).
	---This is useful, for example, to generate colors for tabs
	---or to do something fancy like interpolating colors
	---across a gradient based on the time of the day.
	---`gradient` is any [`Gradient`](lua://Gradient)
	---allowed by the `config.window_background_gradient` option.
	---See:
	--- - [`config.window_background_gradient`](lua://Config.window_background_gradient)
	gradient: function(gradient: Gradient, num_colors: number): Color[]

	---Loads a YAML file in `base16` format and returns it
	---as a WezTerm color scheme.
	---Note that wezterm ships with the `base16` color schemes
	---that were referenced via [base16-schemes-source](https://github.com/chriskempson/base16-schemes-source)
	---when the release was prepared, so this function is primarily useful
	---if you want to import a `base16` color scheme that either
	---isn't listed from the main list, or that was created
	---after your version of wezterm was built.
	---This function returns a tuple of the
	---the color definitions and the metadata.
	load_base16_scheme: function(file_name: string): (Palette, ColorSchemeMetaData)

	---Loads a wezterm color scheme from a TOML file.
	---This function returns a tuple of the the color definitions
	---and the metadata.
	---See:
	--- - [`Palette`](lua://Palette)
	--- - [`ColorSchemeMetaData`](lua://ColorSchemeMetaData)
	load_scheme: function(file_name: string): (Palette, ColorSchemeMetaData)

	---Loads a json file exported from [`terminal.sexy`](https://terminal.sexy/)
	---and returns it as a wezterm color scheme.
	---Note that wezterm ships with all of the pre-defined `terminal.sexy` color schemes,
	---so this function is primarily useful if you want to design a color scheme
	---using `terminal.sexy` and then import it to wezterm.
	---This function returns a tuple of the the color definitions and the metadata.
	---See:
	--- - [`Palette`](lua://Palette)
	--- - [`ColorSchemeMetaData`](lua://ColorSchemeMetaData)
	load_terminal_sexy_scheme: function(file_name: string): (Palette, ColorSchemeMetaData)

	---Parses the passed color and returns a
	---[`Color`](lua://Color) object.
	---`Color` objects evaluate as strings
	---but have a number of methods that allow
	---transforming and comparing colors.
	---```lua
	---local wezterm = require 'wezterm'
	---local fg = wezterm.color.parse 'yellow'
	---local bg = fg:complement_ryb():darken(0.2)
	---return {
	---  colors = {
	---    foreground = fg,
	---    background = bg,
	---  },
	---}
	---```
	parse: function(color_name: string): Color

	---Saves a color scheme as a wezterm TOML file.
	---This is useful when sharing your custom
	---color scheme with others.
	---While you could share the Lua representation
	---of the scheme, the TOML file is recommended
	---for sharing as it is purely declarative:
	---no executable logic is present in the
	---TOML color scheme which makes it safe
	---to consume "random" schemes from the internet.
	---You may find examples [here](https://wezterm.org/config/lua/wezterm.color/save_scheme.html).
	---@param colors 
	save_scheme: function(colors: Palette, metadata: PaneMetadata, file_name: string): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
