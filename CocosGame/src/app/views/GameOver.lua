--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/28
-- Time: 9:56
-- To change this template use File | Settings | File Templates.
--
local GameOver=class("GameOver",cc.load"mvc".ViewBase)
function GameOver:onCreate()
    local bg=cc.Sprite:create("bg.jpg")
    :move(display.center)
    :addTo(self)
    --local label=cc.LabelTTF:create("GameOver","Marker Felt",48)
  --  self:addChild(label)
    local ExitButton=cc.MenuItemImage:create("ExitButton.png","ExitButton.png")
    :onClicked(function()
    self:getApp():enterScene()
    end)
    cc.Menu:create(ExitButton)
    :move(display.center)
    :addTo(self)
    self:sorce()
end
function GameOver:sorce()
    local text
    text=cc.Label:create()
    text:setString("YOU GET:")
    text:setSystemFontSize(50)
    text:setSystemFontName("source")
    text:setTextColor(cc.c4b(0,0,255,13))
    text:setPosition(display.cx,display.cy+200)
    self:addChild(text)

end
return GameOver

