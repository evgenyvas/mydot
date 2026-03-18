return {
  name = "go build",
  builder = function()
    local file = vim.fn.expand("%:p")
    local cmd = { file }
    if vim.bo.filetype == "go" then
      cmd = { "go", "build", file }
    end
    return {
      cmd = cmd,
      -- add some components that will pipe the output to quickfix,
      -- parse it using errorformat, and display any matching lines as diagnostics.
      components = {
        "default",
        "unique",
        { "on_output_quickfix", set_diagnostics = true, open = true },
        { "on_result_diagnostics", remove_on_restart = true },
        { "on_result_diagnostics_quickfix", set_empty_results = true },
      },
    }
  end,
  condition = {
    filetype = { "go" }
  },
}
