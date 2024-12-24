vim.api.nvim_create_user_command(
    "Template",
    function(opts)
        require("nvim-template").insert(opts.args)
    end,
    {
        nargs = 1,
        desc = "Insert a template at the current cursor position"
    }
)
