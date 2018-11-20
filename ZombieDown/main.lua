-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end

newdime = love.window.setMode(1024,768)
love.window.setTitle("ZombieDown")

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()


local myGame = require("game")

function love.load()
  
  print("largeur : "..largeur.." hauteur : "..hauteur)
  
  myGame.Load()
  
end

function love.update(dt)

  myGame.Update(dt)
  
end

function love.draw()
  
  myGame.Draw()
  
  local x, y = love.mouse.getPosition()
  love.graphics.print("position"..tostring(x)..","..tostring(y), 0, 0)
  
end

function love.keypressed(key)
  
  print(key)
  
end

