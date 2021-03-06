local Game = {}
musiqueJeu = love.audio.newSource("sons/Projet Jeux Mixer.mp3", "stream")

-- Map--
Game.Map = {}
Game.Map.Grid = {
  {36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,9,9,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36},
  {36,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,36},
  {36,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,36},
  {36,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,36},
  {36,9,9,9,9,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,9,9,9,9,36},
  {36,9,9,9,9,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,9,9,9,9,36},
  {36,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,36},
  {36,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,36},
  {36,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,36},
  {36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36}
  }

Game.Map.MAP_WIDTH = 32
Game.Map.MAP_HEIGHT = 24
Game.Map.TILE_WIDTH = 32
Game.Map.TILE_HEIGHT = 32

Game.imageMap = {}
Game.Textures = {}
Game.TileTypes = {}

Game.Hero = require("Hero")

listSprites = {}
listTirs = {}

function CreeTir (pType, pNomImage, pX, pY, pvitesseX, pvitesseY)
  --Cree les tirs
  Tir = {}
  Tir.type = pType
  local Tir = CreeSprite(pNomImage, pX, pY)
  Tir.vx = pvitesseX
  Tir.vy = pvitesseY
  table.insert(listTirs, Tir)
  
end
function CreeSprite(pNomImage, pX, pY)
-- Cree les images
  sprite = {}
  sprite.x = pX
  sprite.y = pY
  sprite.image = love.graphics.newImage("images/"..pNomImage..".png")
  sprite.l = sprite.image:getWidth()
  sprite.h = sprite.image:getHeight()
  
  table.insert(listSprites, sprite)

  return sprite
end

function Game.Load()
  print("Debut chargement textures...")
  
  Game.imageMap = love.graphics.newImage("images/tilesheet.png")
  local nbcol = Game.imageMap:getWidth() / Game.Map.TILE_WIDTH
  local nbLin = Game.imageMap:getHeight() / Game.Map.TILE_HEIGHT
  
  --Trie les image en 32x32
  local id = 1
  Game.Textures[0] = nil
  
  for l=1, nbLin do
    for c=1, nbcol do
      Game.Textures[id] = love.graphics.newQuad(
        (c-1)*Game.Map.TILE_WIDTH, (l-1)*Game.Map.TILE_HEIGHT,
        Game.Map.TILE_WIDTH, Game.Map.TILE_HEIGHT, 
        Game.imageMap:getWidth(), Game.imageMap:getHeight()
        )
      id = id + 1
    end
  end
  
print("Fin chargement texture...")
print("Debut chargement personnage...")
  Game.Hero.Load()
print("Fin chargement personnage...")

end

function love.mousepressed(x, y, button)
  print("Le bouton "..tostring(button).." vient d'être enfoncé mX : "..x.." mY : " ..y)
  if button == 1 then
    mX = x
    mY = y
  end
end
function Game.Update(dt)

  Game.Hero.Update(dt)
  -- Genere le deplacement du Tir
  local n
  for n=#listTirs,1, -1 do
    local Tir = listTirs[n]
    Tir.x = Tir.x + Tir.vx
    Tir.y = Tir.y + Tir.vy
  end
musiqueJeu:play()
end

function Game.Draw()
  
  -- Genere la map case par case
  local c,l
  for l=1,Game.Map.MAP_HEIGHT do
    for c=1,Game.Map.MAP_WIDTH do
      local id = Game.Map.Grid[l][c]
      local texQuad = Game.Textures[id]
      if texQuad ~= nil then
        local x = (c-1) * Game.Map.TILE_WIDTH
        local y = (l-1) * Game.Map.TILE_HEIGHT
        love.graphics.draw(Game.imageMap, texQuad, x, y)
      end
    end
  end

  Game.Hero.Draw()
  
  local n
    for n=1, #listSprites do
     s = listSprites[n]
    love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.l / 2, s.h / 2)
  end

end

return  Game
