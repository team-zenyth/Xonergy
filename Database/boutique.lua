selecteur = 1
menuimg = image.load("Images/Interface/boutique.png")      
  
while true do
  screen:clear()
  controls.read()
  image.blit(0,0,menuimg)
--Music  
 if sound.playing(theme) == false then
    sound.play(theme,1) 
 end


  if controls.press("up") and selecteur >= 2 then
    selecteur = selecteur - 1
    sound.play(sonselecteur,2)
  end  
  if controls.press("down") and selecteur <= 1 then
    selecteur = selecteur + 1
    sound.play(sonselecteur,2)
  end  
--print
  draw.fillrect(25,95,350,15,color.new(255,255,255));
  if selecteur == 1 then
    screen.print(25,100,"EXTRA VIE: 150 or(max 10). Actuel: "..viemax,1.2,noir,blanc)
    screen.print(25,120,"Retour",0.9,noir,blanc)
    if controls.press("cross") and viemax <= 9 and argent >= 300 then      
      argent = argent - 150
      viemax = viemax + 1
    end  
  end    
  if selecteur == 2 then
    screen.print(25,80,"EXTRA VIE: 150 or(max 10). Actuel: "..viemax,0.9,noir,blanc)
    screen.print(25,100,"Retour",1.2,noir,blanc)
    if controls.press("cross") then
      sauvegarde()
      dofile("Database/menu.lua")
    end  
  end  
  
--Score
    screen.print(130,45,"ARGENT: "..argent,0.9,noir,blanc)

  screen:flip()
end  

