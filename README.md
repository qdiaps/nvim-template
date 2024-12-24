# nvim-template

`nvim-template` is a simple Neovim plugin that allows you to insert text templates at your cursor
position. Templates are stored as plain text files in a specified directory

## Table of Contents

* [Installation](#installation)
* [Configuration](#configuration)
* [Usage](#usage)
* [TODO](#todo)

---

## Installation

### Lazy

```lua
require("lazy").setup({
    "qdiaps/nvim-template",
)}
```

---

## Configuration

### Options

* `templates_path` - path to the template directory

### Default

```lua
require("nvim-template").setup({
    -- ~/.config/nvim/templates/
    templates_path = vim.fn.stdpath("config") .. "/templates/",
}
```

---

## Usage

To use the plugin, follow these steps:
1. Create template files in the folder specified in the `templates_path` field. Use the file name as
   identifier. For example `lua_func`
2. Add the desired content to the template file.
```lua_func
local function name()
    -- logic
end
```
3. Use the command `:Template <template_name>` to insert the template where your cursor is.
Example: `:Template lua_func`
4. The plugin automatically alings the template with the current indetation level.

---

## TODO

Here are some planned features and improvements for `nvim-template`:
* [ ] Substitution of values:
Support for `%$1` type placeholders, when inserting them, the cursor moves to the placeholder
position, allowing you to enter custom values (e.g. function names).
* [ ] Template preview:
Add a feature to preview templates before inserting them.
* [ ] Dynamic template variables:
Allow predefined variables like `%date%`, `%author%`, or custom ones to be replaced automatically
when the template is inserted.
