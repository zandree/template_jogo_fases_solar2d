local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
function voltarParaMenu(sceneGroup)
    local w = display.contentWidth
    local h = display.contentHeight
    local voltar = display.newRoundedRect(sceneGroup, 0, 0, 40, 40, 5)
    voltar.x, voltar.y = w * .9, h * .1
    voltar:setFillColor(114/255, 9/255, 183/255)
    local options = {
        text = 'X',
        x = 0,
        y = 0,
        font = native.systemFontBold,
        fontSize = 25,
        align = 'center'
    }
    
    local letrax = display.newText(options)
    letrax.x, letrax.y = voltar.x, voltar.y
    sceneGroup:insert(letrax)
    voltar:addEventListener("tap", function() composer.gotoScene("menu") end)
end
 
function exibeTitulo(sceneGroup)
    local w = display.contentWidth
    local h = display.contentHeight

    local options = {
        --parent = 'sceneGroup',
        text = 'FASE 01',
        x = w / 2,
        y = h / 2,
        font = native.systemFontBold,
        fontSize = 25,
        align = 'center'
    }
    local titulo = display.newText(options)
    sceneGroup:insert(titulo)
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
    exibeTitulo(sceneGroup)
    voltarParaMenu(sceneGroup)

 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene