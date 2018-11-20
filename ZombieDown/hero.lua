local Hero = {}

Hero.x = largeur / 2
Hero.y = hauteur / 2
print("largeur perso : "..Hero.x.." hauteur perso : "..Hero.y)


Hero.keyPressed = false

tTile = 32

function Hero.Load()
  
  Hero = CreeSprite("player_1", Hero.x, Hero.y)
  
end

function Hero.Update(dt)
  


  -- Deplacement du perso
  if love.keyboard.isDown("z") and Hero.y >  tTile * 5 then
    Hero.y = Hero.y - 150 *dt
  end  
  if love.keyboard.isDown("d") and Hero.x <  largeur - ((tTile * 6) + tTile / 2) then
    Hero.x = Hero.x + 150 * dt
  end  
  if love.keyboard.isDown("s") and Hero.y <  hauteur - ((tTile * 5) + tTile / 2) then
    Hero.y = Hero.y + 150 * dt
  end  
  if love.keyboard.isDown("q") and Hero.x >  tTile * 6 + tTile / 2 then
    Hero.x = Hero.x - 150 *dt
  end 
  
  -- Gestion du tire
  if love.mouse.isDown(1) then

    if Hero.keyPressed == false then

      if love.mouse.isDown(1) then
        
        CreeTir("Hero", "laser1", Hero.x, Hero.y)

      end
      
      Hero.keyPressed = true
      
    end
  else
    Hero.keyPressed = false 
  end
  

end

function Hero.Draw()


end

return  Hero