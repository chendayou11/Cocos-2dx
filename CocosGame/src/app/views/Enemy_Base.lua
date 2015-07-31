--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/24
-- Time: 9:35
-- To change this template use File | Settings | File Templates.
--
local Enemy_Base=class("Enemy_Base",function(image)
    local sprite=cc.Sprite:create(image)
    sprite:setScale(0.5)
    return sprite
    end)
function Enemy_Base:ctor(image,Enemy_Layer)
    self.speed=10
    self.health=100
    self:moveAI()
    self.Enemy_Layer=Enemy_Layer
end
function Enemy_Base:moveAI()
    local x=math.random(-500,500)
    self:setPosition(display.cx+x,display.height)
    local move=cc.MoveBy:create(3,cc.p(x,-display.height))
    local fun=cc.CallFunc:create(handler(self,self.removeNode))
    local seq=cc.Sequence:create(move,fun)
    self:runAction(seq)
end
function Enemy_Base:removeNode(node)
    self.Enemy_Layer:removeNode(node)
    node:removeSelf()
-- 调用逻辑
end
return Enemy_Base