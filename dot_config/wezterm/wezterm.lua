local wezterm = require("wezterm")
local config = require("config")
require("events")

local themes = {
  nord = "Nord (Gogh)",
  onedark = "One Dark (Gogh)",
  github_dark = "Github Dark (Gogh)"
}

-- Retrieve the WEZTERM_THEME environment variable
local success, stdout, stderr = wezterm.run_child_process({ os.getenv("SHELL"), "-c", "printenv WEZTERM_THEME" })

-- Remove all whitespace characters (including newline) and apply the theme
local selected_theme = stdout:gsub("%s+", "")
config.color_scheme = themes[selected_theme]

return config
