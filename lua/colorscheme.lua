local colorscheme = "carbonfox"

local status_ok, _= pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 😥 没找到捏 ")
  return
end
