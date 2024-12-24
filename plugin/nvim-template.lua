vim.api.nvim_create_user_command(
    "Template",
    function () require("nvim-template").print_hello() end,
    { desc = "Print hello world" }
)
