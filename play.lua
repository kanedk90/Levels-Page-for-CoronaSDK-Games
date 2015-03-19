local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local levelstorage = require("levelstorage")


-- local forward references should go here --

--levelProgress = 0
--levelImg = {}
--allLevels = {}


levels = 
{	
1, 2, 2, 2 ,2,  --1 means level is open to 	be played (level.png)
2, 2, 2, 2, 2,   --2 means level is locked (locked.png)
2, 2, 2, 2, 2,
2, 2, 2, 2, 2,
2, 2, 2, 2, 2,
}
  
images ={
      
	{ getFile = "gift.png", types = "play"},
	{ getFile = "lock.png", types = "locked"},
	{ getFile = "greenchecked.png", types = "done"}
}
--levels = loadLevels()

local function buttonHit(event)
	storyboard.gotoScene ( event.target.destination, {effect = "slideUp"} )	
	print( event.target.destination)
		return true
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	local levelIndex =0
		for i=0,4 do
			for j=1,5 do
                                --current = i*5 + j  -- This calculates the current position in the table
                                tablePlace =   i*5 + j	
				levelIndex = levelIndex + 1
					local imagesId = levels[levelIndex] 
						levelImg = display.newImageRect (images[imagesId].getFile , 50, 50 )
						levelImg.x = -22 + (j*62)
						levelImg.y  = 130+ (i*70)
                                                levelImg.anchorY = .8
                                                --levelImg.anchorX = 0.5
                                                --levelImg.paddingRight = 100
						group:insert(levelImg)

						
                                                
                                                local levelText = display.newText(tablePlace,0,0,native.systemFont,28)
                                                    levelText.x = -22 + (j*62)
                                                    levelText.y = 125+ (i*70)

			
			group:insert(levelText)
						
					    levelImg.destination = "level0"..tostring(tablePlace)
						
						if images[imagesId].types ~= "locked" then
						levelImg:addEventListener("tap", buttonHit)
						end
 end
	
end
		


	
	-- CREATE display objects and add them to 'group' here.
	-- Example use-case: Restore 'group' from previously saved state.
	
	local title = display.newText( "Level Selection", 0, 0, "Helvetica", 20 )
	title.x = centerX
	title.y = display.screenOriginY + 40
	group:insert(title)
	
	local backBtn = display.newText(  "Back", 0, 0, "Helvetica", 20 )
	backBtn.x = display.screenOriginX + 50
	backBtn.y = display.contentHeight  - 30 
	backBtn.destination = "menu" 
	backBtn:addEventListener("tap", buttonHit)
	group:insert(backBtn)



end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
        
        local group = self.view
        
        saveLevels()
        

	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	-- INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view

	-- INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks

end



---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )


---------------------------------------------------------------------------------

return scene
	


--[[local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local hohoho = audio.loadSound("xmas.wav")

-- Clear previous scene
storyboard.removeAll()

-- local forward references should go here --

levels = 
{	
1, 2, 2, 2 ,2,  --1 means level is open to 	be played (level.png)
2, 2, 2, 2, 2,  --2 means level is locked (locked.png)
2, 2, 2, 2, 2,  --3 means level is completed (greenchecked.png)
2, 2, 2, 2, 2,
2, 2, 2, 2, 2,
}

images ={
       
	{ getFile = "gift.png", types = "play"},
	{ getFile = "lock.png", types = "locked"},
	{ getFile = "greenchecked.png", types = "done"}
}

local function buttonHit(event)
	storyboard.gotoScene ( event.target.destination, {effect = "slideLeft"} )
        audio.play(hohoho)
	print( event.target.destination)
		return true
end
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------


-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  
  	local levelIndex = 0
		for i=0,4 do
			for j=1,5 do
                               
                                tablePlace =   i*5 + j	
				levelIndex = levelIndex + 1
					local imagesId = levels[levelIndex] 
					levelImg = display.newImageRect (images[imagesId].getFile , 50, 50 )
					levelImg.x = -22 + (j*62)
					levelImg.y  = 130+ (i*70)
                                        levelImg.anchorY = .8
					group:insert(levelImg)

                                        local levelText = display.newText(tablePlace,0,0,native.systemFont,28)
                                        levelText.x = -22 + (j*62)
                                        levelText.y = 125+ (i*70)
                                        group:insert(levelText)
						
                                        levelImg.destination = "level0"..tostring(tablePlace)
						
					if images[imagesId].types ~= "locked" then
					levelImg:addEventListener("tap", buttonHit)
					end
                        end
	
                end
		


	
	-- CREATE display objects and add them to 'group' here.
	-- Example use-case: Restore 'group' from previously saved state.
	local heading = display.newText("Christmas Countdown", 0, 0, native.systemFontBold, 31)
        heading: setTextColor( .75, 0, 0)
        heading.x, heading.y = 160, 35
        group:insert(heading)
	
        local backButton = display.newImage("backButton.png", 43, 495)
        group:insert(backButton)
        backButton:addEventListener("tap", buttonHit)
        backButton.destination = "menu_scene"
end


-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view

end


-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view

end


-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
  local group = self.view

end


-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
  
end


-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene

end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )

-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )

---------------------------------------------------------------------------------

return scene



--]]

