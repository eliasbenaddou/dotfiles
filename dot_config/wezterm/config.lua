local wezterm = require("wezterm")
local config = {}
local lwl = wezterm.plugin.require("https://github.com/estin/lazy-workspace-layout?rev=master")
local home = wezterm.home_dir
local projects_dir = home .. "/efforts_on"

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

local function get_project_workspaces()
  local workspaces = {}
  local p = io.popen('find "' .. projects_dir .. '" -mindepth 1 -maxdepth 1 -type d 2>/dev/null')
  if p then
    for dir in p:lines() do
      local project_name = dir:match(".*/(.*)")
      table.insert(workspaces, { cwd = dir, label = project_name })
    end
    p:close()
  end
  return workspaces
end

local workspaces = get_project_workspaces()
lwl.init(workspaces)

wezterm.on('refresh-workspaces', function(window, pane)
  local new_workspaces = get_project_workspaces()
  lwl.update_workspaces(new_workspaces)
  window:toast_notification('WezTerm', 'Workspaces refreshed', nil, 4000)
end)

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_cursor_style = "SteadyBar"
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
config.check_for_updates = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.enable_tab_bar = false
config.font_size = 15
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
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
  { key = "w", mods = "LEADER", action = lwl.bind() },
  { key = "r", mods = "LEADER", action = wezterm.action.EmitEvent("refresh-workspaces") },
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

config.leader = { key = "w", mods = "OPT", timeout_milliseconds = 1000 }

return config
