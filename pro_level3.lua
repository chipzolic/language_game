--- Note, this level uses three different word lists, these are present in the software root folder...
--- The three lists are named as follows 'names', 'verbs', 'objects'

local composer = require( "composer" )
local scene = composer.newScene()
local physics = require "physics"
local journal = GGData:new("numbers.txt")

journal_playable.status = 'playable'
journal_playable:save()

--- Requiring the three external word sheets.
local names = require("names")
local verbs = require("verbs")
local objects = require("objects")

--- Resetting the sentence journal, so that previously formed sentences are not shown, on fresh level load. 
local journal_sentence = GGData:new("sentence.txt")
journal_sentence.first = ''
journal_sentence.second = ''
journal_sentence.third = ''
journal_sentence.fourth = ''
journal_sentence:save()

local click_counter = 1

function next_scene(event)
    composer.gotoScene( "menu", {effect = "slideLeft", time = "1200"});
	Runtime:removeEventListener( "mouse", onMouseEvent )
end

function next_level(event)
    composer.gotoScene( "level2_quad_redux", {effect = "slideLeft", time = "1200"});
	Runtime:removeEventListener( "mouse", onMouseEvent )
end

--------------------------------------------
-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

local journal = GGData:new("numbers.txt")
journal.alphabet = 'b'
journal:save()

local journal_combined = GGData:new("combined.txt")
journal_combined.masterword = ''
journal_combined:save()

--- This function is fired everytime you click your mouse, it generates a random number, that number in turn generates a random alphabet, which are used to form words.
function converter(event)
	local journal = GGData:new("numbers.txt")
	
	if journal.number == 1 then journal.alphabet = 'a' print (journal.alphabet)
	 elseif journal.number == 2 then journal.alphabet = 'b' print (journal.alphabet)
	 elseif journal.number == 3 then journal.alphabet = 'c' print (journal.alphabet)
	 elseif journal.number == 4 then journal.alphabet = 'd' print (journal.alphabet)
	 elseif journal.number == 5 then journal.alphabet = 'e' print (journal.alphabet)
	 elseif journal.number == 6 then journal.alphabet = 'f' print (journal.alphabet)
	 elseif journal.number == 7 then journal.alphabet = 'g' print (journal.alphabet)
	 elseif journal.number == 8 then journal.alphabet = 'h' print (journal.alphabet)
	 elseif journal.number == 9 then journal.alphabet = 'i' print (journal.alphabet)
	 elseif journal.number == 10 then journal.alphabet = 'j' print (journal.alphabet)
	 elseif journal.number == 11 then journal.alphabet = 'k' print (journal.alphabet)
	 elseif journal.number == 12 then journal.alphabet = 'l' print (journal.alphabet)
	 elseif journal.number == 13 then journal.alphabet = 'm' print (journal.alphabet)
	 elseif journal.number == 14 then journal.alphabet = 'n' print (journal.alphabet)
	 elseif journal.number == 15 then journal.alphabet = 'o' print (journal.alphabet)
	 elseif journal.number == 16 then journal.alphabet = 'p' print (journal.alphabet)
	 elseif journal.number == 17 then journal.alphabet = 'q' print (journal.alphabet)
	 elseif journal.number == 18 then journal.alphabet = 'r' print (journal.alphabet)
	 elseif journal.number == 19 then journal.alphabet = 's' print (journal.alphabet)
	 elseif journal.number == 20 then journal.alphabet = 't' print (journal.alphabet)
	 elseif journal.number == 21 then journal.alphabet = 'u' print (journal.alphabet)
	 elseif journal.number == 22 then journal.alphabet = 'v' print (journal.alphabet)
	 elseif journal.number == 23 then journal.alphabet = 'w' print (journal.alphabet)
	 elseif journal.number == 24 then journal.alphabet = 'x' print (journal.alphabet)
	 elseif journal.number == 25 then journal.alphabet = 'y' print (journal.alphabet)
	 elseif journal.number == 26 then journal.alphabet = 'z' print (journal.alphabet)
		
	 else
	end

	journal:save()

end

--- This function generates a random number from 1 to 26, because theres 26 letters in the alphabet, then, it triggers the convertor function above.
function randomizer(event)
	local my_number = math.random( 1, 26 )

	local journal = GGData:new("numbers.txt")
	journal.number = my_number
	journal:save()

	converter()

end


