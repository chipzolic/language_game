-----------------------------------------------------------------------------------------
-- main.lua
-----------------------------------------------------------------------------------------
GGData = require("GGData")

_G.journal_playable = GGData:new("playable.txt")
journal_playable.status = 'playable'
journal_playable:save()

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

notify = audio.loadSound("assets/found.wav")
pop = audio.loadSound("assets/pop.wav")
found = audio.loadSound("assets/score.wav")

ui1 = audio.loadSound("assets/ui1.wav")
ui2 = audio.loadSound("assets/ui2.wav")

-- include the Corona "composer" module
local composer = require "composer"

-- load menu screen
composer.gotoScene( "menu" )
--composer.gotoScene( "bookpage" )
--composer.gotoScene( "bookpage_menuversion" )
--composer.gotoScene( "pro_level1" )
--composer.gotoScene( "pro_level2" )
--composer.gotoScene( "pro_level3" )

