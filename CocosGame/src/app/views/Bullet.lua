--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/22
-- Time: 10:59
-- To change this template use File | Settings | File Templates.
--
local Bullet=class("Bullet",cc.Layer)
function Bullet:ctor(plane)
    self.plane=plane
    self.bullets={}

    local timeId=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.movebullet),0.4,false)

end
function Bullet:movebullet()
    local bullet=cc.Sprite:create("bullet.png")
    bullet:setScale(0.4)
    self:addChild(bullet)
    bullet:setPosition(self.plane.plane:getPositionX(),self.plane.plane:getPositionY())
    self.bullets[bullet]=bullet
    local move=cc.MoveBy:create(1,cc.p(0,display.height))
    local fun=cc.CallFunc:create(handler(self,self.removeNode))
    local seq=cc.Sequence:create(move,fun)
    bullet:runAction(seq)
end
function Bullet:removeNode(node)
    self.bullets[node]=nil
    node:removeSelf()
end
return Bullet