function buttonHit(event)
	journal_playable.status = 'unplayable'
	journal_playable:save()
	timer.cancel( core_runner3x )
    composer.gotoScene( event.target.goto, {effect = "slideLeft", time = "1200"});
	Runtime:removeEventListener( "mouse", onMouseEvent )
end


function level_2_loader(event)
    composer.gotoScene( 'level2_quad_redux', {effect = "slideLeft", time = "1200"});
	Runtime:removeEventListener( "mouse", onMouseEvent )
end


    
local journal_combined = GGData:new("combined.txt")

function counter_reset(event)
    click_counter = 1
end


local tmp_letter1 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
tmp_letter1:setFillColor( 350, 450, 750 )
tmp_letter1.x = 25
tmp_letter1.y = 275
tmp_letter1.alpha = 0

local tmp_letter2 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
tmp_letter2:setFillColor( 350, 450, 750 )
tmp_letter2.x = 45
tmp_letter2.y = 275
tmp_letter2.alpha = 0

local tmp_letter3 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
tmp_letter3:setFillColor( 350, 450, 750 )
tmp_letter3.x = 65
tmp_letter3.y = 275
tmp_letter3.alpha = 0

local tmp_letter4 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
tmp_letter4:setFillColor( 350, 450, 750 )
tmp_letter4.x = 85
tmp_letter4.y = 275
tmp_letter4.alpha = 0


function clear_temp_letters(event)
    tmp_letter1.alpha = 0
end



-- Called when a mouse event has been received.
local function onMouseEvent( event )
--local function automata(event)
	if event.isPrimaryButtonDown and event.type ~= "drag" then
		click_counter = click_counter + 1
		print (click_counter)

		local journal = GGData:new("numbers.txt")

		local letter = display.newImage("assets/" .. (journal.alphabet) .. ".png")
		letter.x = event.x
		letter.y = event.y
		letter:scale(0.2, 0.2)
		physics.addBody( letter, { density=1.0, friction=0.3, bounce=0.3 } )

		                ------------ Cleaning the produced letter from the screen after 1 second of existance ------------------
						function letter_clean(event)
							transition.to(letter, { time=500, alpha=0, x=letter.x, y=letter.y + 100 })
						end
						timer.performWithDelay( 500, letter_clean, 1 )
						--------------------------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------------------------------------------------
		--- THE CACHE LETTER APPROACH. :)
		--- Creating a new journal for this.
		local journal_quick = GGData:new("quick.txt")

			if click_counter == 2 then

				-- local tmp_letter1 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
				tmp_letter1.text = journal.alphabet
				tmp_letter1:setFillColor( 350, 450, 750 )
				tmp_letter1.x = 25
				tmp_letter1.y = 275
				tmp_letter1.alpha = 1

				local formed_word = ((tmp_letter1.text) .. (tmp_letter2.text) .. (tmp_letter3.text) .. (tmp_letter4.text)) 
				print(formed_word)

				journal_quick.formed = formed_word
				journal_quick:save()

			elseif click_counter == 3 then

				-- local tmp_letter2 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
				tmp_letter2.text = journal.alphabet
				tmp_letter2:setFillColor( 350, 450, 750 )
				tmp_letter2.x = 45
				tmp_letter2.y = 275
				tmp_letter2.alpha = 1

				local formed_word = ((tmp_letter1.text) .. (tmp_letter2.text) .. (tmp_letter3.text) .. (tmp_letter4.text))
				print(formed_word)

				journal_quick.formed = formed_word
				journal_quick:save()

			elseif click_counter == 4 then

				--local tmp_letter3 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
				tmp_letter3.text = journal.alphabet
				tmp_letter3:setFillColor( 350, 450, 750 )
				tmp_letter3.x = 65
				tmp_letter3.y = 275
				tmp_letter3.alpha = 1

			local formed_word = ((tmp_letter1.text) .. (tmp_letter2.text) .. (tmp_letter3.text) .. (tmp_letter4.text))
			print(formed_word)

			journal_quick.formed = formed_word
			journal_quick:save()

		elseif click_counter == 5 then

			--local tmp_letter4 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
			tmp_letter4.text = journal.alphabet
			tmp_letter4:setFillColor( 350, 450, 750 )
			tmp_letter4.x = 85
			tmp_letter4.y = 275
			tmp_letter4.alpha = 1
			-- sceneGroup:insert( tmp_letter1 )

			counter_reset()
			
			local formed_word = ((tmp_letter1.text) .. (tmp_letter2.text) .. (tmp_letter3.text) .. (tmp_letter4.text))
			print(formed_word)

			journal_quick.formed = formed_word
			journal_quick:save()

			else
			end
		----------------------------------------------------------------------------------------------------------------------------------
		
		audio.play(pop)
		randomizer()

	else
	end

