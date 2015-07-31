--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/27
-- Time: 15:33
-- To change this template use File | Settings | File Templates.
--
local Bezier=class("Bizer",function(image)
    local sprite=cc.Sprite:create(image)
    return sprite end)
function Bezier:ctor(image,Enemy_Layer)
    self.Enemy_Layer=Enemy_Layer
end
function Bezier:bizer()
    local bezier=cc.BezierConfig()
    bezier.controlPoint_1=cc.p(200,display.height)
    bezier.controlPoint_2=cc.p(-200,0)
    bezier.endPosition=cc.p(300,0)

    local forward=cc.BezierBy:create(5,bezier)
    local back=forward:reverser()
    local repe=cc.RepertForever:create(cc.Sequence:create(forward,back))
end
function Bezier:moveBiz(node)
    self.Enemy_Layer:removeNode(node)
    node:removeSelf()
end
return Bezier
