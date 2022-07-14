local M = {}
local popup = require("plenary.popup")

WinId = 0

M.create = function(str, y, x)
  if y > 1 then
    y = y - 1
  else
    y = y + 1
  end
  WinId = popup.create(str, {
    line = y,
    col =  x,
  });
end 

M.remove = function()
  if WinId > 0 then
    local bufId = vim.api.nvim_win_get_buf(WinId)
    vim.api.nvim_buf_delete(bufId, { force = true })
    WinId = 0
  end
end

return M