end

----------------------------------------------- AUTOMATION BLOCK FOR TESTING ONLY -----------------------------------------------------------------
function automata(event)

	if 1 == 1 then
		click_counter = click_counter + 1
		print (click_counter)

		local journal = GGData:new("numbers.txt")

		local letter = display.newImage("assets/" .. (journal.alphabet) .. ".png")
		letter.x = event.x
		letter.y = event.y
		letter:scale(0.2, 0.2)
		physics.addBody( letter, { density=1.0, friction=0.3, bounce=0.3 } )

		----------------------------------------------------------------------------------------------------------------------------------
		--- THE CACHE LETTER APPROACH. :)
		--- Creating a new journal for this.
		local journal_quick = GGData:new("quick.txt")

			if click_counter == 2 then

				-- local tmp_letter1 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
				tmp_letter1.text = journal.alphabet
				tmp_letter1:setFillColor( 350, 450, 750 )
				tmp_letter1.x = 25
				tmp_letter1.y = 275
				tmp_letter1.alpha = 1

				local formed_word = ((tmp_letter1.text) .. (tmp_letter2.text) .. (tmp_letter3.text) .. (tmp_letter4.text)) 
				print(formed_word)

				journal_quick.formed = formed_word
				journal_quick:save()

			elseif click_counter == 3 then

				-- local tmp_letter2 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
				tmp_letter2.text = journal.alphabet
				tmp_letter2:setFillColor( 350, 450, 750 )
				tmp_letter2.x = 45
				tmp_letter2.y = 275
				tmp_letter2.alpha = 1

				local formed_word = ((tmp_letter1.text) .. (tmp_letter2.text) .. (tmp_letter3.text) .. (tmp_letter4.text))
				print(formed_word)

				journal_quick.formed = formed_word
				journal_quick:save()

			elseif click_counter == 4 then

				--local tmp_letter3 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
				tmp_letter3.text = journal.alphabet
				tmp_letter3:setFillColor( 350, 450, 750 )
				tmp_letter3.x = 65
				tmp_letter3.y = 275
				tmp_letter3.alpha = 1

			local formed_word = ((tmp_letter1.text) .. (tmp_letter2.text) .. (tmp_letter3.text) .. (tmp_letter4.text))
			print(formed_word)

			journal_quick.formed = formed_word
			journal_quick:save()

		elseif click_counter == 5 then

			--local tmp_letter4 = display.newText( journal.alphabet, 100, 200, "zcool.ttf", 16 )
			tmp_letter4.text = journal.alphabet
			tmp_letter4:setFillColor( 350, 450, 750 )
			tmp_letter4.x = 85
			tmp_letter4.y = 275
			tmp_letter4.alpha = 1
			-- sceneGroup:insert( tmp_letter1 )

			counter_reset()
			
			local formed_word = ((tmp_letter1.text) .. (tmp_letter2.text) .. (tmp_letter3.text) .. (tmp_letter4.text))
			print(formed_word)

			journal_quick.formed = formed_word
			journal_quick:save()

			else
			end
		----------------------------------------------------------------------------------------------------------------------------------
		
		audio.play(pop)
		randomizer()

	else
	end


end


-- local automation = timer.performWithDelay( 200, automata, 0) 

----------------------------------------------- END / AUTOMATION BLOCK FOR TESTING ONLY -----------------------------------------------------------------


