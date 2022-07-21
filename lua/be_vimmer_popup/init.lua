local M = {}
local popup = require("plenary.popup")

WinId = 0

M.getPos = function()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local absolute_pos = vim.fn.screenpos(0, cursor_pos[1], cursor_pos[2])
  return absolute_pos["row"], absolute_pos["col"]
end

M.create = function(str)
  local win_id = vim.api.nvim_get_current_win()
  local y, x = M.getPos()
  if y > 1 then
    y = y - 1
  else
    y = y + 1
  end
  -- str = string.format("%s %d %d %d", str, y, x, win_id)
  WinId = popup.create(str, {
    line = y,
    col =  x+1,
    highlight = "WarningMsg"
  });
  vim.api.nvim_set_current_win(win_id)
end

M.remove = function()
  if WinId > 0 then
    local bufId = vim.api.nvim_win_get_buf(WinId)
    vim.api.nvim_buf_delete(bufId, { force = true })
    WinId = 0
  end
end

return M
