if chargement == 0 then
--Chargement--    
screen:clear()    
draw.fillrect(0,0,480,272,noir);
screen.print(50,150,"Chargement...",2.5,blanc,noir)     
screen:flip()  
--Perso  
  persomodele = model.load("Modeles/Persos/perso_obj.obj")
  persobasketmodel = model.load("Modeles/Persos/basket.obj")       
  fond = image.load("Images/Interface/fondenjeu.png")      
  sang = {img = image.load("Images/Jeu/sang.png"),opacite = 0,timer = 0}    
  pauseimg = image.load("Images/Jeu/pause.png")
  coeur = image.load("Images/Jeu/coeur.png")      
  simple = model.load("Modeles/Terrain/pont_simple.obj")
  detruitdroite = model.load("Modeles/Terrain/pontdetruit_droite.obj")
  detruitgauche = model.load("Modeles/Terrain/pontdetruit_gauche.obj")
  piques = model.load("Modeles/Terrain/piques.obj")
--Sons  
soundsaut = sound.load("Sons/saut.wav")
blesse = sound.load("Sons/blesse.wav")
recordbattut = sound.load("Sons/highscore.wav")
sonselecteur = sound.load("Sons/selecteur.wav")
chargement = 1
end

selecteur = 1
x = -50
menuimg = image.load("Images/Interface/menu.png")
  
while true do
  screen:clear()
  image.blit(menuimg,0,0)    
  controls.read()
--Music  
 if sound.playing(theme) == false then
    sound.play(theme,1) 
 end


  if controls.press("up") and selecteur >= 2 then
    selecteur = selecteur - 1
    sound.play(sonselecteur,2)
  end  
  if controls.press("down") and selecteur <= 4 then
    selecteur = selecteur + 1
    sound.play(sonselecteur,2)
  end  
--print
  draw.fillrect(10,95,250,15,color.new(255,255,255));
  if selecteur == 1 then
    screen.print(10,100,"Partie solo",1.2,noir,blanc)
    screen.print(10,120,"Boutique",0.9,noir,blanc)
    if controls.press("cross") then
      menuimg:free()      
      dofile("Database/solo.lua")
    end  
  end    
  if selecteur == 2 then
    screen.print(10,80,"Partie solo",0.9,noir,blanc)
    screen.print(10,100,"Boutique",1.2,noir,blanc)
    screen.print(10,120,"Options",0.9,noir,blanc)
    if controls.press("cross") then
      dofile("Database/boutique.lua")      
    end  
  end  
  if selecteur == 3 then
    screen.print(10,80,"Boutique",0.9,noir,blanc)
    screen.print(10,100,"Options",1.2,noir,blanc)    
    screen.print(10,120,"Credits",0.9,noir,blanc)        
    if controls.press("cross") then
      dofile("Database/options.lua")
    end  
  end    
  if selecteur == 4 then
    screen.print(10,80,"Options",0.9,noir,blanc)
    screen.print(10,100,"Credits",1.2,noir,blanc)    
    screen.print(10,120,"Quitter le jeu",0.9,noir,blanc)    
    if controls.press("cross") then
      dofile("Database/credits.lua")
    end  
  end    
  if selecteur == 5 then
    screen.print(10,80,"Credits",0.9,noir,blanc)
    screen.print(10,100,"Quitter le jeu",1.2,noir,blanc)    
    if controls.press("cross") then
      os.quit()
    end  
  end    
  
--Score
  x = x + 1
    screen.print(x,200,"Record: "..bestscore,0.9,noir,blanc)
    screen.print(x,225,"Argent: "..argent,0.9,noir,blanc)
  if x >= 480 then  
    x = -50
  end

  screen:flip()
end  

