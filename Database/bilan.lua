best = 0
  
while true do
  screen:clear()
  controls.read()

argentajoute = score / 100

screen.print(10,10,"Tu as fait un scrore de "..score.." Points, bravo",0.9,rouge,blanc)         
screen.print(10,25,"Tu as gagne"..argentajoute.."pieces.",0.9,rouge,blanc)         
screen.print(10,55,"Presse (start) pour continuer",0.9,rouge,blanc)         

if score > bestscore then
  screen:flip()
  bestscore = score  
  best = 1
end  

if best == 1 then
  screen.print(10,40,"Nouveau record personnel !!!",0.9,rouge,blanc)         
end  
    
    
  
if controls.press("start") then    
  argent = argent + argentajoute
  sauvegarde()
  dofile("Database/menu.lua")
end  
  
  screen:flip()
end  
