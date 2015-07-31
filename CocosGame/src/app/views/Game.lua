--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/7/21
-- Time: 9:14
-- To change this template use File | Settings | File Templates.
--
local Game=class("Game",cc.load("mvc").ViewBase)
local bgm=import(".Move")
local plane=import(".Plane")
local cloud=import(".Cloud")
local bullet=import(".Bullet")
local enemy=import(".Enemy_Layer")
local blood=import(".Blood")
--ocal creak=import(".Creak")
function Game:onCreate()
    self.bg=bgm:create()
    self:addChild(self.bg)

    self.plane=plane:create()
    self:addChild(self.plane)

    self.bullet=bullet:create(self.plane)
    self:addChild(self.bullet)

    self.enemy=enemy:create()
    self:addChild(self.enemy)

    self.cloud=cloud:create()
    self:addChild(self.cloud)

    self.blood=blood:create()
    self:addChild(self.blood)

    self:su()
    self:scheduleUpdate(handler(self,self.peng))
   -- local sum=0
   -- self.sum=sum
end
function Game:peng()

    for k, v in pairs(self.bullet.bullets) do
        for k1, v1 in pairs(self.enemy.enemys) do
             local enemy=v1:getBoundingBox()
            if cc.rectIntersectsRect(v:getBoundingBox(),enemy) then
                print("pengzhuang")
                --local animation = cc.AnimationCache:getInstance():getAnimation("ENEMYBOOM")
                --local animate = cc.Animate:create(animation) v1:runAction(animate)
                self.bullet:removeNode(v)  --子弹层上删除子弹
                v1:removeNode(v1)
               -- self.sum=self.sum+1
                --self:scheduleUpdate(handler(self,self.su))
                --self:runAction(callback)
                break
            end
        end
    end
    local rect=self.plane.plane:getBoundingBox()
    for kp,vp in pairs(self.enemy.enemys) do
        local erect=vp:getBoundingBox()
        if cc.rectIntersectsRect(rect,erect) then
            print("feiji")
           -- self.plane:removePlane()
            vp:removeNode(vp)
            break
        end
    end
end
function Game:su()
    local text_source=cc.Label:create()
    text_source:setString("SOURCE:")
    text_source:setSystemFontSize(20)
    text_source:setSystemFontName("Courier")
    text_source:setTextColor(cc.c4b(255,0,0,10))
    text_source:setPosition(display.cx,display.height-25)
    self:addChild(text_source)
end
return Game
