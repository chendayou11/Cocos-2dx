--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/24
-- Time: 9:26
-- To change this template use File | Settings | File Templates.
--
local Enemy_Layer=class("Enemy",cc.Layer)
local Enemy_Base=import(".Enemy_Base")
local Bezier=import(".Bezier")
function Enemy_Layer:ctor()
    self.enemys={}
    local timer=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.createEnemy),0.7,false)
end
function Enemy_Layer:createEnemy()
    local random_1=math.random(1,3)
    if random_1==3 then
        local plane_1=Bezier:create("plane_"..random_1..".png",self)
        print("fhasflfsaljf;jasdfjasl;dfjlasdf")
    else
    local plane_1=Enemy_Base:create("plane_"..random_1..".png",self)
    self:addChild(plane_1)
    self.enemys[plane_1]=plane_1
    end
end
function Enemy_Layer:removeNode(node)
    self.enemys[node]=nil
end
return Enemy_Layer
