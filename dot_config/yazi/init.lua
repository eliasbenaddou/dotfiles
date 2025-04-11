-- DuckDB plugin configuration
require("duckdb"):setup({
  mode = "standard",            -- Default: "summarized"
  row_id = false,             -- Default: false
  minmax_column_width = 21,                  -- Default: 21
  column_fit_factor = 10                  -- Default: 10.0
})
