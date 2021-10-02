local composer = require( "composer" )
local scene = composer.newScene()
local physics = require "physics"
local journal = GGData:new("numbers.txt")

journal_playable.status = 'playable'
journal_playable:save()

--- Resetting the sentence journal, so that previously formed sentences are not shown, on fresh level load. 
local journal_sentence = GGData:new("sentence.txt")
journal_sentence.first = ''
journal_sentence.second = ''
journal_sentence.third = ''
journal_sentence.fourth = ''
journal_sentence:save()

local click_counter = 1


function next_scene(event)
    composer.gotoScene( "bookpage", {effect = "slideLeft", time = "1200"});
    --letter.alpha = 0
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
	timer.cancel( core_runner2 )
    composer.gotoScene( event.target.goto, {effect = "slideLeft", time = "1200"});
	Runtime:removeEventListener( "mouse", onMouseEvent )
end


function level_3_loader(event)
    composer.gotoScene( 'pro_level3', {effect = "slideLeft", time = "1200"});
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



-------------------------------- AUTOMATA BLOCK, FOR TESTING ONLY -----------------------------------

        -- Called when a mouse event has been received.
        local function automata( event )
			if 1 == 1 --[[ event.isPrimaryButtonDown and event.type ~= "drag" --]] then

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

	  ---------------------------------------------

--	  local automation = timer.performWithDelay( 500, automata, 0) 