function scene:create( event )

	local sceneGroup = self.view
	physics.start()
	physics.pause()

	journal_playable.status = 'playable'
    journal_playable:save()

	--- Initiating it
	local mwshow = display.newText( journal_combined.masterword, 100, 200, "zcool.ttf", 14 )
	mwshow.alpha = 0

	function sentence_former(event)
		-- Opening up the Combined word journal here
		local journal_combined = GGData:new("combined.txt")
		local firstword = journal_combined.masterword
		print (firstword)

	end

	--- Opening up a new journal, for the completed sentence here.
	local journal_sentence = GGData:new("sentence.txt")

	--- Another journal, for managing the boolean values.
	local journal_conditions = GGData:new("conditions.txt")
	journal_conditions.first_element_fulfilled = ("false")
	journal_conditions.second_element_fulfilled = ("false")
	journal_conditions.third_element_fulfilled = ("false")
	journal_conditions.fourth_element_fulfilled = ("false")
	journal_conditions:save()

		--- The 'Sentence formed' label asset that pops up when you've formed a real sentence!
		local senotif = display.newImage( "assets/sentence_notify.png" )
		senotif.x = 250
		senotif.y = 275
		senotif.alpha = 0
		senotif:scale(0.9, 0.9)
		sceneGroup:insert(senotif)


	function notifyreset(event)
		senotif.x = 250
		senotif.y = 275
		senotif.alpha = 0
	end
	
	function sentence_notify_function(event)
		senotif.alpha = 1
		transition.to(senotif, { time=14500, alpha=1.0, x=senotif.x, y=senotif.y - 1500, onComplete=notifyreset})
		-- audio.play(notify)
	end

	function bool_reset_function(event)
		function bool_reset_now(event)
			journal_conditions.first_element_fulfilled = "false"
			journal_conditions.second_element_fulfilled = "false"
			journal_conditions.third_element_fulfilled = "false"
			journal_conditions.fourth_element_fulfilled = "false"
			journal_conditions:save()
		end
		timer.performWithDelay( 1200, bool_reset_now, 1 )

		timer.resume( core_runner2x )
	end

	local background = display.newImage( "assets/space_pro3.png" )
	background.x = 145
	background.y = 145
	background:scale(0.25,0.25)
	background.alpha = 0.5
	sceneGroup:insert(background)

	local background2 = display.newImage( "assets/objects3.png" )
	background2.x = 185
	background2.y = 145
	background2.alpha = 0.5
	background2:scale(0.2,0.2)
	sceneGroup:insert(background2)

    sceneGroup:insert( tmp_letter1 )
    sceneGroup:insert( tmp_letter2 )
    sceneGroup:insert( tmp_letter3 )

			--- The score variable, initiating it here, when your score is at 3, the four letter words unlock! (Sentences stay at three word sentences for now...)
			local score = 6

				local score_label = display.newText( "SCORE: ", 100, 200, "zcool.ttf", 13 )
				score_label:setFillColor( 250, 250, 250 )
				score_label.alpha = 1;
				score_label.x = 50;
				score_label.y = 15
				sceneGroup:insert( score_label )

			local score_text = display.newText( score, 100, 200, "zcool.ttf", 14 )
			score_text:setFillColor( 250, 250, 250 )
			score_text.alpha = 1;
			score_text.x = 85;
			score_text.y = 15;
			sceneGroup:insert( score_text )
	
	
						--- The 4 Letter Word Unlock Sprite
						local unlock1 = display.newImage( "assets/unlock1.png" )
						unlock1.x = 250
						unlock1.y = 275
						unlock1.alpha = 0
						unlock1:scale(0.9, 0.9)
						sceneGroup:insert(unlock1)


						--- The grammar rules unlock sprite
						local unlock2 = display.newImage( "assets/unlock2.png" )
						unlock2.x = 250
						unlock2.y = 275
						unlock2.alpha = 0
						unlock2:scale(0.9, 0.9)
						sceneGroup:insert(unlock2)

	
				function unlock1reset(event)
					unlock1.x = 250
					unlock1.y = 275
					unlock1.alpha = 0	
                    next_scene()
				end

				function unlock2reset(event)
					unlock2.x = 250
					unlock2.y = 275
					unlock2.alpha = 0
                    next_scene()
				end
	
	
				function unlock1_notify_function(event)
					
					function unlock1_func(event)
						unlock1.alpha = 1
						transition.to(unlock1, { time=6500, alpha=1.0, x=unlock1.x, y=unlock1.y - 1500, onComplete=unlock1reset})
						audio.play(notify)

                        score_label.alpha = 0
                        score_text.alpha = 0
					end

					timer.performWithDelay( 1800, unlock1_func, 1 )
				end


				function unlock2_notify_function(event)
					
					function unlock2_func(event)
						unlock2.alpha = 1
						transition.to(unlock2, { time=6500, alpha=1.0, x=unlock2.x, y=unlock2.y - 1500, onComplete=unlock2reset})
						audio.play(notify)
					end

					timer.performWithDelay( 1500, unlock2_func, 1 )
				end


				function unlock3_notify_function(event)
					
					function unlock3_func(event)
						--unlock2.alpha = 1
						--transition.to(unlock2, { time=6500, alpha=1.0, x=unlock2.x, y=unlock2.y - 1500, onComplete=unlock2reset})
						--audio.play(notify)
						next_scene()
					end

					timer.performWithDelay( 1500, unlock3_func, 1 )
				end


