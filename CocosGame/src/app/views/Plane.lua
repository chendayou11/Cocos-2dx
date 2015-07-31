--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/21
-- Time: 15:05
-- To change this template use File | Settings | File Templates.
--
--重写点击事件
    --创建监听
    --注册监听
--注册点击事件
local Plane=class("Plane",cc.Layer)
function Plane:ctor()
    local plane=cc.Sprite:create("player.png")
        plane:setPosition(display.cx,display.cy-180)
        self:addChild(plane,50)
        plane:setScale(0.5)
        self.plane=plane

    --touoch event
    local listener=cc.EventListenerTouchOneByOne:create()
        listener:registerScriptHandler(handler(self,self.TouchBegin),cc.Handler.EVENT_TOUCH_BEGAN)
        listener:registerScriptHandler(handler(self,self.TouchMove),cc.Handler.EVENT_TOUCH_MOVED)
        listener:registerScriptHandler(handler(self,self.TouchEnd),cc.Handler.EVENT_TOUCH_ENDED)
    local dispatch=self:getEventDispatcher()
        dispatch:addEventListenerWithSceneGraphPriority(listener,plane)
end
function Plane:TouchBegin(touch,event)
    local target=event:getCurrentTarget()
    local worldpoint=touch:getLocation()
    local localpoint=target:convertToNodeSpace(worldpoint)
    local size=target:getContentSize()
    local rect=cc.rect(0,0,size.width,size.height)

    if cc.rectContainsPoint(rect,localpoint) then
        return true
        end
    return false
end
function Plane:TouchMove(touch,event)
    self.plane:setPosition(touch:getLocation())
end
function Plane:TouchEnd(touch,event)
    self.plane:setPosition(touch:getLocation())
end
function Plane:removePlane()
    self.removeSelf()
end

return Plane

