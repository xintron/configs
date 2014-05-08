// Configs

S.cfga({
    // Default action to he current screen
    "defaultToCurrentScreen": true,
    "keyboardLayout": "dvorak"
});

// Center windows on screen
var full = S.op("move", {
    "x": "screenOriginX",
    "y": "screenOriginY",
    "width": "screenSizeX",
    "height": "screenSizeY"
});

var base = S.op("move", {
    "x": "screenOriginX",
    "y": "screenOriginY",
    "width": "windowSizeX",
    "height": "windowSizeY"
});
var pushLeft = base.dup({
    "y": "(screenSizeY-windowSizeY)/2"
});
var pushRight = base.dup({
    "y": "(screenSizeY-windowSizeY)/2",
    "x": "screenSizeX-windowSizeX"
});
var pushFullRight = base.dup({
    "x": "screenSizeX-windowSizeX",
    "y": "screenOriginY",
    "height": "screenSizeY"
});
var pushFullLeft = base.dup({
    "height": "screenSizeY"
});

var center = base.dup({
    "x": "(screenSizeX-windowSizeX)/2",
    "y": "(screenSizeY-windowSizeY)/2"
});
var centerHalf = base.dup({
    "x": "screenSizeX/4",
    "y": "screenSizeY/4",
    "width": "screenSizeX/2",
    "height": "screenSizeY/2"
});

var cornerTR = S.op("corner", { "direction": "top-right", });
var cornerTL = S.op("corner", { "direction": "top-left", });
var cornerBR = S.op("corner", { "direction": "bottom-right", });
var cornerBL = S.op("corner", { "direction": "bottom-left", });

S.bnda({
    // Reload config
    "r:ctrl;shift": S.op("relaunch"),
    "f:ctrl;shift": full,
    "c:ctrl;shift": center,
    "c:alt;shift": centerHalf,
    //"c:ctrl;shift": center,
    "g:alt;shift": cornerTR,
    "p:alt;shift": cornerTL,
    "m:alt;shift": cornerBR,
    "k:alt;shift": cornerBL,

    "right:ctrl": pushRight,
    "left:ctrl": pushLeft,
    "right:ctrl;shift": pushFullRight,
    "left:ctrl;shift": pushFullLeft,

    "esc:ctrl": S.op("grid")
});
