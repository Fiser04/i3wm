-- Set runtime path for local colorscheme
vim.opt.rtp:append("~/.config/nvim/lua/")

-- Load the modified colorscheme
local status_ok, theme = pcall(require, "theme.darkearth")
if not status_ok then
    vim.notify("Failed to load darkearth colorscheme")
    return
end

-- Apply the colorscheme
local lush = require("lush")
lush(theme)
