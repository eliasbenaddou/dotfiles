local wezterm = require("wezterm")
local config = require("config")
require("events")

local themes = {
	tokyo_night_storm = "Tokyo Night Storm",
}

local success, stdout, stderr = wezterm.run_child_process({ os.getenv("SHELL"), "-c", "printenv WEZTERM_THEME" })
local selected_theme = stdout:gsub("%s+", "") -- Remove all whitespace characters including newline
config.color_scheme = themes[selected_theme]

return config
