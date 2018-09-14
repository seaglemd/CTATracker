--------------------------------------------------------------------------------
--This class allows for the creation of individual frame objects, each objects
--represents a call to arms dungeon frame that is displayed in the addon Window.
--These are dynamically created within the addon
--------------------------------------------------------------------------------
CTATracker_DungeonFrame = {
  Frame = "",
  ButtonFrame = "",
  dungeonFrameName = "",
  buttonFrameName = "",
  xpos = 0,
  ypos = 0,
  setFrame = function(self, Frame)
    self.Frame = Frame
  end,
  setButtonFrame = function(self, ButtonFrame)
    self.ButtonFrame = ButtonFrame
  end,
  setDungeonFrameName = function(self, dungeonFrameName)
    self.dungeonFrameName = dungeonFrameName
  end,
  setButtonFrameName = function(self, buttonFrameName)
    self.buttonFrameName = buttonFrameName
  end,
  xpos = function(self, xpos)
    self.xpos = xpos
  end,
  ypos = function(self, ypos)
    self.ypos = ypos
  end,
  new = function(self, o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
  end
}
