local gg = gg
local die = os.exit

-- credits to https://gameguardian.net/forum/files/file/2676-hex-converter/ 

function Home()
	debug = -1
	
	local menu = gg.choice({
		"Hex to dec",
		"Dec to hex",
		"[ ❌ ] Exit",
		}, 0, "𝗛𝗘𝗫 𝗣𝗟𝗨𝗦 ʙᴇᴛᴀ")
	if menu == 1 then Hex2Dec() end
	if menu == 2 then Dec2Hex() end
	if menu == 3 then die() end
end


function Hex2Dec()
	debug = -1
	
	local ask = gg.prompt({
		"Type hex value",
		}, {'eg : 472e68f'}, {'text'})
	if ask == nil then gg.setVisible(false) return nil end

	local dec = tonumber("0x" .. ask[1])
	if dec == nil then gg.alert("Only hex digit(s) are allowed.") return nil end
	if dec < 0 then gg.alert("hex value not supported. \nmax = " .. "7FFFFFFFFFFFFFFF") return nil end
	
	local result = string.format("%X  =>  %d", dec, dec)
	local alert = gg.alert(result, "Ok", "Copy", "Restart")
	if alert == 2 then gg.copyText(dec) end
	if alert == 3 then Hex2Dec() end
end



function Dec2Hex()
	debug = -1
	
	local ask = gg.prompt({
		"Type decimal value",
		}, {'eg : 3000'}, {'text'})
	if ask == nil then gg.setVisible(false) return nil end
	
	local dec = tonumber(ask[1])
	if dec == nil then gg.alert("Only decimal digit(s) are allowed.") return nil end
	if dec > math.maxinteger then gg.alert("number not supported. \nmax = " .. math.maxinteger) return nil end
	
	local result = string.format("%d  =>  %X", dec, dec)
	local alert = gg.alert(result, "Ok", "Copy", "Restart")
	if alert == 2 then gg.copyText(string.match(result, ">(.*)")) end
	if alert == 3 then Dec2Hex() end
end


-- == Script config
while true do
	if gg.isVisible(true) then
		gg.setVisible(false) debug = 1
	end
	if debug == 1 then
		Home() gg.toast("mλλrs tools")
	end
end