--- Declaring here as a forward reference, so that upon sentence completion, we can remove this object
local first_word = display.newText( journal_sentence.first, 100, 200, "zcool.ttf", 16 )
local second_word = display.newText( journal_sentence.second, 100, 200, "zcool.ttf", 16 )
local third_word = display.newText( (journal_sentence.third) .. ("."), 100, 200, "zcool.ttf", 16 )


--- Initiating it here.
local journal_quick = GGData:new("quick.txt")
journal_quick.formed = 'xxxx'
journal_quick:save()


function finder2(event)

	local journal_quick = GGData:new("quick.txt")
	local capture2 = string.find(verbs_pro1, journal_quick.formed)
	print ("ALSO FIRING FINDER 2!!!")
	if capture2 ~= nil then
	
		local sentence_element_2 = journal_quick.formed
		journal_conditions.second_element_fulfilled = "true"
		journal_conditions:save()
		journal_sentence.second = sentence_element_2
		journal_sentence:save()

		score = score + 1
		score_text.text = score

			---------------------------------------------------
			--- Flow control.
			timer.pause( core_runner2x )
			timer.pause( core_runner3x )

				function timer_resume3(event)
					timer.resume( core_runner3x )
				end

			timer.performWithDelay( 6000, timer_resume3, 1 )
			---------------------------------------------------

	else
	end

end


function finder3(event)

	local journal_quick = GGData:new("quick.txt")
	local capture3 = string.find(objects_pro1, journal_quick.formed)
	print ("ALSO FIRING FINDER 3!!!")
	if capture3 ~= nil then

		local sentence_element_3 = journal_quick.formed
		journal_conditions.third_element_fulfilled = "true"
		journal_conditions:save()
		journal_sentence.third = sentence_element_3
		journal_sentence:save()

		score = score + 1
		score_text.text = score

			------------ Saving the third complete sentence, in the journal. ----------
			local complete_sentence_3 = (  (journal_sentence.first) .. (" ") .. (journal_sentence.second) .. (" ") .. (journal_sentence.third) .. (".")  )
			journal_sentence.complete3 = complete_sentence_3
			journal_sentence.nextlevel = "menu"
			journal_sentence:save()
			----------------------------------------------------------------------------

		bool_reset_function()
		-- Runtime:removeEventListener( "mouse", onMouseEvent )
		---------------------------------------------------
		--- Flow control.
		timer.pause( core_runner4x )
		---------------------------------------------------

				if score == 9 then
					unlock3_notify_function();
				else
				end

			function sentence_clear(event)
				--- Resetting the sentence journal, so that recently formed sentences are not shown constantly.
				local journal_sentence = GGData:new("sentence.txt")
				journal_sentence.first = ''
				journal_sentence.second = ''
				journal_sentence.third = ''
				journal_sentence:save()

				first_word.alpha = 0
				second_word.alpha = 0
				third_word.alpha = 0
			end

		timer.performWithDelay( 2000, sentence_clear, 1 )

		else
		end

end


 --- The finder function!
    function finder(event)
		print ("ALSO FIRING FINDER 1!!!")

		local journal_quick = GGData:new("quick.txt")
		local capture = string.find(quad_names, journal_quick.formed)

			if capture ~= nil then
				print (capture) 
				print ("Found it!")
				audio.play(found)

				--- Matched word show!
				--local mwshow = display.newText( journal_combined.masterword, 100, 200, "zcool.ttf", 14 )
				mwshow:setFillColor( 250, 250, 250 )
				mwshow.alpha = 1;
				mwshow.x = 425
				mwshow.y = 15
				sceneGroup:insert( mwshow )
			
				mwshow.text = journal_quick.formed

					--------------------- Doing the work required for displaying the complete SENTENCE.
					if journal_conditions.first_element_fulfilled == "false" then

						local sentence_element_1 = journal_quick.formed
						journal_conditions.first_element_fulfilled = "true"
						journal_conditions:save()
						journal_sentence.first = sentence_element_1
						journal_sentence:save()

						score = score + 1
						score_text.text = score

						---------------------------------------------------
						--- Flow control.
						timer.pause( core_runner2x )

							function timer_resume1(event)
								timer.resume( core_runner2x )
							end

						timer.performWithDelay( 4000, timer_resume1, 1 )
						---------------------------------------------------


					elseif journal_conditions.first_element_fulfilled == "true" and journal_conditions.second_element_fulfilled == "false" then

						finder2()


					elseif journal_conditions.second_element_fulfilled == "true" and journal_conditions.third_element_fulfilled == "false" then
					
						finder3()


					---- No matching word found, this exectues.
					elseif capture == nil then

						function mshow_updater(event)
							mwshow.text = journal_combined.masterword
						end
				
					else
					end

	end
