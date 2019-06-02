-------------------
---Par Xeo-Swold---
-------------------  
--Couleures
rouge = color.new(255,0,0)
blanc = color.new(255,255,255)
noir = color.new(0,0,0)
dofile("Database/fonctions.lua")
theme = sound.load("Sons/theme.mp3")
  

--SAUVEGARDE
opensauvegarde()
os.cpu(333) 
os.luadevsplash()

--Ressources
  chargement = 0
  t = 0
  fond = image.load("Images/Interface/fond.png")
  fond2 = image.load("Images/Interface/fond2.png")
  --3D
  rot = {x = 0,y = 0,z = 0}
  logo = model.load("Modeles/Zenith.obj")


--Lumiere
      world.lightenabled(1,true);                    -- enable light.
      world.lightambient(1,color.new(255,255,120));          -- ambient color yellow
      world.lightdiffuse(1,color.new(255,255,120));          -- diffuse color yellow
      world.lighttype(1,1);     
      world.specular(1,color.new(255,0,0))                  -- type: spotlight.
      world.lightattenuation(1,0,0.5,0);           -- light attenuations.
      world.lightdirection(1,0,0,0);                   -- direction of spotlight.
      world.lightposition(1,5,-5,13);   -- position of spotlight.          
      world.fog(1,0,color.new(0,0,0));    -- set fog.      
      world.lights(true);
      world.update();      
-------2
      world.lightenabled(2,true);                    -- enable light.
      world.lightambient(2,color.new(255,255,120));          -- ambient color yellow
      world.lightdiffuse(2,color.new(255,255,120));          -- diffuse color yellow
      world.lighttype(2,1);     
      world.specular(2,color.new(255,0,0))                  -- type: spotlight.
      world.lightattenuation(2,0,0.5,0);           -- light attenuations.
      world.lightdirection(2,0,0,0);                   -- direction of spotlight.
      world.lightposition(2,-5,0,18);   -- position of spotlight.          
      world.fog(2,0,color.new(0,0,0));    -- set fog.      
      world.lights(true);
      world.update();      
-------3
      world.lightenabled(3,true);                    -- enable light.
      world.lightambient(3,color.new(255,255,120));          -- ambient color yellow
      world.lightdiffuse(3,color.new(255,255,120));          -- diffuse color yellow
      world.lighttype(3,1);     
      world.specular(3,color.new(255,0,0))                  -- type: spotlight.
      world.lightattenuation(3,0,0.5,0);           -- light attenuations.
      world.lightdirection(3,0,-2,0);                   -- direction of spotlight.
      world.lightposition(3,0,-4,15);   -- position of spotlight.          
      world.fog(3,0,color.new(0,0,0));    -- set fog.      
      world.lights(true);
      world.update(); 

  
--Boucle conditionnele   
while true do  
  screen:clear(color.new(0,0,255))
  controls.read()
--Music
 if sound.playing(theme) == false then
    sound.play(theme,1) 
 end

--On affiche les images  
image.blit(fond,0,0)
image.blit(fond2,0,0)

--Camera
  world.lookat({0,0,9},{0,0,0},{0,1,0})--rotation/position/angle XYZ de la camera

--Rotation
rot.y = rot.y + 0
rot.y = rot.y + 0.05
rot.z = rot.z + 0
--On affiche  
logo:position(0,-1.5,0)--Position en XYZ
logo:rotation(rot.x,rot.y,rot.z)--Rotation en XYZ encore
logo:blit()--On affiche l'invader en fonction de position et rotation

----START----
t = t + 1
if t >= 35 then
  screen.print(50,150,"Pressez START",2.5,rouge,noir)    
end
if t >= 55 then
  t = 0
end    
        
if controls.start() then
  fond:free()
  fond2:free()
  logo:free()
  dofile("Database/menu.lua")
end
----FIN----
  
screen.flip()
end--Fermeture de la B.C
   
