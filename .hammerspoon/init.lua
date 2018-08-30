-- Automatic reload of configuration on saves
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Settings
local hyper = {"alt", "shift"}
hs.grid.setMargins({0, 0})
hs.grid.setGrid("8x4")

hs.window.animationDuration = 0

-- hs.hotkey.bind(hyper, "g", function() hs.grid.toggleShow() end)

gs = hs.hotkey.modal.new(hyper, "m", "Grid move")
gs:bind("", "escape", function() gs:exit() end)

local gridMoverMap = {
    push_left=hs.grid.pushWindowLeft,
    push_right=hs.grid.pushWindowRight,
    push_up=hs.grid.pushWindowUp,
    push_down=hs.grid.pushWindowDown,
    resize_left=hs.grid.resizeWindowThinner,
    resize_right=hs.grid.resizeWindowWider,
    resize_up=hs.grid.resizeWindowShorter,
    resize_down=hs.grid.resizeWindowTaller,
}

local gridHandler = function(direction, resize)
    local resize = resize or false
    local win = hs.window.focusedWindow()
    if resize then
        gridMoverMap["resize_" .. direction](win)
    else
        gridMoverMap["push_" .. direction](win)
    end
end

gs:bind("", "left", function() gridHandler("left", false) end)
gs:bind("", "right", function() gridHandler("right", false) end)
gs:bind("", "up", function() gridHandler("up", false) end)
gs:bind("", "down", function() gridHandler("down", false) end)
gs:bind({"shift"}, "left", function() gridHandler("left", true) end)
gs:bind({"shift"}, "right", function() gridHandler("right", true) end)
gs:bind({"shift"}, "up", function() gridHandler("up", true) end)
gs:bind({"shift"}, "down", function() gridHandler("down", true) end)

gs:bind("", "h", function() gridHandler("left", false) end)
gs:bind("", "l", function() gridHandler("right", false) end)
gs:bind("", "k", function() gridHandler("up", false) end)
gs:bind("", "j", function() gridHandler("down", false) end)
gs:bind({"shift"}, "h", function() gridHandler("left", true) end)
gs:bind({"shift"}, "l", function() gridHandler("right", true) end)
gs:bind({"shift"}, "k", function() gridHandler("up", true) end)
gs:bind({"shift"}, "j", function() gridHandler("down", true) end)

hs.hotkey.bind(hyper, "f", function()
    hs.window.focusedWindow():maximize(0)
end)

ls = hs.hotkey.modal.new(hyper, "l", "Layouts")
ls:bind("", "escape", function() ls:exit() end)
-- IM layout
ls:bind("", "i", function()
    -- Apply this to the focused window
    local fw = hs.window.focusedWindow():screen()
    hs.layout.apply({
        {"Telegram", nil, fw, hs.layout.left25, nil, nil},
        {"Slack", nil, fw, hs.layout.right75, nil, nil}
    })
end)

-- Center on screen
hs.hotkey.bind(hyper, "c", function()
    local win = hs.window.focusedWindow()
    local max = win:screen():frame()
    local s = 3 / 4
    win:setSize({w=(max.w * s), h=(max.h * s)})
    win:centerOnScreen()
end)

hs.hints.style = "vimperator"
hs.hotkey.bind({"alt", "shift"}, "h", hs.hints.windowHints)