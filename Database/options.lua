selecteur = 1

while true do
  screen:clear()
  controls.read()
  
  if controls.press("up") and selecteur >= 2 then
    selecteur = selecteur - 1
    sound.play(sonselecteur,2)
  end  
  if controls.press("down") and selecteur <= 2 then
    selecteur = selecteur + 1
    sound.play(sonselecteur,2)
  end  
--print
  draw.fillrect(10,95,350,15,color.new(255,255,255));
  if selecteur == 1 then
    screen.print(10,100,"X : Remettre a zero !IRREVERSIBLE!",1.2,noir,blanc)
    screen.print(10,120,"Retour",0.9,noir,blanc)
    if controls.press("cross") then      
      argent = 0
      bestscore = 0      
      viemax = 5
      sauvegarde()
      dofile("script.lua")
    end  
  end    
  if selecteur == 2 then
    screen.print(10,80,"X : Remettre a zero !IRREVERSIBLE!",0.9,noir,blanc)
    screen.print(10,100,"Retour",1.2,noir,blanc)
    if controls.press("cross") then
      sauvegarde()
      dofile("Database/menu.lua")
    end  
  end  

  screen:flip()
end  

