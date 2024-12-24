local M = {}

function M.print_hello()
    vim.notify("Hello world", vim.log.levels.INFO)
end

return M
