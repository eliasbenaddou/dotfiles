local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local function resize_pane(key, direction)
  return {
    key = key,
    action = wezterm.action.AdjustPaneSize { direction, 3 }
  }
end

local function move_pane(key, direction)
  return {
    key = key,
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection(direction),
  }
end

config.default_cursor_style = "SteadyBar"
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
config.check_for_updates = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.font_size = 15
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.enable_tab_bar = false
config.window_padding = { left = 3, right = 3, top = 0, bottom = 0 }

config.hyperlink_rules = {
  { regex = "\\((\\w+://\\S+)\\)", format = "$1", highlight = 1 },
  { regex = "\\[(\\w+://\\S+)\\]", format = "$1", highlight = 1 },
  { regex = "\\{(\\w+://\\S+)\\}", format = "$1", highlight = 1 },
  { regex = "<(\\w+://\\S+)>", format = "$1", highlight = 1 },
  { regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)", format = "$1", highlight = 1 },
  { regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b", format = "mailto:$0" },
}

config.keys = {
  { key = "LeftArrow", mods = "OPT", action = wezterm.action.SendString "\x1bb" },
  { key = "RightArrow", mods = "OPT", action = wezterm.action.SendString "\x1bf" },
  { key = "v", mods = "LEADER", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "s", mods = "LEADER", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
  move_pane("j", "Down"),
  move_pane("k", "Up"),
  move_pane("h", "Left"),
  move_pane("l", "Right"),
  {
    key = "d",
    mods = "LEADER",
    action = wezterm.action.ActivateKeyTable {
      name = "resize_panes",
      one_shot = false,
      timeout_milliseconds = 1000,
    }
  }
}

config.key_tables = {
  resize_panes = {
    resize_pane("j", "Down"),
    resize_pane("k", "Up"),
    resize_pane("h", "Left"),
    resize_pane("l", "Right"),
  }
}

config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 }

return config
