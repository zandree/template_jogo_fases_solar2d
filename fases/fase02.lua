-- -----------------------------------------------------------------------------------
-- Este arquivo não é mais utilizado. Agora todas as fases são carregadas pelo 
-- arquivo fases.lua por meio de passagem de parâmetros na função gotoScene.
-- -----------------------------------------------------------------------------------

local composer = require( "composer" )
local tiled = require "com.ponywolf.ponytiled"
local physics = require "physics"
local json = require "json"

physics.start()

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
    return voltar, letrax
end
 
function exibeTitulo(sceneGroup)
    local w = display.contentWidth
    local h = display.contentHeight

    local options = {
        --parent = 'sceneGroup',
        text = 'FASE 02',
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
    
    --exibeTitulo(sceneGroup)
    

    --Criar o mapa
    -- Load a "pixel perfect" map from a JSON export
    display.setDefault("magTextureFilter", "nearest")
    display.setDefault("minTextureFilter", "nearest")
    local mapData = json.decodeFile(system.pathForFile("maps/fase02.json", system.ResourceDirectory))  -- load from json export
    local map = tiled.new(mapData, "objects")
    map.x,map.y = display.contentCenterX - map.designedWidth/2, display.contentCenterY - map.designedHeight/2

    sceneGroup:insert(map)
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