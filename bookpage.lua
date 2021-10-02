-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

--local journal_sentence = GGData:new("sentence.txt")

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	-- go to level1.lua scene
	local journal_sentence = GGData:new("sentence.txt")
	composer.gotoScene( journal_sentence.nextlevel, "fade", 500 )
	--composer.gotoScene( "menu", "fade", 500 )
	
	return true	-- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	journal_playable.status = 'unplayable'
	journal_playable:save()

	-- display a background image
	local background = display.newImageRect( "background.jpg", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
	background.alpha = 0.3
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImage( "assets/book_heading.png", 264, 42 )
	titleLogo.x = display.contentCenterX
	titleLogo.y = 30
	titleLogo:scale(0.8, 0.8)
	
	-- create a widget button (which will loads level1.lua on release)
	playBtn = widget.newButton{
		label = "Next Level",
		labelColor = { default={ 1.0 }, over={ 0.5 } },
		defaultFile = "button.png",
		overFile = "button-over.png",
		width = 100, height = 30,
		onRelease = onPlayBtnRelease	-- event listener function
	}
	playBtn.x = display.contentCenterX
	playBtn.y = display.contentHeight - 35
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( playBtn )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	


	
	--- Opening up a new journal, for the completed sentence here.
	local journal_sentence = GGData:new("sentence.txt")


	--[[
		--- Sentence Label
		local sentence_label = display.newText( "SENTENCE: " , 100, 200, native.systemFontBold, 14 )
		sentence_label.alpha = 1
		sentence_label:setFillColor( 250, 250, 250 )
		sentence_label.x = 75
		sentence_label.y = 75
		sceneGroup:insert(sentence_label)
		--]]

		local journal_sentence = GGData:new("sentence.txt")
		-- journal_sentence.complete1

		local first_sentence_display = display.newText( journal_sentence.complete1, 100, 200, native.systemFontBold, 16 )
		first_sentence_display.alpha = 1
		first_sentence_display:setFillColor( 250, 250, 250 )
		first_sentence_display.x = 45
		first_sentence_display.y = 75
		sceneGroup:insert(first_sentence_display)

		local second_sentence_display = display.newText( journal_sentence.complete2, 100, 200, native.systemFontBold, 16 )
		second_sentence_display.alpha = 1
		second_sentence_display:setFillColor( 250, 250, 250 )
		second_sentence_display.x = 45
		second_sentence_display.y = 105
		sceneGroup:insert(second_sentence_display)

		local third_sentence_display = display.newText( journal_sentence.complete3, 100, 200, native.systemFontBold, 16 )
		third_sentence_display.alpha = 1
		third_sentence_display:setFillColor( 250, 250, 250 )
		third_sentence_display.x = 45
		third_sentence_display.y = 135
		sceneGroup:insert(third_sentence_display)

		local fourth_sentence_display = display.newText( journal_sentence.complete4, 100, 200, native.systemFontBold, 16 )
		fourth_sentence_display.alpha = 1
		fourth_sentence_display:setFillColor( 250, 250, 250 )
		fourth_sentence_display.x = 45
		fourth_sentence_display.y = 165
		sceneGroup:insert(fourth_sentence_display)

		local fifth_sentence_display = display.newText( journal_sentence.complete5, 100, 200, native.systemFontBold, 16 )
		fifth_sentence_display.alpha = 1
		fifth_sentence_display:setFillColor( 250, 250, 250 )
		fifth_sentence_display.x = 45
		fifth_sentence_display.y = 195
		sceneGroup:insert(fifth_sentence_display)


--[[
		--- Forming the sentence in the tray below, starting with the first word.
		local first_word = display.newText( journal_sentence.first, 100, 200, native.systemFontBold, 16 )
		first_word.alpha = 1
		first_word:setFillColor( 250, 250, 250 )
		first_word.x = 0
		first_word.y = 75
		sceneGroup:insert(first_word)

		--- Forming the sentence in the tray below, starting with the first word.
		local second_word = display.newText( journal_sentence.second, 100, 200, native.systemFontBold, 16 )
		second_word.alpha = 1
		second_word:setFillColor( 250, 250, 250 )
		second_word.x = 45
		second_word.y = 75
		sceneGroup:insert(second_word)

		--- Forming the sentence in the tray below, starting with the first word.
		local third_word = display.newText( (journal_sentence.third) .. ("."), 100, 200, native.systemFontBold, 16 )
		third_word.alpha = 1
		third_word:setFillColor( 250, 250, 250 )
		third_word.x = 90
		third_word.y = 75
		sceneGroup:insert(third_word)

		--]]


		function sentence_updater(event)
			first_word.text = journal_sentence.first
			second_word.text = journal_sentence.second
			third_word.text = journal_sentence.third .. (".")
		end

end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
