-----------CHARGEMENT-----------        
--------------------------------
--Personnage    
    perso = {etat = 0,vitesse = 0,colonne = 1,x = 5,y = 2.5,z = 7,timer = 0,rotx = 0,roty = 0,rotz = 0,basketleft = {z=0,rotx=0,stade  = 0},basketright = {z=0,rotx=0,stade = 1}}    
--Terrain
pont = {}
pont[1] = {z = 6,type = 1,used = 0}
pont[2] = {z = 12,type = 1,used = 0}
pont[3] = {z = 18,type = 1,used = 0}
pont[4] = {z = 24,type = 1,used = 0}
pont[5] = {z = 30,type = 1,used = 0}
pont[6] = {z = 36,type = 1,used = 0}
pont[7] = {z = 42,type = 1,used = 0}
pont[8] = {z = 48,type = 1,used = 0}

--Autres
vie = viemax
piegeok = 1
score = 0

while true do
  screen:clear()
  controls.read()    
  image.blit(0,0,fond)
  
--Music
 if sound.playing(theme) == false and sound.playing(recordbattut) == false then
    sound.play(theme,1) 
 end
--Pause  
  pause()
--Camera          
  world.lookat({0,4,perso.z-3.5},{0,3,perso.z + 3},{0,1,0})--rotation/position/angle XYZ de la camera
--Lumiere
  --1
 world.lighttype(1,1); 
 world.lightcomponent(1,2);
 world.lightdiffuse(1,blanc);
 world.lightambient(1,color.new(40,40,80));
 world.lightspecular(1,blanc); 
 world.lightposition(1,5,4.5,perso.z+2);
 world.lightdirection(1,1,3,perso.z);
 world.lightenabled(1,true);
 world.lightattenuation(1,0,0,0.5);
 world.lights(true);
 world.ambient(color.new(80,80,100));
 world.specular(1);
 world.update();
  --2
 world.lighttype(2,1); 
 world.lightcomponent(2,2);
 world.lightdiffuse(2,blanc);
 world.lightambient(2,color.new(255,255,146));
 world.lightspecular(2,blanc); 
 world.lightposition(2,-4,5,perso.z);
 world.lightdirection(2,2,0,perso.z + 3);
 world.lightenabled(2,true);
 world.lightattenuation(2,0,0,0.5);
 world.lights(true);
 world.ambient(color.new(80,80,100));
 world.specular(1);
 world.update();  
  
  
--Generation du terrain
for i = 1,8 do  
    --Simple
    if pont[i].type == 1 then
      simple:rotation(0,-1.55,0)
      simple:position(0,0,pont[i].z)
      simple:blit()
    end  
    --Piques
    if pont[i].type == 2 then      
      piques:rotation(0,-1.55,0)
      piques:position(0,0,pont[i].z)
      piques:blit()
    end 
    --Detruit passage a droite
    if pont[i].type == 3 then      
      detruitdroite:rotation(0,-1.55,0)
      detruitdroite:position(0,0,pont[i].z)
      detruitdroite:blit()
    end 
    --Detruit passage a gauche
    if pont[i].type == 4 then      
      detruitgauche:rotation(0,-1.55,0)
      detruitgauche:position(0,0,pont[i].z)
      detruitgauche:blit()
    end     
--Creation  
  if pont[i].z <= perso.z - 1.5 then
    if piegeok == 0 then
      pont[i].type = 1
      piegeok = 1
     else
      pont[i].type = math.random(1,4)
      piegeok = 0
    end 
    pont[i].z = perso.z + 48
    pont[i].used = 0
  end      
--PIEGES
if pont[i].z >= perso.z - 0.5 and pont[i].z <= perso.z + 0.5 then
  --Piques
  if pont[i].used == 0 and pont[i].type == 2 and perso.etat ~= 1 then    
    vie = vie-1    
    sound.play(blesse,2)
    sang.timer = 80
    sang.opacite = 200
  end    
  --Detruit droite
  if pont[i].type == 3 then     
    if pont[i].used == 0 and perso.colonne ~= 1 and perso.etat ~= 1 then  
      vie = vie-1
      sound.play(blesse,2)
      sang.timer = 80
      sang.opacite = 200
    end
  end    
  --Detruit gauche
  if pont[i].type == 4 then   
    if pont[i].used == 0 and perso.colonne ~= 3 and perso.etat ~= 1 then  
      vie = vie-1
      sound.play(blesse,2)
      sang.timer = 80
      sang.opacite = 200
    end  
  end    
  pont[i].used = 1
 end        
end

if sang.timer > 0 then
  sang.opacite = sang.opacite - 3.1875
  sang.img:blend(0,0,sang.opacite)
end       

  ----------
--Personnage--
  ----------
animrun()  
  perso.z = perso.z + 0.5
  if controls.press("l") and perso.colonne <= 2 then
    perso.colonne = perso.colonne + 1    
  end
  if controls.press("r") and perso.colonne >= 2 then
    perso.colonne = perso.colonne - 1 
  end
  
--Sauts

  if controls.press("cross") and perso.etat == 0 then
    sound.play(soundsaut,2)
    perso.etat = 1
    perso.vitesse = 0.6
  end    
if perso.etat == 1 then
 perso.vitesse = perso.vitesse - 0.05
   if perso.vitesse >= -0.6 then
     perso.y = perso.y + perso.vitesse            
   end 
   if perso.y <= 2.5 then    
     perso.y = 2.5
     perso.etat = 0
   end
end   
 
--Score
score = score + 1  
if score == bestscore then
  sound.play(recordbattut,2)
end  

screen.print(10,10,"Score:"..score.." Points",0.9,noir,blanc)     
screen.print(10,25,"Vie:"..vie.." Restantes",0.9,noir,blanc)     
for i = 1,vie do
  image.blit((i*25)-25,40,coeur)
end  
  
if vie <= 0 then
  dofile("Database/bilan.lua")
end    

screen:flip()
end  

