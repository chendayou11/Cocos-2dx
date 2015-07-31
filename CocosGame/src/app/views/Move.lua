--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/21
-- Time: 9:14
-- To change this template use File | Settings | File Templates.
--
local Move=class("Move",cc.Layer)
function Move:ctor()
local bg1=cc.Sprite:create("img_bg_level_1.jpg")
     bg1:move(display.cx,display.cy)
     bg1:setScaleX(2.2)
     self:addChild(bg1)

local bg2=cc.Sprite:create("img_bg_level_1.jpg")
     bg2:move(display.cx,display.cy)
     bg2:setPositionY(bg1:getPositionY()+bg1:getContentSize().height)
     bg2:setScaleX(2.2)
     self:addChild(bg2)
     self.bg1=bg1
     self.bg2=bg2


function Move:callback()
     local y1=self.bg1:getPositionY()
     local y2=self.bg2:getPositionY()
     self.bg1:setPositionY(y1-2)
     self.bg2:setPositionY(y1+self.bg1:getContentSize().height-2)
     if self.bg1:getPositionY()== -self.bg1:getContentSize().height/2 then
          self.bg1:setPositionY(self.bg1:getContentSize().height/2)
     end
end
local schedular=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.callback),0.01,false)
end
return Move

