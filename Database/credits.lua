y = 272
fond3 = image.load("Images/Interface/fond3.png")
i = 0
    


while true do
  screen:clear()  
  controls.read()
  image.blit(0,0,fond3)
--Music  
 if sound.playing(theme) == false then
    sound.play(theme,1) 
 end
        
  y = y - 0.7
  screen.print(240,y - 5,"Je suis fier de vous presenter:",0.9,rouge,blanc,"center")     
  screen.print(240,y + 30,"Xonergy Version beta",1.2,rouge,blanc,"center")     
  screen.print(240,y + 75,"Idee originale: Xeo-Swold",0.9,rouge,blanc,"center")     
  screen.print(240,y + 90,"Codeur: Xeo-Swold",0.9,rouge,blanc,"center")     
  screen.print(240,y + 105,"Graphismes 2d/3d: Xeo-Swold",0.9,rouge,blanc,"center")     
  screen.print(240,y + 120,"Remerciments speciaux:",0.9,rouge,blanc,"center")     
  screen.print(240,y + 135,"Createur du luadev R0",0.9,rouge,blanc,"center")     
  screen.print(240,y + 150,"Tous les membres de la team Zenyth",0.9,rouge,blanc,"center")     
  screen.print(240,y + 165,"Tous ceux qui m'ont soutenu",0.9,rouge,blanc,"center")         
  if y <= -200 or controls.press("circle") then
    y = 272
    dofile("Database/menu.lua")
    fond3:free()
  end  
  
  screen:flip()
end  
