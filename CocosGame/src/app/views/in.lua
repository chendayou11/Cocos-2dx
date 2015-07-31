--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/24
-- Time: 9:50
-- To change this template use File | Settings | File Templates.
--

function Bullet:uplane_1()
    -- local plane_1=cc.Sprite:create("plane_1.png")
    plane_1:setScale(0.5)
    self:addChild(plane_1)
    self.plane_1[plane_1]=plane_1
    plane_1:setPosition(display.cx,display.height)
    local move=cc.MoveBy:create(1,cc.p(80,-display.height))
    local fun=cc.CallFunc:create(handler(self,self.removeNode))
    local seq=cc.Sequence:create(move,fun)
    plane_1:runAction(seq)
    table.insert(self.plane_1,plane_1)
end
function Bullet:uplane_2()
    local plane_2=cc.Sprite:create("plane_2.png")
    plane_2:setPosition(display.cx+200,display.height)
    self:addChild(plane_2)
    self.plane_2[plane_2]=plane_2
    local move=cc.MoveBy:create(1,cc.p(-100,-display.height))
    local fun=cc.CallFunc:create(handler(self,self.removeNode))
    local seq=cc.Sequence:create(move,fun)
    plane_2:runAction(seq)
    table.insert(self.plane_2,plane_2)
end
function Bullet:uplane_3()
    local plane_3=cc.Sprite:create("plane_3.png")
    plane_3:setPosition(display.cx,2*display.height)
    self:addChild(plane_3)
    self.plane_3[plane_3]=plane_3
    local move=cc.MoveBy:create(4,cc.p(0,-display.height*2))
    local fun=cc.CallFunc:create(handler(self,self.removeNode))
    local seq=cc.Sequence:create(move,fun)
    plane_3:runAction(seq)
    table.insert(self.plane_3,plane_3)
end
function Bullet:jiancha()
    for kb,vb in pairs(self.bullets) do
        for kp,vp in pairs(self.plane_1) do
            local rect=cc.rect(0,0,vb:getContentSize().width,vb:getContentSize().height)

            if cc.rectContainsPoint(rect,prect) then
                vb:removeFromParent()
            end
        end
    end
endfunction Bullet:sendbullet()   --定时器定义子弹的运动
    self.bullet:setPosition(self.plane.plane:getPositionX(),self.plane.plane:getPositionY())
end
local schedular=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.sendbullet),0.5,false)
self:scheduleUpdate(handler(self,self.step))
end
function Bullet:step(t)
self.bullet:setPositionY(self.bullet:getPositionY()+22)

end
return in