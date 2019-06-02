function pause()
if controls.press("start") then
 while 1 do  
  screen:clear()  
  controls.read()
  image.blit(0,0,pauseimg)
  --Music  
 if sound.playing(theme) == false then
    sound.play(theme,1) 
 end
  if controls.press("up") and selecteur >= 2 then
    selecteur = selecteur - 1
    sound.play(sonselecteur,2)
  end  
  if controls.press("down") and selecteur <= 3 then
    selecteur = selecteur + 1
    sound.play(sonselecteur,2)
  end  

  draw.fillrect(10,95,250,15,color.new(255,255,255));
  if selecteur == 1 then
    screen.print(10,100,"Continuer",1.2,noir,blanc)
    screen.print(10,120,"Redemarer",0.9,noir,blanc)
    if controls.press("cross") then
      break
    end  
  end    
  if selecteur == 2 then
    screen.print(10,80,"Continuer",0.9,noir,blanc)
    screen.print(10,100,"Redemarer",1.2,noir,blanc)
    screen.print(10,120,"Revenir au menu",0.9,noir,blanc)
    if controls.press("cross") then
      dofile("Database/jeu.lua")      
    end  
  end  
  if selecteur == 3 then
    screen.print(10,80,"Redemarer",0.9,noir,blanc)
    screen.print(10,100,"Revenir au menu",1.2,noir,blanc)    
    screen.print(10,120,"Quitter le jeu",0.9,noir,blanc)        
    if controls.press("cross") then
      dofile("Database/menu.lua")
    end  
  end  
  if selecteur == 4 then
    screen.print(10,80,"Revenir au menu",0.9,noir,blanc)    
    screen.print(10,100,"Quitter le jeu",1.2,noir,blanc)        
    if controls.press("cross") then
      os.quit()
    end  
  end  
  screen:flip()
  end
end
end


function animrun()
if perso.basketleft.stade == 1 then
  if perso.basketleft.z <= 1 then
    perso.basketleft.z = perso.basketleft.z + 0.15
  end
  if perso.basketleft.z >= 1 then      
    perso.basketleft.stade = 0
  end
end
if perso.basketleft.stade == 0 then  
  if perso.basketleft.z >= -1 then
    perso.basketleft.z = perso.basketleft.z - 0.15
  end
  if perso.basketleft.z <= -1 then      
    perso.basketleft.stade = 1
  end
end  
if perso.basketright.stade == 1 then  
  if perso.basketright.z <= 1 then
    perso.basketright.z = perso.basketright.z + 0.15
  end
  if perso.basketright.z >= 1 then      
    perso.basketright.stade = 0
  end
end
if perso.basketright.stade == 0 then  
  if perso.basketright.z >= -1 then
    perso.basketright.z = perso.basketright.z - 0.15
  end
  if perso.basketright.z <= -1 then      
    perso.basketright.stade = 1
  end
end  
--Affichage
persomodele:rotation(perso.rotx,perso.roty,perso.rotz)--Rotation en XYZ encore    
persomodele:position(perso.colonne-2,perso.y,perso.z)--Position en XYZ
persomodele:blit()  
  
persobasketmodel:rotation(0,1.55,0)--Rotation en XYZ encore    
persobasketmodel:position(perso.colonne-2+0.5,perso.y-0.5,perso.z + perso.basketright.z)--Position en XYZ
persobasketmodel:blit()  

persobasketmodel:rotation(0,1.55,0)--Rotation en XYZ encore      
persobasketmodel:position(perso.colonne-2-0.5,perso.y-0.5,perso.z + perso.basketleft.z)--Position en XYZ
persobasketmodel:blit()  
end
--SAVE--
mainconfigtable = { gameid="Xonergy", savenames = "Profil" };
mainconfigvsh = { title="Xonergy", subtitle="Profil utilisateur", details="Sauvegarde de Xonergy", savetext="Fichiers essenciels", icon0="Images/Interface/pict1.png", saveicon="Images/Interface/ICON0.png" };
historyconfigtable = { gameid="Xonergy", savenames = { "Profil1" } };
historyconfigvsh = { title="Xonergy", subtitle=os.date(), details="Donee de sauvegarde", savetext ="", icon0="Images/Interface/PICT1.png", saveicon="Images/Interface/ICON0.png.png", snd0="Sons/snd0.at3" };
function sauvegarde() 
  local bestscore = bestscore;
  local argent = argent
  local viemax = viemax
  local data = "bestscore="..bestscore..";argent="..argent..";viemax="..viemax..";"
  local a,b = savedata.save(mainconfigtable,mainconfigvsh,data);
end

function opensauvegarde()
  local a,b,c = savedata.autoload(mainconfigtable);
  argent = 0
  bestscore = 0
  viemax = 5
  if (a) then
    local t = c:explode(";");
    for i=1,#t do
      local f = t[i]:explode("=");
      if (f[1] == "bestscore" ) then 
        bestscore = tonumber(f[2]);       
      end
      if (f[1] == "argent" ) then 
        argent = tonumber(f[2]);       
      end
      if (f[1] == "viemax" ) then 
        viemax = tonumber(f[2]);       
      end
    end
  end
end

