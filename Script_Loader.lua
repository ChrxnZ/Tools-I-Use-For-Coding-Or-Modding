local gg, die = gg, os.exit
local slowdown = function () gg.sleep(500) end

-- credits to https://gameguardian.net/forum/files/file/2661-script-loader/

local configFile = gg.EXT_FILES_DIR .. '/smart_loader_save.lua.cfg'
local scripts
local loaderMenu = {}
local alert


function LoadSavedList()
	debug = -1
	slowdown()
	scripts = {['name'] = {}, ['path'] = {}}
	local data = loadfile(configFile)
	if data ~= nil then
		data = data()
		if (type(data)) == 'table' then
			for k, v in ipairs (data.path) do
				if not loadfile(v) then
					table.remove(data.path, k)
					table.remove(data.name, k)
				end
			end
			scripts = data
			gg.saveVariable(scripts, configFile)
			gg.alert(#scripts.path .. ' script(s) loaded from the saved list')
		end
	end
end
LoadSavedList()


function AddScript()
	local ask = gg.prompt({
		"[ 📁 ] Select File to upload :\n➣ By uploading a file to a server all users will be able to use it",
	},{'/sdcard'},{'file'})
	if ask == nil then return nil end
	
	local split = {}
	local path = ask[1] .. '/'
	for str in path:gmatch '.-/' do
		str = str:gsub('/', '')
		table.insert(split, str)
	end

	if not (loadfile(ask[1])) or not (split[#split]:match '.lua') then
		gg.alert('`' .. split[#split] .. '` contain error(s) or is not a lua file')
		return nil
	end
	table.insert(scripts.path, ask[1])
	table.insert(scripts.name, split[#split])
	gg.saveVariable(scripts, configFile)
end


function RemoveScript()
	debug = -1
	slowdown()
	
	while true do
		local removeMenu = {}
		for i=1, #scripts.name do
			local name = table.unpack(scripts.name, i)
			removeMenu[i] = '[ 🗑️ ] ' .. name
		end
		table.insert(removeMenu, '[ ↪️ ] Return')
		
		local description = #removeMenu > 1 and "" or "No script(s) loaded" 
		local menu = gg.choice(removeMenu, 0, description)
		if menu == #removeMenu or menu == nil then
			break
		end
		alert = gg.alert('Remove `' .. scripts.name[menu] .. '` ?', 'No', 'Yes')
		if alert == 2 then
			table.remove(scripts.path, menu)
			table.remove(scripts.name, menu)
			gg.saveVariable(scripts, configFile)
			LoadSavedList()
		end
	end
end


function ClearConfig()
	debug = -1
	slowdown()
	alert = gg.alert('Are you sure to clear the saved list ?', 'No', 'Yes')
	if alert == 2 then
		slowdown()
		local f = io.open(configFile, 'w')
		f:close()
		gg.alert('Saved list cleared 🗑️')
		LoadSavedList()
	end
end


function Settings()
	debug = -1
	slowdown()
	local menu = gg.choice({
		"[ 📂 ] Add Script",
		"[ ⛔ ] Remove Script",
		"[ 🗑️ ] Clear Saved List",
		"[ ❌ ] Exit"
	}, 0, "")
	if menu == nil then return nil end
	if menu == 1 then AddScript() end
	if menu == 2 then RemoveScript() end
	if menu == 3 then ClearConfig() end
	if menu == 4 then die() end
end


function UpdateMenu()
	debug = -1
	loaderMenu = {}
	if #scripts.name > 0 then
		for i=1, #scripts.name do
			local name = table.unpack(scripts.name, i)
			loaderMenu[i] = '[ ' .. i .. ' ] ' .. name .. '\n'
		end
	end
	table.insert(loaderMenu, "[ ⚙️ ] Settings")
end


function Loader()
	debug = -1
	UpdateMenu()
	local description = #loaderMenu > 1 and "" or "No script(s) loaded"
	local menu = gg.choice(loaderMenu, 0, description)
	if menu == nil then return nil end
	if menu == #loaderMenu then
		Settings(); return nil
	end
	gg.setVisible(true)
	pcall(loadfile(scripts.path[menu]))
end




-- == Script config
while true do
	if gg.isVisible(true) then
		gg.setVisible(false) debug = 1
	end
	if debug == 1 then Loader() end
end
