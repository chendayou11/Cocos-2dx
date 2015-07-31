--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/21
-- Time: 15:26
-- To change this template use File | Settings | File Templates.
--
local Cloud=class("Cloud",cc.Layer)
function Cloud:ctor()
    local cloud_1=cc.Sprite:create("img_cloud_1.png")
    cloud_1:setPosition(display.cx-250,-100)
    cloud_1:setScale(0.5)
    self:addChild(cloud_1)
    local cloud_2=cc.Sprite:create("img_cloud_2.png")
    cloud_2:setPosition(display.cx+150,display.cy)
    cloud_2:setScale(0.5)
    self:addChild(cloud_2)

 function Cloud:callback()
     local winSize = cc.Director:getInstance():getWinSize()
    local y=cloud_1:getPositionY()
    cloud_1:setPositionY(y+0.5)
    if cloud_1:getPositionY() >winSize.height
    then
    cloud_1:setPositionY(-200)
    end
end
    local scheduler=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.callback),0.05,false)
end
return Cloud
