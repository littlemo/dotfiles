--- === WindowScreenMove ===
---
--- Move windows to other screens
---
--- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/WindowScreenMove.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/WindowScreenMove.spoon.zip)

local obj={}
obj.__index = obj

-- Metadata
obj.name = "WindowScreenMove"
obj.version = "0.1"
obj.author = "Moore Huang <moore.hy@qq.com>"
obj.homepage = "https://github.com/littlemo/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

--- WindowScreenMove.logger
--- Variable
--- Logger object used within the Spoon. Can be accessed to set the default log level for the messages coming from the Spoon.
obj.logger = hs.logger.new('WindowScreenMove')

--- WindowScreenMove.defaultHotkeys
--- Variable
--- Table containing a sample set of hotkeys that can be
--- assigned to the different operations. These are not bound
--- by default - if you want to use them you have to call:
--- `spoon.WindowScreenMove:bindHotkeys(spoon.WindowScreenMove.defaultHotkeys)`
--- after loading the spoon. Value:
--- ```
---  {
---     screen_left = { {"ctrl", "alt", "cmd"}, "Left" },
---     screen_right= { {"ctrl", "alt", "cmd"}, "Right" },
---     screen_up   = { {"ctrl", "alt", "cmd"}, "Up" },
---     screen_down = { {"ctrl", "alt", "cmd"}, "Down" },
---  }
--- ```
obj.defaultHotkeys = {
   screen_left = { {"ctrl", "alt", "cmd"}, "Left" },
   screen_right= { {"ctrl", "alt", "cmd"}, "Right" },
   screen_up   = { {"ctrl", "alt", "cmd"}, "Up" },
   screen_down = { {"ctrl", "alt", "cmd"}, "Down" },
}

--- WindowScreenMove.animationDuration
--- Variable
--- Length of the animation to use for the window movements across the
--- screens. `nil` means to use the existing value from
--- `hs.window.animationDuration`. 0 means to disable the
--- animations. Default: `nil`.
obj.animationDuration = nil

-- Internal functions to store/restore the current value of setFrameCorrectness and animationDuration
local function _setFC()
  obj._savedFC = hs.window.setFrameCorrectness
  obj._savedDuration = hs.window.animationDuration
  hs.window.setFrameCorrectness = obj.use_frame_correctness
  if obj.animationDuration ~= nil then
    hs.window.animationDuration = obj.animationDuration
  end
end

local function _restoreFC()
  hs.window.setFrameCorrectness = obj._savedFC
  if obj.animationDuration ~= nil then
    hs.window.animationDuration = obj._savedDuration
  end
end

-- Move current window to a different screen
function obj.moveCurrentWindowToScreen(how)
   local win = hs.window.focusedWindow()
   if win == nil then
      return
   end
   _setFC()
   if how == "left" then
      win:moveOneScreenWest()
   elseif how == "right" then
      win:moveOneScreenEast()
   elseif how == "up" then
      win:moveOneScreenNorth()
   elseif how == "down" then
      win:moveOneScreenSouth()
   end
   _restoreFC()
end

-- --------------------------------------------------------------------
-- Shortcut functions for those above, for the hotkeys
-- --------------------------------------------------------------------

obj.oneScreenLeft  = hs.fnutils.partial(obj.moveCurrentWindowToScreen, "left")
obj.oneScreenRight = hs.fnutils.partial(obj.moveCurrentWindowToScreen, "right")
obj.oneScreenUp    = hs.fnutils.partial(obj.moveCurrentWindowToScreen, "up")
obj.oneScreenDown  = hs.fnutils.partial(obj.moveCurrentWindowToScreen, "down")

--- WindowScreenMove:bindHotkeys(mapping)
--- Method
--- Binds hotkeys for WindowScreenMove
---
--- Parameters:
---  * mapping - A table containing hotkey objifier/key details for the following items:
---   * screen_left, screen_right, screen_up, screen_down - move the window to the left/right/up/down screen (if you have more than one monitor connected, does nothing otherwise)
function obj:bindHotkeys(mapping)
   local hotkeyDefinitions = {
      screen_left  = self.oneScreenLeft,
      screen_right = self.oneScreenRight,
      screen_up    = self.oneScreenUp,
      screen_down  = self.oneScreenDown,
   }
   hs.spoons.bindHotkeysToSpec(hotkeyDefinitions, mapping)
   return self
end

return obj
