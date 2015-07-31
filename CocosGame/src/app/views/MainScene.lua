
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    -- add background image
    display.newSprite("bg.jpg")
        :move(display.center)
        :addTo(self)

    -- add play button
    local playButton = cc.MenuItemImage:create("playbt1.jpg", "playbt2.jpg")
        :onClicked(function()
            self:getApp():enterScene("Game")
        end)
    cc.Menu:create(playButton)
        :move(display.cx, display.cy - 200)
        :addTo(self)
    local feiji=cc.Sprite:create("plane_1.png")
    :move(display.center)
    :addTo(self)
end

return MainScene