function scene:create( event )

	local sceneGroup = self.view
	physics.start()
	physics.pause()

	journal_playable.status = 'playable'
    journal_playable:save()

	--- This is our list of four letter words, everytime you click the mouse, this list is scanned to see if a four letter word has been formed randomly, that also exists within this list.
	local quad_list = [[
        aahs
		abbe
		abbr
		abed
		abet
		able
		ably
		abut
		acct
		aced
		aces
		ache
		achy
		acid
		aclu
		acme
		acne
		acre
		acts
		adam
		adds
		adit
		ados
		advt
		aeon
		aery
		afar
		afro
		agar
		aged
		ages
		agha
		agin
		agog
		ague
		ahem
		ahoy
		aide
		aids
		ails
		aims
		airs
		airy
		ajar
		akin
		alai
		alan
		alar
		alas
		alba
		albs
		alee
		ales
		alfa
		alga
		alii
		alit
		alls
		ally
		alma
		alms
		aloe
		alps
		also
		alto
		alum
		amah
		amen
		amex
		amid
		amis
		ammo
		amok
		amps
		amyl
		anal
		ands
		anew
		anis
		ankh
		anna
		anne
		anno
		anon
		ansi
		ante
		anti
		ants
		anus
		aped
		aper
		apes
		apex
		apse
		aqua
		arab
		arch
		arco
		arcs
		area
		ares
		aria
		arid
		arks
		arms
		army
		arse
		arts
		arty
		arum
		asap
		asea
		ashy
		asia
		asks
		asps
		assn
		asst
		atma
		atom
		atop
		attn
		atty
		auks
		auld
		aunt
		aura
		auto
		avdp
		aver
		aves
		avid
		avis
		avow
		away
		awed
		awes
		awls
		awns
		awol
		awry
		axed
		axel
		axes
		axil
		axis
		axle
		axon
		ayah
		ayes
		baal
		baas
		baba
		babe
		babu
		baby
		bach
		back
		bade
		bads
		bags
		baht
		bail
		bait
		bake
		bald
		bale
		bali
		balk
		ball
		balm
		band
		bane
		bang
		bank
		bans
		barb
		bard
		bare
		barf
		bark
		barn
		bars
		base
		bash
		bask
		bass
		bast
		bate
		bath
		bats
		baud
		bawd
		bawl
		bays
		bdrm
		bead
		beak
		beam
		bean
		bear
		beat
		beau
		beck
		beds
		beef
		been
		beep
		beer
		bees
		beet
		begs
		bell
		belt
		bema
		bend
		bene
		bens
		bent
		berg
		berm
		bess
		best
		beta
		bete
		bets
		bevy
		beys
		bias
		bibs
		bide
		bids
		bier
		biff
		bike
		bile
		bilk
		bill
		bind
		bins
		biol
		bios
		bird
		bite
		bits
		blab
		blah
		blat
		bldg
		bled
		blew
		blip
		blob
		bloc
		blot
		blow
		blue
		blur
		blvd
		boar
		boas
		boat
		bobs
		boca
		bock
		bode
		bods
		body
		boer
		boff
		bogs
		bogy
		boil
		bola
		bold
		bole
		boll
		bolo
		bolt
		bomb
		bona
		bond
		bone
		bong
		bono
		bons
		bony
		boob
		book
		boom
		boon
		boor
		boos
		boot
		bops
		bore
		born
		bort
		bosh
		boss
		both
		bout
		bowl
		bows
		boxy
		boyo
		boys
		bozo
		brad
		brae
		brag
		bran
		bras
		brat
		braw
		bray
		bred
		brew
		brie
		brig
		brim
		brin
		brio
		brit
		bros
		brow
		brut
		bubo
		bubs
		buck
		buds
		buff
		bugs
		bulb
		bulk
		bull
		bump
		bums
		bund
		bung
		bunk
		bunn
		buns
		bunt
		buoy
		burg
		burl
		burn
		burp
		burr
		burs
		bury
		bush
		buss
		bust
		busy
		buts
		butt
		buys
		buzz
		byes
		byre
		byte
		cabs
		cads
		cafe
		cage
		cagy
		cake
		caky
		calc
		calf
		calk
		call
		calm
		calx
		came
		camp
		cams
		cane
		cans
		cant
		cape
		caps
		card
		care
		carl
		carp
		cars
		cart
		casa
		case
		cash
		cask
		cast
		cats
		caul
		cave
		cavy
		caws
		cays
		ceca
		cede
		cees
		ceil
		cell
		celt
		cent
		cert
		cess
		chad
		cham
		chap
		char
		chat
		chaw
		chef
		chem
		chew
		chez
		chia
		chic
		chid
		chin
		chip
		chit
		chop
		chou
		chow
		chub
		chug
		chum
		ciao
		cine
		circ
		cite
		city
		clad
		clam
		clan
		clap
		claw
		clay
		clef
		clew
		clip
		clod
		clog
		clop
		clot
		cloy
		club
		clue
		cmdg
		coal
		coat
		coax
		cobs
		cock
		coco
		coda
		code
		cods
		coed
		cogs
		coho
		coif
		coil
		coin
		coir
		coke
		cola
		cold
		cole
		coll
		colt
		coma
		comb
		come
		comp
		cone
		conf
		conj
		conk
		conn
		cons
		cont
		cony
		cook
		cool
		coon
		coop
		coos
		coot
		cope
		cops
		copy
		cord
		core
		cork
		corm
		corn
		corp
		cosh
		cost
		cosy
		cote
		cots
		coup
		cove
		cowl
		cows
		cozy
		crab
		crag
		cram
		crap
		craw
		cree
		crew
		crib
		crop
		crow
		crud
		crux
		ctrl
		cuba
		cube
		cubs
		cuds
		cued
		cues
		cuff
		cuke
		cull
		cult
		cunt
		cups
		curb
		curd
		cure
		curl
		curs
		curt
		cusp
		cuss
		cute
		cuts
		cyan
		cyme
		cyst
		czar
		dabs
		dace
		dada
		dado
		dads
		daft
		dago
		dais
		dale
		dame
		damn
		damp
		dams
		dana
		dane
		dang
		dank
		dare
		dark
		darn
		dart
		dash
		data
		date
		daub
		dave
		dawn
		days
		daze
		dbms
		dead
		deaf
		deal
		dean
		dear
		debs
		debt
		deck
		deco
		deed
		deem
		deep
		deer
		dees
		deft
		defy
		deja
		dele
		deli
		dell
		demo
		dens
		dent
		deny
		dept
		derm
		desk
		deus
		deux
		deva
		dews
		dewy
		dhow
		diag
		dial
		diam
		dias
		dibs
		dice
		dick
		dict
		dido
		didy
		died
		diem
		dies
		diet
		digs
		dike
		dill
		dime
		dims
		dine
		ding
		dins
		dint
		dips
		dipt
		dire
		dirk
		dirt
		disc
		dish
		disk
		diva
		dive
		djin
		dock
		docs
		dodo
		doer
		does
		doff
		doge
		dogs
		dogy
		dojo
		dole
		doll
		dolt
		dome
		doms
		dona
		done
		dong
		dons
		doom
		door
		dope
		dopy
		dorm
		dorp
		dors
		dory
		dose
		doss
		dost
		dote
		doth
		dots
		doty
		dour
		dove
		down
		dows
		doxy
		doze
		dozy
		drab
		drag
		dram
		drat
		draw
		dray
		dreg
		drek
		drew
		drib
		drip
		drop
		drub
		drug
		drum
		drys
		duad
		dual
		dubs
		duce
		duck
		duct
		dude
		duds
		duel
		dues
		duet
		duff
		dugs
		duke
		dull
		duly
		dumb
		dump
		dune
		dung
		dunk
		duns
		duos
		dupe
		durn
		dusk
		dust
		duty
		dyad
		dyed
		dyer
		dyes
		dyke
		dyne
		each
		earl
		earn
		ears
		ease
		east
		easy
		eats
		eaux
		eave
		ebbs
		ebon
		eccl
		echo
		ecol
		econ
		ecru
		ecus
		edam
		edda
		eddy
		eden
		edge
		edgy
		edit
		eels
		eely
		eery
		effs
		efts
		egad
		eggs
		egis
		egos
		eire
		eked
		ekes
		elan
		elds
		elhi
		elks
		ells
		elms
		elmy
		else
		emir
		emit
		emmy
		emus
		encl
		ends
		engr
		enow
		envy
		eons
		epee
		epic
		eras
		erat
		ergo
		ergs
		erie
		erin
		erne
		erns
		eros
		errs
		erst
		eses
		espy
		esse
		etch
		etna
		etym
		even
		ever
		eves
		evil
		ewer
		ewes
		exam
		exec
		exes
		exit
		expo
		eyed
		eyer
		eyes
		face
		fact
		fade
		fads
		fags
		fail
		fain
		fair
		fait
		fake
		fall
		fame
		fang
		fans
		fare
		farm
		faro
		fart
		fast
		fate
		fats
		faun
		faut
		faux
		fawn
		fays
		faze
		fear
		feat
		feds
		feed
		feel
		fees
		feet
		fell
		felt
		fend
		fens
		fern
		fess
		feta
		fete
		feud
		fiat
		fibs
		fica
		fide
		fido
		fids
		fief
		fife
		figs
		fiji
		file
		fill
		film
		find
		fine
		fink
		finn
		fins
		fire
		firm
		firs
		fish
		fist
		fits
		five
		fixe
		fizz
		flab
		flag
		flak
		flan
		flap
		flat
		flaw
		flax
		flay
		flea
		fled
		flee
		flew
		flex
		flip
		flit
		floe
		flog
		flop
		flow
		flub
		flue
		flus
		flux
		foal
		foam
		fobs
		foci
		foes
		fogs
		fogy
		foil
		fold
		folk
		fond
		font
		food
		fool
		foot
		fops
		fora
		ford
		fore
		fork
		form
		fort
		foul
		four
		fowl
		foxy
		frag
		frat
		frau
		fray
		fred
		free
		fret
		frig
		friz
		frog
		from
		frow
		frug
		fuck
		fuds
		fuel
		fugs
		fuji
		full
		fume
		fumy
		fund
		funk
		furl
		furs
		fury
		fuse
		fuss
		fuze
		fuzz
		gabs
		gads
		gaff
		gaga
		gage
		gags
		gain
		gait
		gala
		gale
		gall
		gals
		game
		gams
		gamy
		gang
		gaol
		gape
		gaps
		gapy
		garb
		gars
		gary
		gash
		gasp
		gate
		gats
		gaud
		gave
		gawk
		gays
		gaze
		gear
		geed
		geek
		gees
		geld
		gels
		gelt
		gems
		gene
		gens
		gent
		geog
		geol
		geom
		germ
		gets
		geum
		ghat
		ghee
		gibe
		gibs
		gift
		gigs
		gila
		gild
		gill
		gilt
		gimp
		gins
		gips
		gird
		girl
		girt
		gist
		give
		glad
		glee
		glen
		glib
		glim
		glob
		glom
		glop
		glow
		glue
		glum
		glut
		gnat
		gnaw
		gnus
		goad
		goal
		goat
		gobs
		goby
		gods
		goer
		goes
		gogo
		gold
		golf
		gone
		gong
		good
		goof
		gook
		goon
		goop
		goos
		gore
		gory
		gosh
		goth
		gout
		govt
		gown
		goys
		grab
		grad
		gram
		gras
		gray
		grew
		grey
		grid
		grim
		grin
		grip
		grit
		grog
		grot
		grow
		grub
		guam
		guar
		guck
		guff
		gulf
		gull
		gulp
		gums
		gung
		gunk
		guns
		guru
		gush
		gust
		guts
		guys
		gyms
		gyps
		gyre
		gyro
		gyve
		hack
		hadj
		haft
		hags
		hahs
		hail
		hair
		haji
		hajj
		hake
		hale
		half
		hall
		halo
		halt
		hams
		hand
		hang
		hank
		haps
		hard
		hare
		hark
		harm
		harp
		hart
		hash
		hasp
		hast
		hate
		hath
		hats
		haul
		have
		hawk
		haws
		hays
		haze
		hazy
		head
		heal
		heap
		hear
		heat
		heck
		heed
		heel
		heft
		heil
		heir
		held
		hell
		helm
		help
		heme
		hemp
		hems
		hens
		herb
		herd
		here
		hero
		herr
		hers
		hest
		hewn
		hews
		hick
		hide
		hied
		hies
		high
		hike
		hill
		hilt
		hind
		hint
		hips
		hire
		hisn
		hiss
		hist
		hits
		hive
		hoar
		hoax
		hobo
		hobs
		hock
		hods
		hoed
		hoer
		hoes
		hogs
		hoke
		hold
		hole
		holt
		holy
		home
		homo
		homy
		hone
		honk
		hood
		hoof
		hook
		hoop
		hoot
		hope
		hopi
		hops
		hora
		horn
		hors
		hose
		hosp
		host
		hots
		hour
		hove
		howe
		howl
		hows
		hubs
		huck
		hued
		hues
		huff
		huge
		hugs
		hula
		hulk
		hull
		hump
		hums
		hung
		hunk
		huns
		hunt
		hurl
		hurt
		hush
		husk
		huts
		hyde
		hymn
		hype
		hypo
		iamb
		ibex
		ibid
		ibis
		icbm
		iced
		ices
		icky
		icon
		idea
		idee
		idem
		ideo
		ides
		idle
		idly
		idol
		idyl
		ieee
		iffy
		ikon
		ilia
		ilks
		ills
		illy
		imam
		imps
		inca
		inch
		info
		inks
		inky
		inly
		inns
		inst
		intl
		into
		intr
		ions
		iota
		iowa
		ipso
		iran
		iraq
		ired
		ires
		iris
		irks
		iron
		isis
		isle
		isms
		ital
		itch
		item
		iuds
		ixia
		izar
		jabs
		jack
		jade
		jags
		jail
		jake
		jamb
		jams
		jane
		jape
		jars
		jato
		java
		jaws
		jays
		jazz
		jean
		jeep
		jeer
		jeez
		jefe
		jell
		jerk
		jess
		jest
		jets
		jeux
		jews
		jibe
		jibs
		jiff
		jigs
		jill
		jilt
		jinn
		jins
		jinx
		jive
		jobs
		jock
		joes
		joey
		jogs
		john
		joie
		join
		joke
		jolt
		jose
		josh
		joss
		jota
		jots
		jour
		jowl
		joys
		juan
		judo
		judy
		jugs
		juju
		juke
		july
		jump
		june
		junk
		juno
		jupe
		jure
		jury
		just
		jute
		juts
		kaka
		kale
		kame
		kart
		kayo
		kays
		keel
		keen
		keep
		kegs
		kelp
		keno
		kens
		kent
		kepi
		kept
		kerb
		kerf
		kern
		keys
		khan
		kick
		kids
		kiev
		kike
		kill
		kiln
		kilo
		kilt
		kind
		kine
		king
		kink
		kins
		kips
		kirk
		kiss
		kist
		kite
		kith
		kits
		kiwi
		knee
		knew
		knit
		knob
		knot
		know
		knox
		koan
		kohl
		kola
		kong
		kook
		koto
		kris
		kudo
		kudu
		kung
		kwhr
		kyat
		labs
		lace
		lack
		lacy
		lade
		lads
		lady
		lags
		laid
		lain
		lair
		lait
		lake
		laky
		lama
		lamb
		lame
		lamp
		lams
		land
		lane
		lank
		laos
		lapp
		laps
		lard
		lark
		lash
		lass
		last
		late
		lath
		laud
		lava
		lave
		lawn
		laws
		lays
		laze
		lazy
		lead
		leaf
		leak
		leal
		lean
		leap
		lear
		leas
		lech
		lect
		leek
		leer
		lees
		left
		legs
		leis
		leks
		lend
		lens
		lent
		leon
		leos
		lese
		less
		lest
		lets
		leva
		levi
		levo
		levy
		lewd
		leys
		liar
		libs
		lice
		lick
		lido
		lids
		lied
		lief
		lien
		lier
		lies
		lieu
		life
		lift
		like
		lilt
		lily
		lima
		limb
		lime
		limn
		limo
		limp
		limy
		line
		ling
		link
		lino
		lins
		lint
		liny
		lion
		lips
		lira
		lire
		lisp
		list
		lite
		lith
		lits
		live
		load
		loaf
		loam
		loan
		lobe
		lobo
		lobs
		loch
		loci
		lock
		loco
		lode
		loft
		loge
		logo
		logs
		logy
		loin
		loll
		lone
		long
		look
		loom
		loon
		loop
		loos
		loot
		lope
		lops
		lord
		lore
		lorn
		lory
		lose
		loss
		lost
		loth
		lots
		loud
		loup
		lour
		lout
		love
		lows
		luau
		lube
		luck
		lucy
		luff
		luge
		lugs
		luke
		lull
		lulu
		lump
		luna
		lune
		lung
		lunk
		luny
		lure
		lurk
		lush
		lust
		lute
		luxe
		lyes
		lynx
		lyre
		mace
		mach
		mack
		macs
		made
		mads
		mage
		magi
		mags
		maid
		mail
		maim
		main
		make
		mala
		male
		mali
		mall
		malt
		mama
		mane
		mans
		manx
		many
		maps
		marc
		mare
		mark
		marl
		mars
		mart
		marx
		mary
		mash
		mask
		mass
		mast
		mate
		math
		mats
		matt
		maul
		maut
		maws
		maxi
		maya
		mayo
		mays
		maze
		mazy
		mead
		meal
		mean
		meas
		meat
		mech
		meed
		meek
		meet
		mein
		meld
		melt
		memo
		mend
		mens
		menu
		meow
		mere
		mesa
		mesh
		mess
		meta
		mete
		mewl
		mews
		mibs
		mica
		mice
		mick
		midi
		mids
		mien
		miff
		migs
		mike
		mild
		mile
		milk
		mill
		mils
		milt
		mime
		mind
		mine
		ming
		mini
		mink
		mins
		mint
		minx
		mire
		mirk
		mirv
		miry
		misc
		mise
		miso
		miss
		mist
		mite
		mitt
		mixt
		mktg
		moan
		moas
		moat
		mobs
		mock
		mode
		modi
		modo
		mods
		moil
		mold
		mole
		moll
		molt
		moly
		moms
		monk
		mono
		mons
		mony
		mood
		moon
		moor
		moos
		moot
		mope
		mops
		mopy
		more
		morn
		mort
		moss
		most
		mote
		moth
		mots
		moue
		move
		mown
		mows
		moxa
		msec
		much
		muck
		muds
		muff
		mugs
		mule
		mull
		mumm
		mump
		mums
		muon
		murk
		muse
		mush
		musk
		muss
		must
		mute
		mutt
		myna
		myth
		nabs
		nags
		naif
		nail
		name
		nape
		naps
		narc
		nard
		nark
		nary
		nasa
		natl
		nato
		naut
		nave
		navy
		nays
		nazi
		neap
		near
		neat
		nebs
		neck
		need
		neon
		nerd
		ness
		nest
		nets
		nevi
		news
		newt
		next
		nibs
		nice
		nick
		nigh
		nile
		nill
		nils
		nims
		nine
		nips
		nisi
		nits
		nixy
		noah
		nobs
		nock
		node
		nods
		noel
		noes
		nogs
		noir
		nolo
		nome
		noms
		none
		nook
		noon
		nope
		norm
		nose
		nosh
		nosy
		nota
		note
		nots
		noun
		nous
		nova
		novo
		nows
		nubs
		nude
		nuke
		null
		numb
		nuns
		nuts
		oafs
		oaks
		oars
		oath
		oats
		obey
		obis
		obit
		oboe
		obol
		odds
		odes
		odic
		odin
		odor
		odyl
		ofay
		offs
		ogee
		ogle
		ogre
		ohed
		ohio
		ohms
		oils
		oily
		oink
		okay
		okie
		okra
		olds
		oleo
		oles
		olio
		olla
		omen
		omit
		once
		ones
		only
		onto
		onus
		onyx
		oohs
		oops
		ooze
		oozy
		opal
		opec
		open
		opes
		opts
		opus
		oral
		orbs
		orca
		orch
		orcs
		ordo
		ores
		orgy
		orig
		orth
		orts
		oryx
		oslo
		otic
		otto
		ouch
		ours
		oust
		outs
		ouzo
		oval
		oven
		over
		ovid
		ovum
		owed
		owes
		owls
		owns
		oxen
		oxes
		oyer
		oyes
		oyez
		pace
		pack
		pacs
		pact
		pads
		page
		paid
		pail
		pain
		pair
		pale
		pall
		palm
		pals
		pane
		pang
		pans
		pant
		papa
		paps
		para
		pard
		pare
		park
		pars
		part
		paso
		pass
		past
		pate
		path
		pats
		paul
		pave
		pawl
		pawn
		paws
		pays
		peak
		peal
		pean
		pear
		peas
		peat
		peck
		peds
		peed
		peek
		peel
		peen
		peep
		peer
		pees
		pegs
		peke
		pelf
		pelt
		pend
		pens
		pent
		peon
		peps
		pere
		perk
		perm
		pert
		peru
		peso
		pest
		pets
		pews
		phew
		phiz
		phys
		pica
		pick
		pics
		pied
		pier
		pies
		pigs
		pike
		pile
		pill
		pima
		pimp
		pine
		ping
		pink
		pins
		pint
		piny
		pion
		pipe
		pips
		pipy
		pisa
		pish
		piss
		pita
		pith
		pits
		pity
		pius
		pixy
		pkwy
		plan
		plat
		play
		plea
		pled
		plod
		plop
		plot
		plow
		ploy
		plug
		plum
		plus
		pock
		poco
		pods
		poem
		poet
		poke
		poky
		pole
		polk
		poll
		polo
		pols
		poly
		pome
		pomp
		pond
		pone
		pong
		pons
		pony
		pooh
		pool
		poop
		poor
		pope
		pops
		pore
		pork
		porn
		port
		pose
		posh
		post
		posy
		pots
		pouf
		pour
		pout
		pows
		pram
		prat
		pray
		prep
		pres
		prey
		prig
		prim
		prix
		proc
		prod
		prof
		prom
		pron
		prop
		pros
		prow
		psst
		pubs
		puce
		puck
		puds
		puff
		pugs
		puke
		pule
		pull
		pulp
		puma
		pump
		punk
		puns
		punt
		puny
		pupa
		pups
		pure
		purl
		purr
		push
		puss
		puts
		putt
		pyre
		qaid
		qoph
		quad
		quae
		quag
		quai
		qual
		quam
		quat
		quay
		quem
		ques
		quey
		quia
		quid
		quip
		quit
		quiz
		quod
		quos
		race
		rack
		racy
		rads
		raft
		raga
		rage
		rags
		raid
		rail
		rain
		raja
		rake
		ramp
		rams
		rand
		rang
		rani
		rank
		rant
		rape
		raps
		rapt
		rara
		rare
		rase
		rash
		rasp
		rata
		rate
		rats
		rave
		raws
		rays
		raze
		razz
		rcpt
		read
		real
		ream
		reap
		rear
		rebs
		recd
		recs
		redo
		reds
		reed
		reef
		reek
		reel
		refs
		reft
		rein
		rely
		rems
		rend
		reno
		rent
		reps
		resp
		rest
		retd
		revs
		rhea
		rial
		ribs
		rice
		rich
		rick
		ride
		rids
		riel
		rife
		riff
		rift
		rigs
		rile
		rill
		rime
		rims
		rimy
		rind
		ring
		rink
		riot
		ripe
		rips
		rise
		risk
		rite
		ritz
		rive
		road
		roam
		roan
		roar
		robe
		robs
		rock
		rocs
		rode
		rods
		roes
		roil
		role
		roll
		rome
		romp
		roms
		rood
		roof
		rook
		room
		root
		rope
		ropy
		rosa
		rose
		rosy
		rote
		roto
		rots
		roue
		rout
		roux
		rove
		rows
		rube
		rubs
		ruby
		ruck
		rude
		rued
		ruer
		rues
		ruff
		rugs
		ruin
		rule
		rump
		rums
		rune
		rung
		runs
		runt
		ruse
		rush
		rusk
		rust
		ruth
		ruts
		ryas
		ryes
		sack
		sacs
		safe
		saga
		sage
		sago
		sags
		sagy
		said
		sail
		sake
		sale
		salt
		same
		sand
		sane
		sang
		sank
		sans
		saps
		sari
		sash
		sass
		sate
		save
		sawn
		saws
		says
		scab
		scad
		scag
		scam
		scan
		scar
		scat
		scil
		scop
		scot
		scow
		scud
		scum
		scut
		seal
		seam
		sear
		seas
		seat
		secs
		sect
		seed
		seek
		seem
		seen
		seep
		seer
		sees
		self
		sell
		semi
		send
		sent
		sept
		sera
		serb
		sere
		serf
		sets
		sewn
		sews
		sexy
		shad
		shag
		shah
		sham
		shat
		shay
		shed
		shes
		shew
		shim
		shin
		ship
		shit
		shiv
		shmo
		shod
		shoe
		shoo
		shop
		shot
		show
		shul
		shun
		shut
		siam
		sibs
		sick
		sics
		side
		sift
		sigh
		sign
		sikh
		silk
		sill
		silo
		silt
		simp
		sine
		sing
		sinh
		sink
		sins
		sips
		sire
		sirs
		site
		sits
		situ
		sitz
		size
		sizy
		skag
		skew
		skid
		skim
		skin
		skip
		skis
		skit
		skys
		slab
		slag
		slam
		slap
		slat
		slav
		slaw
		slay
		sled
		slew
		slid
		slim
		slip
		slit
		slob
		sloe
		slog
		slop
		slot
		slow
		slue
		slug
		slum
		slur
		slut
		smit
		smog
		smug
		smut
		snag
		snap
		snip
		snit
		snob
		snot
		snow
		snub
		snug
		soak
		soap
		soar
		sobs
		sock
		soda
		sods
		sofa
		soft
		soil
		sold
		sole
		soli
		solo
		soma
		some
		song
		sons
		soon
		soot
		soph
		sops
		sore
		sort
		sots
		soul
		soup
		sour
		sown
		sows
		soya
		soys
		span
		spar
		spas
		spat
		spay
		spec
		sped
		spew
		spic
		spin
		spit
		spot
		spry
		spud
		spun
		spur
		stab
		stag
		star
		stat
		stay
		stem
		step
		stet
		stew
		stir
		stoa
		stop
		stow
		stub
		stud
		stun
		stye
		styx
		subs
		such
		suck
		suds
		sued
		suer
		sues
		suet
		suey
		suez
		suit
		sulk
		sumo
		sump
		sums
		sung
		sunk
		suns
		supe
		sups
		supt
		sure
		surf
		swab
		swag
		swam
		swan
		swap
		swat
		sway
		swig
		swim
		swob
		swop
		swum
		sync
		syne
		tabs
		tabu
		tach
		tack
		taco
		tact
		tads
		tags
		tail
		take
		talc
		tale
		talk
		tall
		tame
		tamp
		tams
		tang
		tank
		tans
		taos
		tape
		taps
		tare
		tarn
		taro
		tarp
		tars
		tart
		task
		tass
		tate
		tats
		taut
		taws
		taxi
		tbsp
		teak
		teal
		team
		tear
		teas
		teat
		tech
		teds
		teed
		teem
		teen
		tees
		tell
		temp
		tend
		tens
		tent
		term
		tern
		terr
		test
		text
		thai
		than
		that
		thaw
		thee
		them
		then
		thew
		they
		thin
		this
		thor
		thou
		thro
		thru
		thud
		thug
		thus
		tick
		tics
		tide
		tidy
		tied
		tier
		ties
		tiff
		tike
		tile
		till
		tilt
		time
		tine
		ting
		tins
		tint
		tiny
		tipi
		tips
		tire
		tiro
		tits
		tnpk
		toad
		toed
		toes
		toff
		tofu
		toga
		togo
		togs
		toil
		toke
		told
		tole
		toll
		tomb
		tome
		toms
		tone
		tong
		tons
		tony
		took
		tool
		toot
		tope
		tops
		tora
		torc
		tore
		torn
		toro
		tors
		tort
		tory
		tosh
		toss
		tost
		tote
		toto
		tots
		tour
		tout
		town
		tows
		toys
		tram
		trap
		tray
		tree
		tref
		trek
		trey
		trig
		trim
		trio
		trip
		trod
		trop
		trot
		trow
		troy
		true
		tsar
		tuba
		tube
		tubs
		tuck
		tufa
		tuff
		tuft
		tugs
		tuna
		tune
		tuns
		tups
		turd
		turf
		turk
		turn
		tush
		tusk
		tuts
		tutu
		twas
		twat
		twig
		twin
		twit
		twos
		tyke
		type
		typo
		tyre
		tyro
		tzar
		ufos
		ughs
		ugli
		ugly
		ukes
		ulna
		ulva
		umps
		unco
		undo
		undy
		unit
		univ
		unix
		unto
		unum
		upon
		ural
		urbs
		urds
		urea
		urge
		uric
		urns
		ursa
		used
		usee
		user
		uses
		ussr
		utah
		vade
		vail
		vain
		vale
		vamp
		vane
		vans
		vary
		vase
		vast
		vats
		veal
		veda
		veep
		veer
		vees
		veil
		vein
		vela
		veld
		vend
		vent
		verb
		vers
		vert
		very
		vest
		veto
		vets
		vial
		vias
		vice
		vide
		vied
		vier
		vies
		view
		vile
		vims
		vine
		vino
		vins
		viny
		viol
		vips
		visa
		vise
		vita
		viva
		vive
		vivo
		voce
		void
		vole
		volt
		vote
		vows
		vrow
		vugg
		vugh
		vugs
		wack
		wacs
		wade
		wadi
		wads
		waft
		wage
		wags
		waif
		wail
		wain
		wait
		wake
		wale
		walk
		wall
		walt
		wand
		wane
		wang
		want
		ward
		ware
		wark
		warm
		warn
		warp
		wars
		wart
		wary
		wash
		wasp
		wast
		wats
		watt
		waul
		wave
		wavy
		waxy
		ways
		weak
		weal
		wean
		wear
		webs
		weds
		weed
		week
		ween
		weep
		weft
		weir
		weld
		well
		welt
		wend
		wens
		went
		wept
		were
		wert
		west
		wets
		wham
		whap
		what
		whee
		when
		whet
		whew
		whey
		whig
		whim
		whip
		whir
		whit
		whiz
		whoa
		whom
		whys
		wick
		wide
		wife
		wigs
		wild
		wile
		will
		wilt
		wily
		wind
		wine
		wing
		wink
		wino
		wins
		winy
		wipe
		wire
		wiry
		wise
		wish
		wisp
		with
		wits
		wive
		wkly
		woad
		woes
		woke
		woks
		wold
		wolf
		womb
		wont
		wood
		woof
		wool
		woos
		wops
		word
		wore
		work
		worm
		worn
		wort
		wots
		wove
		wows
		wrap
		wren
		writ
		wyes
		xiii
		xmas
		xvii
		xxii
		xxiv
		yack
		yaks
		yale
		yams
		yang
		yank
		yaps
		yard
		yare
		yarn
		yawl
		yawn
		yawp
		yaws
		yeah
		year
		yeas
		yegg
		yell
		yelp
		yens
		yeti
		yews
		yids
		yins
		yipe
		yips
		ymca
		yoga
		yogi
		yoke
		yolk
		yond
		yoni
		yore
		york
		your
		yowl
		yows
		yuan
		yuks
		yule
		yurt
		ywca
		zags
		zany
		zaps
		zeal
		zebu
		zeds
		zees
		zero
		zest
		zeta
		zeus
		zigs
		zinc
		zing
		zion
		zips
		zone
		zoom
		zoos
		zori
		zulu
		zuni
	]]


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

		timer.resume( core_runner2 )
	end


	local background = display.newImage( "assets/space_pro2.png" )
	background.x = 145
	background.y = 145
	background:scale(0.25,0.25)
	background.alpha = 0.5
	sceneGroup:insert(background)

	local background2 = display.newImage( "assets/objects2.png" )
	background2.x = 185
	background2.y = 145
	background2.alpha = 0.5
	background2:scale(0.2,0.2)
	sceneGroup:insert(background2)

    sceneGroup:insert( tmp_letter1 )
    sceneGroup:insert( tmp_letter2 )
    sceneGroup:insert( tmp_letter3 )

			--- The score variable, initiating it here, when your score is at 3, the four letter words unlock! (Sentences stay at three word sentences for now...)
			local score = 3

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
                    -- next_scene()
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
						transition.to(unlock2, { time=6500, alpha=1.0, x=unlock2.x, y=unlock2.y - 1500, onComplete=level_3_loader})
						audio.play(notify)
					end

					timer.performWithDelay( 1500, unlock2_func, 1 )
				end


