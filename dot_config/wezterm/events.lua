local wezterm = require("wezterm")
local mux = wezterm.mux

-- Maximize Window on GUI Startup
-- This event ensures that when WezTerm starts, the first window opens in maximized mode
wezterm.on("gui-startup", function()
  local _, _, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

-- Dynamic Font Size Adjustment
-- Adjusts font size dynamically when the window resizes to minimize bottom padding
function readjust_font_size(window, pane)
  local window_dims = window:get_dimensions()
  local pane_dims = pane:get_dimensions()

  -- Initial font size to start adjustments from
  local config_overrides = {}
  local initial_font_size = 13
  config_overrides.font_size = initial_font_size

  -- Limit adjustments to prevent infinite loops
  local max_iterations = 5
  local iteration_count = 0

  -- Allowable difference between window and pane height
  local tolerance = 3

  -- Track the best font size with minimal padding
  local current_diff = window_dims.pixel_height - pane_dims.pixel_height
  local min_diff = math.abs(current_diff)
  local best_font_size = initial_font_size

  -- Iteratively adjust font size to minimize padding at the bottom
  while current_diff > tolerance and iteration_count < max_iterations do
    wezterm.log_info(
      string.format(
        "Win Height: %d, Pane Height: %d, Height Diff: %d, Curr Font Size: %.2f, Cells: %d, Cell Height: %.2f",
        window_dims.pixel_height,
        pane_dims.pixel_height,
        window_dims.pixel_height - pane_dims.pixel_height,
        config_overrides.font_size,
        pane_dims.viewport_rows,
        pane_dims.pixel_height / pane_dims.viewport_rows
      )
    )

    -- Increase font size slightly and apply the new config
    config_overrides.font_size = config_overrides.font_size + 0.5
    window:set_config_overrides(config_overrides)

    -- Update dimensions after changing font size
    window_dims = window:get_dimensions()
    pane_dims = pane:get_dimensions()
    current_diff = window_dims.pixel_height - pane_dims.pixel_height

    -- Track the best font size with the smallest height difference
    local abs_diff = math.abs(current_diff)
    if abs_diff < min_diff then
      min_diff = abs_diff
      best_font_size = config_overrides.font_size
    end

    iteration_count = iteration_count + 1
  end

  -- If an optimal font size was found, apply it
  if current_diff > tolerance then
    config_overrides.font_size = best_font_size
    window:set_config_overrides(config_overrides)
  end
end
