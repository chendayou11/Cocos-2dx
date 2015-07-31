--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/24
-- Time: 13:57
-- To change this template use File | Settings | File Templates.
--
local Creak=class("Creak",cc.Layer)
function Creak:ctor(enemy,bullet)
    self.enemy=enemy
    self.bullet=bullet
    --self:scheduleUpdate(handler(self,self.pengzhuang))
function Creak:pengzhuang()
    for kb,vb in pairs(self.bullet.bullets) do
        for ke,ve in pairs(self.enemy.enemys) do
            local rect=ve:getBoundingBox()
            if cc.rectContainsPoint(rect,cc.p(vb:getPosition())) then
            --if cc.rectIntersectsRect(rect,bullet) then
                print("ffsadfasdfasdfasfdsa")
                vb:removeFromParent()
                ve:removeFromParent()
                end
        end
        end
end
end
return Creak
