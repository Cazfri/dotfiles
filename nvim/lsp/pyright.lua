return {
  root_dir = function(bufnr, on_dir)
    on_dir(vim.fs.root(bufnr, { "uv.lock" }) or vim.fs.root(bufnr, { "pyproject.toml", "setup.py", ".git" }))
  end,
  before_init = function(_, config)
    local venv = config.root_dir and config.root_dir .. "/.venv/bin/python"
    if not (venv and vim.uv.fs_stat(venv)) then return end
    local settings = config.settings
    if not settings then
      config.settings = { python = { pythonPath = venv } }
      return
    end
    settings.python = vim.tbl_deep_extend("force", settings.python or {}, { pythonPath = venv })
  end,
}