--- Declaring here as a forward reference, so that upon sentence completion, we can remove this object
local first_word = display.newText( journal_sentence.first, 100, 200, "zcool.ttf", 16 )
local second_word = display.newText( journal_sentence.second, 100, 200, "zcool.ttf", 16 )
local third_word = display.newText( (journal_sentence.third) .. ("."), 100, 200, "zcool.ttf", 16 )

--- Initiating it here.
local journal_quick = GGData:new("quick.txt")
journal_quick.formed = 'xxxx'
journal_quick:save()



 --- The finder function!
    function finder(event)

		print("finder is firing via the timer!")

		local journal_quick = GGData:new("quick.txt")

		-- local capture = string.find(quad_list, journal_combined.masterword)
		local capture = string.find(quad_list, journal_quick.formed)

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
						timer.pause( core_runner2 )

							function timer_resume1(event)
								timer.resume( core_runner2 )
							end

						timer.performWithDelay( 4000, timer_resume1, 1 )
						---------------------------------------------------


					elseif journal_conditions.first_element_fulfilled == "true" and journal_conditions.second_element_fulfilled == "false" then

						local sentence_element_2 = journal_quick.formed
						journal_conditions.second_element_fulfilled = "true"
						journal_conditions:save()
						journal_sentence.second = sentence_element_2
						journal_sentence:save()

						score = score + 1
						score_text.text = score

						---------------------------------------------------
						--- Flow control.
						timer.pause( core_runner2 )

							function timer_resume2(event)
								timer.resume( core_runner2 )
							end

						timer.performWithDelay( 4000, timer_resume2, 1 )
						---------------------------------------------------

					elseif journal_conditions.second_element_fulfilled == "true" and journal_conditions.third_element_fulfilled == "false" then

						---------------------------------------------------
						--- Flow control.
						timer.pause( core_runner2 )
						timer.cancel( core_runner2 )

						Runtime:removeEventListener( "mouse", onMouseEvent )

						--transition.to(background, { time=1500, alpha=0, x=background.x, y=background.y})
						--transition.to(background2, { time=1500, alpha=0, x=background2.x, y=background2.y})
						---------------------------------------------------

						local sentence_element_3 = journal_quick.formed
						journal_conditions.third_element_fulfilled = "true"
						journal_conditions:save()
						journal_sentence.third = sentence_element_3
						journal_sentence:save()

									------------ Saving the second complete sentence, in the journal. ----------
									local complete_sentence_2 = (  (journal_sentence.first) .. (" ") .. (journal_sentence.second) .. (" ") .. (journal_sentence.third) .. (".")  )
									journal_sentence.complete2 = complete_sentence_2
									journal_sentence.nextlevel = "pro_level3"
									journal_sentence:save()
									----------------------------------------------------------------------------

						score = score + 1
						score_text.text = score

						bool_reset_function()

						if score == 6 then 
							unlock2_notify_function();
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

			---- No matching word found, this exectues.
			elseif capture == nil then

				function mshow_updater(event)
					mwshow.text = journal_combined.masterword
				end
			
			else
			end

	end


    _G.core_runner2 = timer.performWithDelay( 500, finder, 0 )


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
					local sentence_label = display.newText( "SENTENCE: " , 100, 200, "zcool.ttf", 14 )
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