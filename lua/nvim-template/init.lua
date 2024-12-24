local M = {}

M.config = {
    templates_path = vim.fn.stdpath("config") .. "/templates/",
}

function M.setup(config)
    M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

local function read_template(name)
    local path = M.config.templates_path .. name
    local file = io.open(path, "r")
    if not file then
        vim.notify("Template not found: " .. name, vim.log.levels.ERROR)
        return nil
    end

    local content = file:read("*a")
    file:close()
    return content
end

local function insert_template(content, indent)
    local lines = vim.split(content, "\n")
    for i, line in ipairs(lines) do
        lines[i] = indent .. line
    end
    vim.api.nvim_put(lines, "c", true, true)
end

function M.insert(name)
    local content = read_template(name)
    if not content then return end

    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local current_line = vim.api.nvim_get_current_line()
    local indent = current_line:sub(1, col):match("^%s*") or ""

    insert_template(content, indent)
end

return M
