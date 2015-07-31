--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/27
-- Time: 16:13
-- To change this template use File | Settings | File Templates.
--
local Blood=class("Blood",cc.Layer)
function Blood:ctor()
    local blood=cc.Sprite:create("Star.png")
    blood:move(20,display.height-20)
    self:addChild(blood)
end
return Blood