end

	_G.core_runner2x = timer.performWithDelay( 300, finder, 0 ) 
	_G.core_runner3x = timer.performWithDelay( 300, finder2, 0 )
	_G.core_runner4x = timer.performWithDelay( 300, finder3, 0 ) 

	local book_icon = display.newImage( "assets/book.png" )
	book_icon.x = 490
	book_icon.y = 290
	book_icon.alpha = 0
	book_icon:scale(0.025,0.025)
	book_icon.goto = "menu"
	book_icon:addEventListener("tap", buttonHit);
	sceneGroup:insert(book_icon)

	----------------------------------- Moving the bg elements up and down, these functions handle that ----------------------
		function bg_reset(event)
			transition.to(background2, { time=18500, alpha=0.7, x=background2.x, y=background2.y + 75, onComplete=bg_mover})
		end

		function bg_mover(event)
			transition.to(background2, { time=18500, alpha=0.5, x=background2.x, y=background2.y - 75, onComplete=bg_reset})
		end

		bg_mover()
	---------------------------------------------------------------------------------------------------------------------------
					--- Sentence Label
					local sentence_label = display.newText( "SENTENCE: " , 100, 200, "zcool.ttf", 16 )
					--local displayText = display.newText( "Hello World", 150, 80, "zcool.ttf", 24 )
					sentence_label.alpha = 1
					sentence_label:setFillColor( 250, 250, 250 )
					sentence_label.x = 185
					sentence_label.y = 300
					sceneGroup:insert(sentence_label)

					--- Forming the sentence in the tray below, starting with the first word.
					--local first_word = display.newText( journal_sentence.first, 100, 200, "zcool.ttf", 16 )
					first_word.alpha = 1
					first_word:setFillColor( 250, 250, 250 )
					first_word.x = 255
					first_word.y = 300
					sceneGroup:insert(first_word)

					--- Forming the sentence in the tray below, starting with the first word.
					--local second_word = display.newText( journal_sentence.second, 100, 200, "zcool.ttf", 16 )
					second_word.alpha = 1
					second_word:setFillColor( 250, 250, 250 )
					second_word.x = 300
					second_word.y = 300
					sceneGroup:insert(second_word)

					--- Forming the sentence in the tray below, starting with the first word.
					--local third_word = display.newText( (journal_sentence.third) .. ("."), 100, 200, "zcool.ttf", 16 )
					third_word.alpha = 1
					third_word:setFillColor( 250, 250, 250 )
					third_word.x = 345
					third_word.y = 300
					sceneGroup:insert(third_word)

										--- Forming the sentence in the tray below, starting with the first word.
										local fourth_word = display.newText( (journal_sentence.fourth) .. ("."), 100, 200, "zcool.ttf", 16 )
										fourth_word.alpha = 1
										fourth_word:setFillColor( 250, 250, 250 )
										fourth_word.x = 390
										fourth_word.y = 300
										sceneGroup:insert(fourth_word)


					function sentence_updater(event)
						first_word.text = journal_sentence.first
						second_word.text = journal_sentence.second
						third_word.text = journal_sentence.third
						fourth_word.text = journal_sentence.fourth .. (".")
					end



					timer.performWithDelay( 1000, sentence_updater, 0)

	--- Marched word label!	
	local mwlabel = display.newText( "WORD MATCHED:  ", 100, 200, "zcool.ttf", 12 )
	mwlabel:setFillColor( 950, 0, 150 )
	mwlabel.x = 350
	mwlabel.y = 15
	sceneGroup:insert( mwlabel )

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
		physics.start()

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
		physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
		Runtime:removeEventListener( "mouse", onMouseEvent )
	end	
	
end


function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )

-----------------------------------------------------------------------------------------

return scene