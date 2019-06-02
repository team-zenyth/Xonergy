--///////////////////////////////////////////////////////////////--
--/                                                             /--
--/  UDAPTE CUBY                                                /--
--/                                                             /--
--/  /!\ DO NOT REPRODUCE THIS CODE, FUNCTION,CLASS AS YOUR OWN /-- 
--/                                                             /--
--/                                                             /--
--///////////////////////////////////////////////////////////////--


result = pge.file.exists("ms0:/PSP/GAME/Zenyth Online/EBOOT.PBP")
if result == true then
model = "ms0"
else model = "ef0"
end
result = nil



---------------------------------------------------
-----Function by Applelo, Connect Network PGE------
---------------------------------------------------
function network()
-- Init net and check success
if not pge.net.init() then
  error("Error on net init.")
end
-- Init net dialog and check success
if not pge.utils.netinit() then
  error("Error on net dialog init.")
end
while true do
pge.controls.update()
pge.gfx.startdrawing()
pge.gfx.clearscreen()
--A remplir
pge.gfx.enddrawing()
state = pge.utils.netupdate()
if state == 0 then
    -- Connecter
break
elseif state == 1 then
    -- L'utilisateur à quitter
    pge.net.shutdown()
    break
  elseif state ~= PGE_UTILS_DIALOG_RUNNING then
    -- Erreur interne
    pge.net.shutdown()
    break
  end
pge.gfx.swapbuffers()
end
return
end


---------------------------------------------------
----Function by Applelo, Download file with PGE----
---------------------------------------------------
function download(a,b,c,d)
while pge.running() do
pge.controls.update()
pge.gfx.startdrawing()
pge.gfx.clearscreen()
--A remplir
if pge.net.isconnected() then
--Text download a rempir donc
else
--Texte pas de connect, problème
end
pge.gfx.enddrawing()
pge.gfx.swapbuffers()

if pge.net.isconnected() then
if c == true then
pge.file.remove(d)
end
pge.net.getfile(a,b)
pge.gfx.startdrawing()
pge.gfx.clearscreen()
--Apuyer sur start, on peux l'enlever
pge.gfx.enddrawing()
pge.gfx.swapbuffers()
    -- Loop until START pressed
    while not pge.controls.pressed(PGE_CTRL_CROSS) do
      pge.controls.update()
    end

    break

  end

  -- If START pressed, end
  if pge.controls.pressed(PGE_CTRL_CROSS) then
pge.gfx.clearscreen()
    return
  end
end
end

---------------------------------------------------
-----Function by Applelo, OSK Message Sony PGE-----
---------------------------------------------------
function system_message(text_message)
if not pge.utils.msginit(text_message) then
	error("Error on msgdialog init.")
end
enabled = true
pressed = -1
while pge.running() do
	pge.controls.update()
	pge.gfx.startdrawing()
	pge.gfx.clearscreen()
--mettre un fond ^^
	pge.gfx.enddrawing()
	if enabled then
		-- pge.utils.msgupdate() must be called after pge.gfx.enddrawing(), but before pge.gfx.swapbuffers()
		pressed = pge.utils.msgupdate()
		if pressed == PGE_UTILS_MSG_DIALOG_RESULT_BACK then
		enabled = nil
pressed = nil
		return
		end
	end
	-- Swap buffers
	pge.gfx.swapbuffers()
end
end


network()


while pge.running() do
pge.gfx.startdrawing()
pge.controls.update()
pge.gfx.startdrawing()
pge.gfx.clearscreen()


pge.gfx.enddrawing()
pge.gfx.swapbuffers()
end