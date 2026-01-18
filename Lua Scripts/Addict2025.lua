-- Addict Script™ Copyright© 2025

--[[] -- Coded By Candy
WE HAVE TAKEN OVER░ \☻/\☻/
░░░░░░░░░░░░░░░░░░░▌░ ▌
░░░░░░░░░░░░░░░░░░ / \░ / \
░░░░░░░░░░░░░░░░░███████ ]▄▄▄▄▄▄▄▄▄-----------●
░░░░░░░░░░░░▂▄▅█████████▅▄▃▂
░░░░░░░░░░░I███████████████████].
]]

-- Credits 🧐🔽🔽🔽
local Credits_To = {
    "Min",
    "CoalwiX",
    "0xDEADBEEF",
}
-- Credits 🧐🔼🔼🔼

util.keep_running()

local addict = menu
local addict_version = 1.1
local dev_mode = false -- Disables stuff like Updates [true/false]

util.require_no_lag("natives-1663599433")

local github = addict.list(addict.my_root(), "Updates", {"addictupdates"})

addict.hyperlink(github, "Addict Discord", "https://discord.gg/RHvG3XdTmx")
addict.hyperlink(github, "Github Change Log", "https://github.com/Addict0919/2025AddictScript/blob/main/2025AddictScript/AddictScriptChangelog.LUA")

async_http.init("raw.githubusercontent.com","/Addict0919/2025AddictScript/main/2025AddictScript/AddictScriptChangelog.LUA",function(b)
    response=true;
    addict.action(github, "Change Log", {"addictchangelog"}, b, function() end)
end,
function()
    response=true 
end)

async_http.dispatch()

--[[
repeat util.yield()
until response 
if not dev_mode then
    async_http.init("raw.githubusercontent.com","/Addict0919/2025AddictScript/main/2025AddictScript/AddictScriptVersion.LUA",function(b)
        currentVer=tonumber(b)
        response=true;
        if addict_version~=currentVer then 
                util.toast("New Version found")async_http.init('raw.githubusercontent.com','/Addict0919/2025AddictScript/main/2025AddictScript/Addict2025.lua',function(c)
                    local d=select(2,load(c))
                    if d then 
                        util.toast("Update failed to download, please re-download manually via Github or using Addict Discord Server.")
                        return 
                    end;
                    local e=io.open(filesystem.scripts_dir()..SCRIPT_RELPATH,"wb")
                    e:write(c)
                    e:close()
                    util.toast("Update Done!")
                    util.restart_script()
                end)
                async_http.dispatch()
        end 
    end,
    function()
        response=true 
    end)
    async_http.dispatch()
    repeat util.yield()
    until response 
end
]]

resources_dir = filesystem.resources_dir() .. '\\Addictscript\\'
Addictscript_logo = directx.create_texture(resources_dir .. 'Addictscript_logo.png')

if not filesystem.is_dir(resources_dir) then
end

if not SCRIPT_SILENT_START then
    logo_alpha = 0
    logo_alpha_incr = 0.02
    logo_alpha_thread = util.create_thread(function (thr)
        while true do
            logo_alpha = logo_alpha + logo_alpha_incr
            if logo_alpha > 1 then
                logo_alpha = 1
            elseif logo_alpha < 0 then 
                logo_alpha = 0	
            end
        util.yield()
    end
end)

    logo_thread = util.create_thread(function (thr)
        starttime = os.clock()
        local alpha = 0
        while true do
            directx.draw_texture(Addictscript_logo, 0.15, 0.10, 0.5, 0.7, 0.5, 0.5, 0, 1, 1, 1, logo_alpha)
            timepassed = os.clock() - starttime
            if timepassed > 1 then
                logo_alpha_incr = -0.01
            end
            if logo_alpha == 0 then
            end
            util.yield()
        end
    end)
end

 -- Text Used By This Website: https://fsymbols.com/text-art/
util.log("───────────────────────────────────────────────────────────────────────────────────────")
util.log("─██████████████─████████████───████████████───██████████─██████████████─██████████████─")
util.log("─██░░░░░░░░░░██─██░░░░░░░░████─██░░░░░░░░████─██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─")
util.log("─██░░██████░░██─██░░████░░░░██─██░░████░░░░██─████░░████─██░░██████████─██████░░██████─")
util.log("─██░░██──██░░██─██░░██──██░░██─██░░██──██░░██───██░░██───██░░██─────────────██░░██─────")
util.log("─██░░██████░░██─██░░██──██░░██─██░░██──██░░██───██░░██───██░░██─────────────██░░██─────")
util.log("─██░░░░░░░░░░██─██░░██──██░░██─██░░██──██░░██───██░░██───██░░██─────────────██░░██─────")
util.log("─██░░██████░░██─██░░██──██░░██─██░░██──██░░██───██░░██───██░░██─────────────██░░██─────")
util.log("─██░░██──██░░██─██░░██──██░░██─██░░██──██░░██───██░░██───██░░██─────────────██░░██─────")
util.log("─██░░██──██░░██─██░░████░░░░██─██░░████░░░░██─████░░████─██░░██████████─────██░░██─────")
util.log("─██░░██──██░░██─██░░░░░░░░████─██░░░░░░░░████─██░░░░░░██─██░░░░░░░░░░██─────██░░██─────")
util.log("─██████──██████─████████████───████████████───██████████─██████████████─────██████─────")
util.log("───────────────────────────────────────────────────────────────────────────────────────")
 

if not dev_mode then
    util.log("Welcome to Addict Script! V" .. addict_version .. "\n" .. "\n" .. "Check discord for updates...\n" .. "\n" .. "Enjoy Playing :)")
    util.toast("Welcome to Addict Script! V" .. addict_version .. "\n" .. "\n" .. "Check discord for updates...\n" .. "\n" .. "Enjoy Playing :)")
else
    util.log("Welcome to Addict Script! V" .. addict_version .. "\n" .. "\n" .. "Check discord for updates...\n" .. "\n" .. "Enjoy Playing :)")
    util.toast("Welcome to Addict Script! V" .. addict_version .. "\n" .. "\n" .. "Check discord for updates...\n" .. "\n" .. "Enjoy Playing :)")
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Credits List

local Credits = addict.list(addict.my_root(), "Credits", {""}, "")
---------------------------------------------------------------------------------
addict.divider(Credits, "Great Coders <3")
---------------------------------------------------------------------------------
addict.action(Credits, "0xDEADBEEF", {}, "Helped with tons of suggestions, testing and sharing his own code:)", function() end)
addict.action(Credits, "Min", {}, "Great coder helped with code, security and testing :).", function() end)
addict.action(Credits, "CoalwiX", {}, "Developer of coalwix top guy for supporting me and promoting this lua :)", function() end)
addict.action(Credits, "Unseemly", {}, "Great coder wouldn't even have an auto updater or certain mods fixed if it wasn't for this guy <3.", function() end)
addict.action(Credits, "Cystal", {}, "Very smart coder helped with mods I gave up on.", function() end)
addict.action(Credits, "Legy", {}, "Very smart guy great lua coder with cool suggestions.", function() end)
addict.action(Credits, "Chaos", {}, "Great guy supported me with everything to keep the script running otherwise I would of gave up coding publicly.", function() end)
addict.action(Credits, "Wigger", {}, "Codes very well!, very smart guy always has an answer for me :).", function() end)
addict.action(Credits, "Glitter", {}, "Known for a long time since I first played gta <3.", function() end)
addict.action(Credits, "Nosa", {}, "Known for a long time very smart guy. Helped me with code and suggestions.", function() end)
addict.action(Credits, "Jailbroken", {}, "Cool guy very fast learner, unlike some people (no names) PRISHUM.", function() end)
 
-- Script Addict Header 

local translations = {}
setmetatable(translations, {
    __index = function (self, key)
        return key
    end
})

local festive_div = addict.divider(addict.my_root(), "Addict Script")
local loading_frames = {'!', '! !', '! ! !', '! ! ! !', ' ! ! ! ! ! ! ! ! !', '! ! ! !', '! ! !', '! !', '!'}
util.create_tick_handler(function()
    for _, frame in pairs(loading_frames) do
        addict.set_menu_name(festive_div, frame .. ' ' .. translations.Addict_Script .. ' ' .. frame)
        util.yield(100)
    end
end)
 
------------------------------------------------------------------------------------------------------------------------------------------

--[[
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─██████████████─██████──██████─██████──────────██████─██████████████─██████████████─██████████─██████████████─██████──────────██████─██████████████─
─██░░░░░░░░░░██─██░░██──██░░██─██░░██████████──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░██─██░░░░░░░░░░██─██░░██████████──██░░██─██░░░░░░░░░░██─
─██░░██████████─██░░██──██░░██─██░░░░░░░░░░██──██░░██─██░░██████████─██████░░██████─████░░████─██░░██████░░██─██░░░░░░░░░░██──██░░██─██░░██████████─
─██░░██─────────██░░██──██░░██─██░░██████░░██──██░░██─██░░██─────────────██░░██───────██░░██───██░░██──██░░██─██░░██████░░██──██░░██─██░░██─────────
─██░░██████████─██░░██──██░░██─██░░██──██░░██──██░░██─██░░██─────────────██░░██───────██░░██───██░░██──██░░██─██░░██──██░░██──██░░██─██░░██████████─
─██░░░░░░░░░░██─██░░██──██░░██─██░░██──██░░██──██░░██─██░░██─────────────██░░██───────██░░██───██░░██──██░░██─██░░██──██░░██──██░░██─██░░░░░░░░░░██─
─██░░██████████─██░░██──██░░██─██░░██──██░░██──██░░██─██░░██─────────────██░░██───────██░░██───██░░██──██░░██─██░░██──██░░██──██░░██─██████████░░██─
─██░░██─────────██░░██──██░░██─██░░██──██░░██████░░██─██░░██─────────────██░░██───────██░░██───██░░██──██░░██─██░░██──██░░██████░░██─────────██░░██─
─██░░██─────────██░░██████░░██─██░░██──██░░░░░░░░░░██─██░░██████████─────██░░██─────████░░████─██░░██████░░██─██░░██──██░░░░░░░░░░██─██████████░░██─
─██░░██─────────██░░░░░░░░░░██─██░░██──██████████░░██─██░░░░░░░░░░██─────██░░██─────██░░░░░░██─██░░░░░░░░░░██─██░░██──██████████░░██─██░░░░░░░░░░██─
─██████─────────██████████████─██████──────────██████─██████████████─────██████─────██████████─██████████████─██████──────────██████─██████████████─
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
]]

---@alias Entity integer
---@param entity Entity
---@param distance number
---@return userdata
GetCoordsInFrontOfEntity = function(entity, distance)
	if not ENTITY.DOES_ENTITY_EXIST(entity) then
		return v3.new(0.0, 0.0, 0.0)
	end
	local coords = ENTITY.GET_ENTITY_FORWARD_VECTOR(entity)
	coords:mul(distance)
	coords:add(ENTITY.GET_ENTITY_COORDS(entity, true))
	return coords
end

---@param entity Entity
RequestControl = function(entity, timeOut)
	timeOut = timeOut or 1000
	local start = util.current_time_millis()
	while not NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity) and
	util.current_time_millis() - start < timeOut do
		util.yield_once()
	end
	return util.current_time_millis() - start < timeOut
end

local function ChangeNetObjOwner(object, player)
    if NETWORK.NETWORK_IS_IN_SESSION() then
        local net_object_mgr = get_player_vehicle(pid, false)
        if net_object_mgr == NULL then
            return false
        end
        if not ENTITY.DOES_ENTITY_EXIST(object) then
            return false
        end
        local netObj = entities.get_all_vehicles_as_handles()
        if netObj == NULL then
            return false
        end
        local net_game_player = players.user()
        if net_game_player == NULL then
            return false
        end
        return true
    else
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(object)
        return true
    end
end

--Memory Functions

orgScan = memory.scan
function myModule(name, pattern, callback)
    local address = orgScan(pattern)
    if address ~= NULL then
        util.log("Found " .. name)
        callback(address)
    else
        util.log("Failed to find " .. name)
        util.stop_script()
    end
end

myModule("ChangeNetObjOwner", "48 8B C4 48 89 58 08 48 89 68 10 48 89 70 18 48 89 78 20 41 54 41 56 41 57 48 81 EC ? ? ? ? 44 8A 62 4B", function (address)
    ChangeNetObjOwner_addr = address
end)


function request_anim_dict(dict)
    while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do
        STREAMING.REQUEST_ANIM_DICT(dict)
        util.yield()
    end
end

function request_model(hash, timeout)
    timeout = timeout or 3
    STREAMING.REQUEST_MODEL(hash)
    local end_time = os.time() + timeout
    repeat
        util.yield()
    until STREAMING.HAS_MODEL_LOADED(hash) or os.time() >= end_time
    return STREAMING.HAS_MODEL_LOADED(hash)
end

function RequestModel(Hash, timeout)
    STREAMING.REQUEST_MODEL(Hash)
    local time = util.current_time_millis() + (timeout or 1000)
    while time > util.current_time_millis() and not STREAMING.HAS_MODEL_LOADED(Hash) do
        util.yield()
    end
    return STREAMING.HAS_MODEL_LOADED(Hash)
end

function get_model_size(hash)
    local minptr = memory.alloc(24)
    local maxptr = memory.alloc(24)
    local min = {}
    local max = {}
    MISC.GET_MODEL_DIMENSIONS(hash, minptr, maxptr)
    min.x, min.y, min.z = v3.get(minptr)
    max.x, max.y, max.z = v3.get(maxptr)
    local size = {}
    size.x = max.x - min.x
    size.y = max.y - min.y
    size.z = max.z - min.z
    size['max'] = math.max(size.x, size.y, size.z)
    return size
end

function request_control_of_entity_once(ent)
    if ent ~= 0 and ENTITY.DOES_ENTITY_EXIST(ent) then
        if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) and util.is_session_started() then
            local netid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(ent)
            NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netid, true)
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
        end
    end
end

function max_out_car(veh)
    for i=0, 47 do
        num = VEHICLE.GET_NUM_VEHICLE_MODS(veh, i)
        VEHICLE.SET_VEHICLE_MOD(veh, i, num -1, true)
    end
end

function is_ped_player(ped)
    if PED.GET_PED_TYPE(ped) >= 4 then
        return false
    else
        return true
    end
end

function get_ground_z(coords)
    start_time = os.time()
    while true do
        if os.time() - start_time >= 5 then
            util.log("Failed to get ground Z in 5 seconds.")
            return nil
        end
        success, est = util.get_ground_z(coords['x'], coords['y'], coords['z']+2000)
        if success then
            return est
        end
        util.yield()
    end
end

function get_waypoint_coords()
    coords = HUD.GET_BLIP_COORDS(HUD.GET_FIRST_BLIP_INFO_ID(8))
    if coords['x'] == 0 and coords['y'] == 0 and coords['z'] == 0 then
        return nil
    else
        estimate = get_ground_z(coords)
        if estimate then
            coords['z'] = estimate
        end
        return coords
    end
end

function candy_paint(player)
    addict.trigger_commands("perfwithspoiler")
    addict.trigger_commands("vehprimaryred" .. " 80")
    addict.trigger_commands("vehprimarygreen" .. " 0")
    addict.trigger_commands("vehprimaryblue" .. " 255")
    local Chrome_Paint_Primary = addict.ref_by_path("Vehicle>Los Santos Customs>Appearance>Primary Colour>Finish>Chrome")
    util.yield(500)
    addict.trigger_command(Chrome_Paint_Primary)
    local Chrome_Paint_Secondary = addict.ref_by_path("Vehicle>Los Santos Customs>Appearance>Secondary Colour>Finish>Chrome")
    addict.trigger_commands("vehsecondaryred" .. " 80")
    addict.trigger_commands("vehsecondarygreen" .. " 0")
    addict.trigger_commands("vehsecondaryblue" .. " 255")
    util.yield(500)
    addict.trigger_command(Chrome_Paint_Secondary)
    VEHICLE.SET_VEHICLE_WINDOW_TINT(vehicle, 1)
    VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "xCandyx")
end

function get_my_driver()
    local vehicle = entities.get_user_vehicle_as_handle()
    local entity = ENTITY.GET_ENTITY_ATTACHED_TO(vehicle)
    if entity > 0 and ENTITY.IS_ENTITY_A_VEHICLE(entity) then
        local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(entity, -1)
        if driver > 0 then
            return driver, entity
        end
    end
    return VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1), vehicle
end

function setup_choose_player_addict(rootaddict, addictList, callback, pid)
    addict.on_focus(rootaddict, function(_)
        for _, m in ipairs(addictList) do
            addict.delete(m)
        end
        addictList = {}
        local cur_players = players.list(true, true, true)
        local my_pid = players.user()
        for _, target_pid in ipairs(cur_players) do
            local name = PLAYER.GET_PLAYER_NAME(target_pid)
            if pid ~= nil and target_pid == pid then
                name = name .. " (" .. ("Them") .. ")"
            elseif target_pid == my_pid then
                name = name .. " (" .. ("M") .. ")"
            end
            local m = callback(target_pid, name)
            table.insert(addictList, m)
        end
    end)
end

function get_player_vehicle(pid, with_access)
    local player_index = player_index(pid)
    if PED.IS_PED_IN_ANY_VEHICLE(player_index, true) then
        local vehicle = PED.GET_VEHICLE_PED_IS_IN(player_index, false)
        if with_access then
            request_control_of_entity(vehicle, 5)
            return vehicle
        else
            return vehicle
        end
    end
end

function get_closest_vehicle(coords)
    vehicles = entities.get_all_vehicles_as_handles()
    closest, closestDist = nil, 9999.0
    for _, veh in ipairs(vehicles) do
        if veh ~= 0 and ENTITY.DOES_ENTITY_EXIST(veh) then
            pos = ENTITY.GET_ENTITY_COORDS(veh)
            dist = MISC.GET_DISTANCE_BETWEEN_COORDS(coords.x, coords.y, coords.z, pos.x, pos.y, pos.z, true)
            if dist < closestDist then
                closestDist = dist
                closest = veh
            end
        end
    end
    return closest, closestDist
end

    function get_closest_ped_new(coords)
    closest = nil
    closest_dist = 1000000
    this_dist = 0
    for _, ped in pairs(entities.get_all_peds_as_handles()) do 
        this_dist = v3.distance(coords, ENTITY.GET_ENTITY_COORDS(ped))
        if this_dist < closest_dist and not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_FATALLY_INJURED(ped)  and not PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
            closest = ped
            closest_dist = this_dist
        end
    end
    if closest ~= nil then 
        return {closest, closest_dist}
    else
        return nil 
    end
end

---@param list Entity[]
ClearEntities = function(list)
	for _, entity in ipairs(list) do
		if ENTITY.DOES_ENTITY_EXIST(entity) then
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(entity, false, false)
			RequestControl(entity)
			entities.delete_by_handle(entity)
		end
	end
end

function GetLocalPed()
    return PLAYER.PLAYER_PED_ID()
end

function attachto(offx, offy, offz, pid, angx, angy, angz, hash, isnpc, isveh)
        atomicattachto = util.create_thread(function(thr)
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local coords = ENTITY.GET_ENTITY_COORDS(ped, true)
            coords.x = coords['x']
            coords.y = coords['y']
            coords.z = coords['z']
            if isnpc then
                obj = entities.create_ped(1, hash, coords, 90.0)
            elseif isveh then
                obj = entities.create_vehicle(hash, coords, 90.0)
            else
                obj = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, coords['x'], coords['y'], coords['z'], true, false, false)
            end
            ENTITY.SET_ENTITY_INVINCIBLE(obj, true)
            ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(obj, false, true)
                while true do
                    local player_coords = ENTITY.GET_ENTITY_COORDS(ped, false)
                    local obj_coords = ENTITY.GET_ENTITY_COORDS(obj, false)
                    local dist =  MISC.GET_DISTANCE_BETWEEN_COORDS(player_coords['x'], player_coords['y'], player_coords['z'], obj_coords['x'], obj_coords['y'], obj_coords['z'], false)
                    if dist > 0.1 then
                        local behind = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, offx, offy, offz)
                        ENTITY.SET_ENTITY_COORDS(obj, behind['x'], behind['y'], behind['z'], false, false, false, false)
                    end
                    if not stopato then
                    util.stop_thread()
                    if not ENTITY.DOES_ENTITY_EXIST(obj) then
                    end
                    attachto(offx, offy, offz, pid, angx, angy, angz, hash, isnpc, isveh)
                    end
                    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                    if not players.exists(pid) then
                        util.toast(aatoast)
                        util.stop_thread()
                    else
                    end
                    util.yield()
                end
            end)
        end
        
function requestModels(...)
	local arg = {...}
	for _, model in ipairs(arg) do
		if not STREAMING.IS_MODEL_VALID(model) then
			error("tried to request an invalid model")
		end
		STREAMING.REQUEST_MODEL(model)
		while not STREAMING.HAS_MODEL_LOADED(model) do
			util.yield()
		end
	end
end

function request_control_of_entity(ent)
    if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) and util.is_session_started() then
        util.toast("Requesting entity control of " .. ent)
        local netid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(ent)
        NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netid, true)
        local st_time = os.time()
        while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) do
            if os.time() - st_time >= 5 then
                util.toast("Failed to request entity control in 5 seconds (entity " .. ent .. ")")
                break
            end
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
            util.yield()
        end
    end
end

function RqModel(hash)
    STREAMING.REQUEST_MODEL(hash)
    local count = 0
    util.toast("Requesting model...")
    while not STREAMING.HAS_MODEL_LOADED(hash) and count < 100 do
        STREAMING.REQUEST_MODEL(hash)
        count = count + 1
        util.yield(10)
    end
    if not STREAMING.HAS_MODEL_LOADED(hash) then
        util.toast("Tried for 1 second, couldn't load this specified model!")
    end
end

    function entity_fuck(pid)
        while true do
        for _, entity in ipairs(entities.get_all_objects_as_handles(entities.get_all_vehicles_as_handles(entities.get_all_peds_as_handles()))) do
            if ENTITY.DOES_ENTITY_EXIST(entity) and not ENTITY.IS_ENTITY_A_MISSION_ENTITY(entity) and not PED.IS_PED_A_PLAYER(NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(entity)) then
                local entityCoords = ENTITY.GET_ENTITY_COORDS(entity)
                local height = 100.0
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, entityCoords.x + math.random(-100, 100), entityCoords.y + math.random(-100, 100), height)
                ENTITY.SET_ENTITY_VELOCITY(entity, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
                ENTITY.SET_ENTITY_MAX_SPEED(entity, 500.0)
                ENTITY.SET_ENTITY_ROTATION(entity, math.random(-180, 180), math.random(-180, 180), math.random(-180, 180), 0, 1)
                end
            end
            util.yield(1)
        end
    end

    function veh_entity_fuck(pid)
        while true do
        for _, entity in ipairs(entities.get_all_vehicles_as_handles()) do
            if ENTITY.DOES_ENTITY_EXIST(entity) and not ENTITY.IS_ENTITY_A_MISSION_ENTITY(entity) and not PED.IS_PED_A_PLAYER(NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(entity)) then
                local entityCoords = ENTITY.GET_ENTITY_COORDS(entity)
                local height = 100.0
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, entityCoords.x, entityCoords.y, height)
                ENTITY.SET_ENTITY_VELOCITY(entity, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
                ENTITY.SET_ENTITY_MAX_SPEED(entity, 500.0)
                ENTITY.SET_ENTITY_ROTATION(entity, math.random(-180, 180), math.random(-180, 180), math.random(-180, 180), 0, 1)
                end
            end
            util.yield(1)
        end
    end

	hole_zoff = 50

    function veh_entity_fly(pid)
        while true do
        for _, entity in ipairs(entities.get_all_vehicles_as_handles()) do
            if ENTITY.DOES_ENTITY_EXIST(entity) and not ENTITY.IS_ENTITY_A_MISSION_ENTITY(entity) and not PED.IS_PED_A_PLAYER(NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(entity)) then
                local entityCoords = ENTITY.GET_ENTITY_COORDS(entity)
                local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
                vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                speed = 100
                local x_vec = (holecoords['x']-vcoords['x'])*speed
                local y_vec = (holecoords['y']-vcoords['y'])*speed
                local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                ENTITY.SET_ENTITY_VELOCITY(entity, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
                ENTITY.SET_ENTITY_MAX_SPEED(entity, 500.0)
                ENTITY.SET_ENTITY_ROTATION(entity, math.random(-180, 180), math.random(-180, 180), math.random(-180, 180), 0, 1)
                end
            end
            util.yield(1)
        end
    end

    function obj_entity_fuck(pid)
        while true do
        for _, entity in ipairs(entities.get_all_objects_as_handles()) do
            if ENTITY.DOES_ENTITY_EXIST(entity) and not ENTITY.IS_ENTITY_A_MISSION_ENTITY(entity) and not PED.IS_PED_A_PLAYER(NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(entity)) then
                local entityCoords = ENTITY.GET_ENTITY_COORDS(entity)
                local height = 100.0
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, entityCoords.x, entityCoords.y, height)
                ENTITY.SET_ENTITY_VELOCITY(entity, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
                ENTITY.SET_ENTITY_MAX_SPEED(entity, 500.0)
                ENTITY.SET_ENTITY_ROTATION(entity, math.random(-180, 180), math.random(-180, 180), math.random(-180, 180), 0, 1)
                end
            end
            util.yield(1)
        end
    end

    function ped_entity_fuck(pid)
        while true do
        for _, entity in ipairs(entities.get_all_peds_as_handles()) do
            if ENTITY.DOES_ENTITY_EXIST(entity) and not ENTITY.IS_ENTITY_A_MISSION_ENTITY(entity) and not PED.IS_PED_A_PLAYER(NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(entity)) then
                local entityCoords = ENTITY.GET_ENTITY_COORDS(entity)
                local height = 100.0
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, entityCoords.x + math.random(-100, 100), entityCoords.y + math.random(-100, 100), height)
                ENTITY.SET_ENTITY_VELOCITY(entity, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
                ENTITY.SET_ENTITY_MAX_SPEED(entity, 500.0)
                ENTITY.SET_ENTITY_ROTATION(entity, math.random(-180, 180), math.random(-180, 180), math.random(-180, 180), 0, 1)
                end
            end
            util.yield(1)
        end
    end

    function pickup_entity_fuck(pid)
        while true do
        for _, entity in ipairs(entities.get_all_pickups_as_handles()) do
            if ENTITY.DOES_ENTITY_EXIST(entity) and not ENTITY.IS_ENTITY_A_MISSION_ENTITY(entity) and not PED.IS_PED_A_PLAYER(NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(entity)) then
                local entityCoords = ENTITY.GET_ENTITY_COORDS(entity)
                local height = 100.0
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, entityCoords.x + math.random(-100, 100), entityCoords.y + math.random(-100, 100), height)
                ENTITY.SET_ENTITY_VELOCITY(entity, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
                ENTITY.SET_ENTITY_MAX_SPEED(entity, 500.0)
                ENTITY.SET_ENTITY_ROTATION(entity, math.random(-180, 180), math.random(-180, 180), math.random(-180, 180), 0, 1)
                end
            end
            util.yield(1)
        end
    end
 
    local useforce = {
        184361638,
        1890640474,
        868868440,
    }

    function player_index(pid)
        local player_index = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        return player_index
    end

    player_coords = function(pid)
        local player_coords = ENTITY.GET_ENTITY_COORDS(player_index(pid), true)
        return player_coords
    end

    function TramLag(pid)
        for i, v in pairs(useforce) do
            request_stream_of_entity(v, 1)
        end
        for i = 1, 2 do
            local coords = player_coords(pid)
            coords.x = coords.x
            coords.y = coords.y + -30
            coords.z = coords.z
            vehicle1 = entities.create_vehicle(184361638, coords, 0.0)
            object = entities.create_object(1890640474, coords, 0.0)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle1, true, true)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, true, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
            ENTITY.SET_ENTITY_VISIBLE(object, true, 0)
            ENTITY.SET_ENTITY_VELOCITY(vehicle1, 5, 3, 3)
            ENTITY.SET_ENTITY_VELOCITY(object, 3, 4, 5)
            ENTITY.SET_ENTITY_ROTATION(object, math.random(0, 360), math.random(0, 360), math.random(0, 360), 0, true)
            for i = 1, 3 do
                ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, object, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                local vehicle2 = entities.create_vehicle(868868440, coords, 0.0)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle2, true, true)
                local ent_coords = ENTITY.GET_ENTITY_COORDS(object, true)
                FIRE.ADD_EXPLOSION(ent_coords.x, ent_coords.y, ent_coords.z, 0, 1.0, false, true, 0.0, false)
                ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle2, 1, 0, -100, 0, true, false, true)
                ENTITY.SET_ENTITY_VISIBLE(vehicle2, true, 0)
                util.yield(300)
                ENTITY.DETACH_ENTITY(vehicle1, object)
            end
        end
    end

--for oppressor blacklist
util.create_thread(function()
	while true do
		if oppressor_kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("oppressor2")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						addict.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

--for lazer blacklist
util.create_thread(function()
	while true do
		if lazer_kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("lazer")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						addict.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

--for kosatka blacklist
util.create_thread(function()
	while true do
		if kosatka_kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("kosatka")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						addict.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

--for hydra blacklist
util.create_thread(function()
	while true do
		if hydra_kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("hydra")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						addict.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

util.create_thread(function()
	while true do
		if khanjali_kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("khanjali")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						addict.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

function get_control_request(ent)
	if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) then
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
		local tick = 0
		while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) and tick <= 100 do
			tick = tick + 1
			util.yield()
			NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
		end
	end
	if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) then
		util.toast("No Control of "..ent)
	end
	return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent)
end

function get_random_ped()
    peds = entities.get_all_peds_as_handles()
    npcs = {}
    valid = 0
    for k,p in pairs(peds) do
        if p ~= nil and not is_ped_player(p) then
            table.insert(npcs, p)
            valid = valid + 1
        end
    end
    return npcs[math.random(valid)]
end

local function player_toggle_loop(root, pid, addict_name, command_names, help_text, callback)
    return addict.toggle_loop(root, addict_name, command_names, help_text, function()
        if not players.exists(pid) then util.stop_thread() end
        callback()
    end)
end

function wait_session_transition(yield_time)
    yield_time = yield_time or 1000

    while util.is_session_transition_active() do
        util.yield(yield_time)
    end
end

function for_table_do(table,with_access,func) -- <3 HoppaC4
	for i,ent in ipairs(table) do
		if with_access then
			if not RequestControlOfEnt(ent) then goto skip end
		end
		func(ent)
		::skip::
	end
end

function RequestControlOfEnt(entity)
	local tick = 0
	local tries = 0
	NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
	while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) and tick <= 1000 do
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
		tick = tick + 1
		tries = tries + 1
		if tries == 50 then 
			util.yield()
			tries = 0
		end
	end
	return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity)
end

DetachAll = function(entity)
    local objects = entities.get_all_objects_as_handles()
    for _, object in pairs(objects) do
        if ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(object, entity) then
            RequestControlOfEnt(object, true)
            ENTITY.DETACH_ENTITY(object, false, false)
            util.yield()
            entities.delete_by_handle(object)
        end
    end
end

function is_player_active(player, isPlaying, inTransition)
    if player == -1 or
    not NETWORK.NETWORK_IS_PLAYER_ACTIVE(player) then
        return false
    end
    if isPlaying and not PLAYER.IS_PLAYER_PLAYING(player) then
        return false
    end
    return true
end

local function get_distance(a, b)
    return math.sqrt((a.x - b.x)^2 + (a.y - b.y)^2 + (a.z - b.z)^2)
end

local randomModels = {
    vehicles = {
        "adder", "zentorno", "t20", "buffalo", "sultan", "infernus", "banshee"
    },
    peds = {
        "a_m_m_business_01", "a_m_y_beach_01", "a_f_y_hipster_01", "a_m_y_skater_01", "a_f_m_bodybuild_01"
    },
    objects = {
        "prop_barrel_02a", "prop_beachball_02", "prop_bench_01a", "prop_burgerstand_01", "prop_cone_float_1"
    }
}

local function request_model(model)
    local hash = util.joaat(model)
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        util.yield()
    end
    return hash
end

function try_delete_entity(entity)
    if ENTITY.DOES_ENTITY_EXIST(entity) then
        if NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) == false then
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
        end
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(entity, true, true)
        addict.trigger_commands("cleararea")
    end
end


function Destruct()
    local coords = player_coords(pid)
    coords.x = coords.x
    coords.y = coords.y + -30
    coords.z = coords.z
    veh = entities.get_all_vehicles_as_handles()
for i, ent in pairs(veh) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(object1, coords.x, coords.y, coords.z, false, false, true)
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, true, true)
        NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(ent), true)
        NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(ent), players.user(), true)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(ent, 1, 0.0, 10000.0, 0.0, 0.0, 0.0, 0.0, false, true, true, false, true)
        ENTITY.SET_ENTITY_ROTATION(ent, math.random(0, 360), math.random(0, 360), math.random(0, 360), 0, true)
        ENTITY.SET_ENTITY_VELOCITY(ent, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
    end
end

function upgrade_vehicle(player)
	local vehicle = get_player_vehicle(player,true)
        if vehicle then
            DECORATOR.DECOR_SET_INT(vehicle, "MPBitset", 0)
            VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
            for i = 0 ,50 do
                VEHICLE.SET_VEHICLE_MOD(vehicle, i, VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, i) - 13, false)
            end	
            VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 80, 0, 255, chrome)
            VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle,80, 0, 255, chrome)
            VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle, 10)
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 17, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 18, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 19, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 20, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 21, true)
            for i = 0 ,4 do
                if not VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle, i) then
                    VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle, i, true)
                end
            end
            VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle, 255, 0, 255)
            VEHICLE.SET_VEHICLE_WINDOW_TINT(vehicle, 1)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "Addict")
	end
end

function offset_coords_forward(pos, heading, distance)
    newpos = pos
    heading = math.rad((heading - 180) * -1)
    newpos.x = pos.x + (math.sin(heading) * -distance)
    newpos.y = pos.y + (math.cos(heading) * -distance)
    newpos.z = pos.z
    return newpos
end
  
function toFloat(num)
    return (num / 10) * 10
end


local ped_model = util.joaat("s_m_y_blackops_01")
local voice_profile = "S_M_Y_BlackOps_01"
local ocean_coords = { x = -3426.0, y = 950.0, z = 0.0 }

function request_model(hash)
    util.request_model(hash)
end

function teleport_vehicle_to_water(ped)
    if not PED.IS_PED_IN_ANY_VEHICLE(ped, false) then return end

    local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
    ENTITY.SET_ENTITY_COORDS(vehicle, ocean_coords.x, ocean_coords.y, ocean_coords.z, false, false, false, false)
    ENTITY.SET_ENTITY_HEADING(vehicle, math.random(0, 360))
    util.yield(1000)

    TASK.TASK_LEAVE_VEHICLE(ped, vehicle, 256)
    util.toast("Vehicle dumped in the ocean.")
end

function get_nearest_vehicle(coords, radius)
    local vehicles = entities.get_all_vehicles_as_handles()
    local closest_vehicle = 0
    local min_dist = radius

    for _, veh in ipairs(vehicles) do
        local veh_coords = ENTITY.GET_ENTITY_COORDS(veh, true)
        local dist = SYSTEM.VDIST(coords.x, coords.y, coords.z, veh_coords.x, veh_coords.y, veh_coords.z)
        if dist < min_dist then
            min_dist = dist
            closest_vehicle = veh
        end
    end

    return closest_vehicle
end

function spawn_jacker_on_player(pid)
    local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local target_coords = ENTITY.GET_ENTITY_COORDS(target_ped, true)
    local spawn_pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(target_ped, 2.0, 1.0, 0.0) -- spawn closer to target

    request_model(ped_model)
    local jacker = PED.CREATE_PED(26, ped_model, spawn_pos.x, spawn_pos.y, spawn_pos.z, 0.0, true, true)

    AUDIO.SET_AMBIENT_VOICE_NAME(jacker, voice_profile)
    AUDIO.PLAY_PED_AMBIENT_SPEECH_NATIVE(jacker, "GENERIC_CURSE_MED", "SPEECH_PARAMS_FORCE")

    ENTITY.SET_ENTITY_INVINCIBLE(jacker, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(jacker, 46, true)
    PED.SET_PED_FLEE_ATTRIBUTES(jacker, 0, false)
    WEAPON.GIVE_WEAPON_TO_PED(jacker, util.joaat("WEAPON_SMG"), 255, true, true)

    local nearest_vehicle = get_nearest_vehicle(spawn_pos, 100.0)
    if nearest_vehicle == 0 or nearest_vehicle == nil then
        util.toast("No vehicle found near player.")
        return
    end

    if not VEHICLE.IS_VEHICLE_SEAT_FREE(nearest_vehicle, -1) then
        local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(nearest_vehicle, -1)
        if driver == target_ped then
            TASK.TASK_DRIVE_BY(jacker, target_ped, 0, 0.0, 0.0, 0.0, 1, 0)
            TASK.TASK_SHUFFLE_TO_NEXT_VEHICLE_SEAT(target_ped)
            TASK.TASK_LEAVE_VEHICLE(target_ped, nearest_vehicle, 16)
            util.yield(500)
        end
    end

    TASK.TASK_ENTER_VEHICLE(jacker, nearest_vehicle, -1, -1, 2.0, 1, 0)

    util.create_thread(function()
        util.yield(7000)
        if PED.IS_PED_IN_ANY_VEHICLE(jacker, false) then
            local jackers_vehicle = PED.GET_VEHICLE_PED_IS_IN(jacker, false)
            TASK.TASK_VEHICLE_DRIVE_WANDER(jacker, jackers_vehicle, 25.0, 786597)
            AUDIO.PLAY_PED_AMBIENT_SPEECH_NATIVE(jacker, "GENERIC_SHOCKED_MED", "SPEECH_PARAMS_FORCE")
            util.yield(6000)
            teleport_vehicle_to_water(jacker)
        else
            util.toast("Ped failed to take vehicle.")
        end
    end)
end


function set_ent_face_ent(ent1, ent2)
    local pos1 = ENTITY.GET_ENTITY_COORDS(ent1)
    local pos2 = ENTITY.GET_ENTITY_COORDS(ent2)
    local dx = pos2.x - pos1.x
    local dy = pos2.y - pos1.y
    local heading = MISC.GET_HEADING_FROM_VECTOR_2D(dx, dy)
    return ENTITY.SET_ENTITY_HEADING(ent1, heading)
end

function set_ped_can_be_knocked_off_veh(ped, state)
    native_invoker.begin_call()
    native_invoker.push_arg_int(ped)
    native_invoker.push_arg_int(state)
    native_invoker.end_call("7A6535691B477C48")
end

function addBlipForEntity(entity, blipSprite, colour)
	local blip = HUD.ADD_BLIP_FOR_ENTITY(entity)
	HUD.SET_BLIP_SPRITE(blip, blipSprite)
	HUD.SET_BLIP_COLOUR(blip, colour)
	HUD.SHOW_HEIGHT_ON_BLIP(blip, false)
	HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(ENTITY.GET_ENTITY_HEADING(entity)))
	NETWORK.SET_NETWORK_ID_CAN_MIGRATE(entity, false)
	util.create_thread(function()
		while not ENTITY.IS_ENTITY_DEAD(entity) do
			local heading = ENTITY.GET_ENTITY_HEADING(entity)
			HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(heading))
			util.yield()
		end
		util.remove_blip(blip)
	end)
	return blip
end


local config_list = {
    ['controls'] = {
        ['Vehicle Weapons'] = 86,
        ['Airstrike Aircraft'] = 86
    },
    ['driving style'] = {
        ['Bandito Driving Style'] = 786988
    }
}
local function delete_entities_by_model(model)
    local hash = util.joaat(model)
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        for k, vehicle in pairs(entities.get_all_vehicles_as_handles()) do
            if ENTITY.GET_ENTITY_MODEL(vehicle) == hash then
                for k, ped in pairs(entities.get_all_peds_as_handles()) do
                    if PED.GET_VEHICLE_PED_IS_IN(ped, true) == vehicle then
                        if not PED.IS_PED_A_PLAYER(ped) then
                            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, false, false); entities.delete_by_handle(ped)
                        else
                            goto continue
                        end
                    end
                end
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle, false, false); entities.delete_by_handle(vehicle)
                ::continue::
            end
        end
        return
    end
    if STREAMING.IS_MODEL_A_PED(hash) then
        for k, ped in pairs(entities.get_all_peds_as_handles()) do
            if ENTITY.GET_ENTITY_MODEL(ped) == hash then
                if not PED.IS_PED_A_PLAYER(ped) then
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, false, false); entities.delete_by_handle(ped)
                end
            end
        end
        return
    end
    for k, object in pairs(entities.get_all_objects_as_handles()) do
        if ENTITY.GET_ENTITY_MODEL(object) == hash then
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, false, false); entities.delete_by_handle(object)
        end
    end
end

local function spawn_trolly_vehicle(pid, vehicleHash, pedHash)
    local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
    local coords_ptr, nodeId = memory.alloc(), memory.alloc()
    local coords
    if not PATHFIND.GET_RANDOM_VEHICLE_NODE(pos.x, pos.y, pos.z, 100, 0, 0, 0, coords_ptr, nodeId) then
        pos.x = pos.x + math.random(-20,20)
        pos.y = pos.y + math.random(-20,20)
        PATHFIND.GET_CLOSEST_VEHICLE_NODE(pos.x, pos.y, pos.z, coords_ptr, 1, 100, 2.5)
        coords = memory.read_vector3(coords_ptr)
    else
        coords = memory.read_vector3(coords_ptr)
    end
    memory.free(coords_ptr); memory.free(nodeId)

    local vehicle = entities.create_vehicle(vehicleHash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
    if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
        local tick = 0
        while not ENTITY.DOES_ENTITY_EXIST(vehicle) and tick <= 10 do
            vehicle = entities.create_vehicle(vehicleHash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            tick = tick + 1
            util.yield()
        end
    end
    VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
    for i = 0, 50 do
        VEHICLE.SET_VEHICLE_MOD(vehicle, i, VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, i) - 1, false)
    end
    VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
    VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
    VEHICLE.SET_VEHICLE_IS_CONSIDERED_BY_PLAYER(vehicle, false)
    set_ent_face_ent(vehicle, player_ped)

    local driver = entities.create_ped(5, pedHash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
    PED.SET_PED_COMBAT_ATTRIBUTES(driver, 1, true)
    PED.SET_PED_INTO_VEHICLE(driver, vehicle, -1)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, true)
    TASK.TASK_VEHICLE_MISSION_PED_TARGET(driver, vehicle, player_ped, 6, 500.0, config_list['driving style']['Bandito Driving Style'], 0.0, 0.0, true)
    set_ped_can_be_knocked_off_veh(driver, 1)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(pedHash); STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(vehicleHash)
    return vehicle, driver
end


local function get_closest_vehicle_to_ped(ped, exclude_vehicle)
    local ped_coords = ENTITY.GET_ENTITY_COORDS(ped)
    local vehicles = entities.get_all_vehicles_as_handles()
    local closest_vehicle = nil
    local closest_distance = 1000.0

    for _, vehicle in ipairs(vehicles) do
        if vehicle ~= exclude_vehicle and ENTITY.DOES_ENTITY_EXIST(vehicle) then
            local veh_coords = ENTITY.GET_ENTITY_COORDS(vehicle)
            local dist = SYSTEM.VDIST(ped_coords.x, ped_coords.y, ped_coords.z, veh_coords.x, veh_coords.y, veh_coords.z)
            if dist < closest_distance then
                closest_distance = dist
                closest_vehicle = vehicle
            end
        end
    end

    return closest_vehicle
end

local function switch_peds_vehicles()
    local peds = entities.get_all_peds_as_handles()
    local player_ped = PLAYER.PLAYER_PED_ID()

    for _, ped in ipairs(peds) do
        if ped ~= player_ped and PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            local current_vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
            if current_vehicle ~= 0 then
                local closest_vehicle = get_closest_vehicle_to_ped(ped, current_vehicle)
                if closest_vehicle and closest_vehicle ~= current_vehicle then
                    TASK.TASK_LEAVE_VEHICLE(ped, current_vehicle, 0)
                    util.yield(1500) -- Let them exit

                    TASK.TASK_ENTER_VEHICLE(ped, closest_vehicle, 5000, -1, 2.0, 1, 0)
                    util.yield(2000) -- Let them enter

                    local heading = ENTITY.GET_ENTITY_HEADING(closest_vehicle)
                    local opposite_heading = (heading + 180) % 360
                    ENTITY.SET_ENTITY_HEADING(closest_vehicle, opposite_heading)

                    TASK.TASK_VEHICLE_DRIVE_WANDER(ped, closest_vehicle, 20.0, 786603)
                end
            end
        end
    end
end

-------------------------------------------------------------------------------------------------------------------------

local spawned_vehicles = {}

-- Dot-matrix patterns for uppercase A-Z (3x5 grid)
local LETTER_PATTERNS = {
    A = {{0,2},{1,2},{2,2},{0,1},{2,1},{0,0},{2,0},{1,1}},
    B = {{0,0},{0,1},{0,2},{1,0},{2,1},{1,2},{2,0},{2,2}},
    C = {{0,0},{0,1},{0,2},{1,2},{1,0}},
    D = {{0,0},{0,1},{0,2},{1,0},{2,1},{1,2}},
    E = {{0,0},{0,1},{0,2},{1,0},{1,1},{1,2},{2,0},{2,2}},
    F = {{0,0},{0,1},{0,2},{1,2},{1,1},{2,2}},
    G = {{0,0},{0,1},{0,2},{1,0},{1,2},{2,0},{2,1}},
    H = {{0,0},{0,1},{0,2},{1,1},{2,0},{2,1},{2,2}},
    I = {{1,0},{1,1},{1,2}},
    J = {{2,0},{2,1},{2,2},{1,0},{0,0}},
    K = {{0,0},{0,1},{0,2},{1,1},{2,0},{2,2}},
    L = {{0,0},{0,1},{0,2},{1,0},{2,0}},
    M = {{0,0},{0,1},{0,2},{1,1},{2,0},{2,1},{2,2}},
    N = {{0,0},{0,1},{0,2},{1,1},{2,0},{2,1},{2,2}},
    O = {{0,0},{0,1},{0,2},{1,0},{1,2},{2,0},{2,1},{2,2}},
    P = {{0,0},{0,1},{0,2},{1,2},{2,1},{1,1}},
    Q = {{0,0},{0,1},{0,2},{1,0},{1,2},{2,0},{2,1},{2,2},{1,1}},
    R = {{0,0},{0,1},{0,2},{1,2},{2,1},{1,1},{2,2}},
    S = {{0,0},{1,0},{2,0},{0,1},{2,1},{0,2},{1,2},{2,2}},
    T = {{0,2},{1,2},{2,2},{1,1},{1,0}},
    U = {{0,0},{0,1},{0,2},{2,0},{2,1},{2,2},{1,0}},
    V = {{0,2},{0,1},{1,0},{2,1},{2,2}},
    W = {{0,2},{0,1},{0,0},{1,1},{2,2},{2,1},{2,0}},
    X = {{0,0},{0,2},{1,1},{2,0},{2,2}},
    Y = {{0,2},{2,2},{1,1},{1,0}},
    Z = {{0,2},{1,2},{2,2},{1,1},{0,0},{1,0},{2,0}}
}

local function freeze_vehicle(veh, state)
    ENTITY.FREEZE_ENTITY_POSITION(veh, state)
    ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
end

local function spawnVehicle(modelHash, x, y, z)
    STREAMING.REQUEST_MODEL(modelHash)
    while not STREAMING.HAS_MODEL_LOADED(modelHash) do
        util.yield()
    end
    local veh = VEHICLE.CREATE_VEHICLE(modelHash, x, y, z, 0.0, true, false)
    freeze_vehicle(veh, true)
    table.insert(spawned_vehicles, veh)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(modelHash)
    return veh
end

local function draw_text(text)
    local modelHash = util.joaat("adder")
    local player = players.user_ped()
    local baseCoords = ENTITY.GET_ENTITY_COORDS(player, true)
    local baseX = baseCoords.x
    local baseY = baseCoords.y
    local baseZ = baseCoords.z + 30

    local spacing = 6
    local letter_width = 3
    local veh_size = 3

    local index = 0
    for char in text:upper():gmatch(".") do
        local pattern = LETTER_PATTERNS[char]
        if pattern then
            for _, coord in ipairs(pattern) do
                local x = baseX + (index * (letter_width + 1) * veh_size) + (coord[1] * veh_size)
                local y = baseY + (coord[2] * veh_size)
                local z = baseZ
                spawnVehicle(modelHash, x, y, z)
            end
            index = index + 1
        end
    end
end

function cleanupSkyVehicles()
    for _, veh in ipairs(spawned_vehicles) do
        if ENTITY.DOES_ENTITY_EXIST(veh) then
            entities.delete_by_handle(veh)
        end
    end
    spawned_vehicles = {}
    util.toast("Cleaned up sky vehicles.")
end

request_stream_of_entity = function(entity, time)
    local unixtime = util.current_unix_time_seconds()
    local seconds = unixtime + time
    STREAMING.REQUEST_MODEL(entity)
    while not STREAMING.HAS_MODEL_LOADED(entity) and unixtime < seconds do
        STREAMING.REQUEST_MODEL(entity)
        util.yield()
    end
    if STREAMING.HAS_MODEL_LOADED(entity) then
        return entity
    else
        return 0
    end
end

function get_closest_vehicle_ufo(entity)
    coords = ENTITY.GET_ENTITY_COORDS(entity, true)
    vehicles = entities.get_all_vehicles_as_handles()
    -- init this at some ridiculously large number we will never reach, ez
    closestdist = 1000000
    closestveh = 0
    for k, veh in pairs(vehicles) do
        if veh ~= PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), false) and ENTITY.GET_ENTITY_HEALTH(veh) ~= 0 then
            vehcoord = ENTITY.GET_ENTITY_COORDS(veh, true)
            dist = MISC.GET_DISTANCE_BETWEEN_COORDS(coords['x'], coords['y'], coords['z'], vehcoord['x'], vehcoord['y'], vehcoord['z'], true)
            if dist < closestdist then
                closestdist = dist
                closestveh = veh
            end
        end
    end
    return closestveh
    end
-------------------------------------------------------------------------------------------------------------------------
 
--[[
─────────────────────────────────────────────────────────────
─██████████████─██████████████─██████─────────██████████████─
─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░██─
─██░░██████████─██░░██████████─██░░██─────────██░░██████████─
─██░░██─────────██░░██─────────██░░██─────────██░░██─────────
─██░░██████████─██░░██████████─██░░██─────────██░░██████████─
─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░██─
─██████████░░██─██░░██████████─██░░██─────────██░░██████████─
─────────██░░██─██░░██─────────██░░██─────────██░░██─────────
─██████████░░██─██░░██████████─██░░██████████─██░░██─────────
─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██─────────
─██████████████─██████████████─██████████████─██████─────────
─────────────────────────────────────────────────────────────
]]

Self_addict = addict.list(addict.my_root(), "Self", {}, "", function() end)

addict.divider(Self_addict, "Self")

----------------------------------------------------------------------------------------------------------------------------

local ride_menu = addict.list(Self_addict, "Ride Surfboard", {}, "Ride and control a surfboard on water.")

local surfboard_model = util.joaat("m23_2_prop_m32_surfboard_01a")
local support_model = util.joaat("prop_box_wood02a")
local support_handle = nil
local surfboard_handle = nil
local riding = false
local speed = 0.2 -- default movement per frame

local function load_model(hash)
    STREAMING.REQUEST_MODEL(hash)
    local timeout = 0
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        util.yield()
        timeout = timeout + 1
        if timeout > 500 then
            util.toast("Failed to load model!")
            return false
        end
    end
    return true
end

local function cleanup()
    if surfboard_handle and ENTITY.DOES_ENTITY_EXIST(surfboard_handle) then
        entities.delete_by_handle(surfboard_handle)
        surfboard_handle = nil
    end
    if support_handle and ENTITY.DOES_ENTITY_EXIST(support_handle) then
        entities.delete_by_handle(support_handle)
        support_handle = nil
    end
end

addict.toggle(ride_menu, "Ride a Surfboard", {"ridesurf"}, "Spawn and control a surfboard on water.", function(on)
    local player_ped = PLAYER.PLAYER_PED_ID()

    if on then
        local coords = ENTITY.GET_ENTITY_COORDS(player_ped, true)

        local waterHeight = memory.alloc(4)
        if not WATER.GET_WATER_HEIGHT(coords.x, coords.y, coords.z, waterHeight) then
            util.toast("Get closer to water to surf!")
            addict.trigger_commands("ridesurf off") -- turn toggle back off
            return
        end

        if not load_model(surfboard_model) or not load_model(support_model) then return end

        local heading = ENTITY.GET_ENTITY_HEADING(player_ped)

        support_handle = entities.create_object(support_model, v3(coords.x, coords.y, coords.z), heading)
        ENTITY.SET_ENTITY_VISIBLE(support_handle, false)
        ENTITY.SET_ENTITY_COLLISION(support_handle, true, true)
        ENTITY.FREEZE_ENTITY_POSITION(support_handle, false)
        ENTITY.SET_ENTITY_INVINCIBLE(support_handle, true)

        surfboard_handle = entities.create_object(surfboard_model, coords, heading)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(
            surfboard_handle,
            support_handle,
            0,
            0.08, 0, -0.05,  -- offset slightly
            0, 180, 0.0,
            false, true, false, false, 2, true
        )

        ENTITY.ATTACH_ENTITY_TO_ENTITY(
            player_ped,
            support_handle,
            0,
            0, 0, 1.0,   -- raise player slightly
            0, 0, -90.0,
            false, true, false, false, 2, true
        )

        local anim_dict = "mini@strip_club@private_dance@idle"
        local anim_name = "priv_dance_idle"
        if not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) then
            STREAMING.REQUEST_ANIM_DICT(anim_dict)
            while not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) do util.yield() end
        end
        TASK.TASK_PLAY_ANIM(player_ped, anim_dict, anim_name, 8.0, -8.0, -1, 1, 0.0, false, false, false)

        riding = true
        util.toast("You are now surfing!")

        while riding do
            if not ENTITY.DOES_ENTITY_EXIST(support_handle) then break end

            local f = ENTITY.GET_ENTITY_FORWARD_VECTOR(support_handle)
            local pos = ENTITY.GET_ENTITY_COORDS(support_handle, true)

            if PAD.IS_CONTROL_PRESSED(0, 32) then -- W
                pos = v3(pos.x + f.x * speed, pos.y + f.y * speed, pos.z)
            elseif PAD.IS_CONTROL_PRESSED(0, 33) then -- S
                pos = v3(pos.x - f.x * speed * 0.5, pos.y - f.y * speed * 0.5, pos.z)
            end

            if WATER.GET_WATER_HEIGHT(pos.x, pos.y, pos.z, waterHeight) then
                local wz = memory.read_float(waterHeight)
                pos = v3(pos.x, pos.y, wz + 0.05)
            end

            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(support_handle, pos.x, pos.y, pos.z, true, true, true)

            local heading = ENTITY.GET_ENTITY_HEADING(support_handle)
            if PAD.IS_CONTROL_PRESSED(0, 34) then -- A
                heading = heading + 2
            end
            if PAD.IS_CONTROL_PRESSED(0, 35) then -- D
                heading = heading - 2
            end
            ENTITY.SET_ENTITY_HEADING(support_handle, heading)

            util.yield()
        end

    else
        addict.trigger_commands("scenguard")
        util.yield(10)
        addict.trigger_commands("cancelanim")
        ENTITY.DETACH_ENTITY(player_ped, true, true)
        cleanup()
        riding = false
        util.toast("Dismounted from surfboard.")
    end
end)

addict.slider(ride_menu, "Surfboard Speed", {"surfspeed"}, "Adjust your surfboard speed", 1, 100, 2, 1, function(val)
    speed = val * 0.05
end)

util.on_stop(function()
    cleanup()
end)


----------------------------------------------------------------------------------------------------------------------------
local ride_menu = addict.list(Self_addict, "Ride Skateboard", {}, "Ride and control a skateboard like a mount.")

local skateboard_model = util.joaat("v_res_skateboard")
local support_model = util.joaat("prop_box_wood02a")
local support_handle = nil
local skateboard_handle = nil
local riding = false
local speed = 0.2 -- movement per frame, default

local function load_model(hash)
    STREAMING.REQUEST_MODEL(hash)
    local timeout = 0
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        util.yield()
        timeout = timeout + 1
        if timeout > 500 then
            util.toast("Failed to load model!")
            return false
        end
    end
    return true
end

local function cleanup()
    if skateboard_handle and ENTITY.DOES_ENTITY_EXIST(skateboard_handle) then
        entities.delete_by_handle(skateboard_handle)
        skateboard_handle = nil
    end
    if support_handle and ENTITY.DOES_ENTITY_EXIST(support_handle) then
        entities.delete_by_handle(support_handle)
        support_handle = nil
    end
end

addict.toggle(ride_menu, "Ride a Skateboard", {"rideskate"}, "Spawn and control a skateboard. Note: You must move forward to stop the floating upwards unti I can figure out a fix.", function(on)
    local player_ped = PLAYER.PLAYER_PED_ID()
    addict.trigger_commands("skatespeed 5")
    if on then
        if not load_model(skateboard_model) or not load_model(support_model) then return end

        local coords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
        local heading = ENTITY.GET_ENTITY_HEADING(player_ped)

        support_handle = entities.create_object(support_model, v3(coords.x, coords.y, coords.z - 0.0), heading)
        ENTITY.SET_ENTITY_VISIBLE(support_handle, false)
        ENTITY.SET_ENTITY_COLLISION(support_handle, true, true)
        ENTITY.FREEZE_ENTITY_POSITION(support_handle, false)
        ENTITY.SET_ENTITY_INVINCIBLE(support_handle, true)

        skateboard_handle = entities.create_object(skateboard_model, coords, heading)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(
            skateboard_handle,
            support_handle,
            0,
            0.08, 0, -0.1,     -- position offset
            0, 0, 90.0,        -- rotation offset (sideways)
            false, true, false, false, 2, true
        )

        ENTITY.ATTACH_ENTITY_TO_ENTITY(
            player_ped,
            support_handle,
            0,
            0, 0, 1.0,        -- small Z offset so feet rest on board
            0, 0, -90.0,
            false, true, false, false, 2, true
        )

        local anim_dict = "mini@strip_club@private_dance@idle"
        local anim_name = "priv_dance_idle"
        if not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) then
            STREAMING.REQUEST_ANIM_DICT(anim_dict)
            while not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) do util.yield() end
        end
        TASK.TASK_PLAY_ANIM(player_ped, anim_dict, anim_name, 8.0, -8.0, -1, 1, 0.0, false, false, false)

        riding = true
        util.toast("Move forward to stop the floating until fixed.")

        while riding do
            if not ENTITY.DOES_ENTITY_EXIST(support_handle) then break end

            local f = ENTITY.GET_ENTITY_FORWARD_VECTOR(support_handle)
            local pos = ENTITY.GET_ENTITY_COORDS(support_handle, true)

            if PAD.IS_CONTROL_PRESSED(0, 32) then -- W
                pos = v3(pos.x + f.x * speed, pos.y + f.y * speed, pos.z)
            elseif PAD.IS_CONTROL_PRESSED(0, 33) then -- S
                pos = v3(pos.x - f.x * speed * 0.5, pos.y - f.y * speed * 0.5, pos.z)
            end

            local ground_z_val = memory.alloc(4)
            if MISC.GET_GROUND_Z_FOR_3D_COORD(pos.x, pos.y, pos.z + 1.0, ground_z_val, false) then
                local gz = memory.read_float(ground_z_val)
                pos = v3(pos.x, pos.y, gz + 0.10) -- always snap to slightly above ground
            end

            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(support_handle, pos.x, pos.y, pos.z, true, true, true)

            local heading = ENTITY.GET_ENTITY_HEADING(support_handle)
            heading = heading + 90.0 -- apply sideways offset

            if PAD.IS_CONTROL_PRESSED(0, 34) then -- A
                heading = heading + 3
            end
            if PAD.IS_CONTROL_PRESSED(0, 35) then -- D
                heading = heading - 3
            end

            heading = heading - 90.0 -- remove offset
            ENTITY.SET_ENTITY_HEADING(support_handle, heading)

            util.yield()
        end

    else
        addict.trigger_commands("scenflex")
        util.yield(1)
        addict.trigger_commands("cancelanim")
        ENTITY.DETACH_ENTITY(player_ped, true, true)
        cleanup()
        riding = false
        util.toast("Dismounted from skateboard.")
    end
end)

addict.slider(ride_menu, "Skateboard Speed", {"skatespeed"}, "Adjust your skateboard speed to 5 and move forward", 1, 100, 4, 1, function(val)
    speed = val * 0.1
end)

util.on_stop(function()
    cleanup()
end)

----------------------------------------------------------------------------------------------------------------------------

    local active_rideable_animal = 0

    util.create_tick_handler(function()
        if active_rideable_animal ~= 0 then 
            -- dismounting 
            if PAD.IS_CONTROL_JUST_PRESSED(23, 23) then 
                ENTITY.DETACH_ENTITY(players.user_ped())
                entities.delete_by_handle(active_rideable_animal)
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
                active_rideable_animal = 0
            end

            if not ENTITY.IS_ENTITY_IN_AIR(active_rideable_animal) then 
                if PAD.IS_CONTROL_PRESSED(32, 32) then 
                    local side_move = PAD.GET_CONTROL_NORMAL(146, 146)
                    local fwd = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(active_rideable_animal, side_move*10.0, 8.0, 0.0)
                    TASK.TASK_LOOK_AT_COORD(active_rideable_animal, fwd.x, fwd.y, fwd.z, 0, 0, 2)
                    TASK.TASK_GO_STRAIGHT_TO_COORD(active_rideable_animal, fwd.x, fwd.y, fwd.z, 20.0, -1, ENTITY.GET_ENTITY_HEADING(active_rideable_animal), 0.5)
                end
                if PAD.IS_CONTROL_JUST_PRESSED(76, 76) then 
                    local w = {}
                    w.x, w.y, w.z, _ = players.get_waypoint(players.user())
                    if w.x == 0.0 and w.y == 0.0 then 
                        util.toast("No waypoint set.")
                    else
                        TASK.TASK_FOLLOW_NAV_MESH_TO_COORD(active_rideable_animal, w.x, w.y, w.z, 1.0, -1, 100, 0, 0)
                    end
                end
            end

        end
    end)

local animals_ride_menu = addict.list(Self_addict, "Ride Animals", {}, "Ride and control animals.")

local ranimal_hashes = {util.joaat("a_c_deer"), util.joaat("a_c_boar"), util.joaat("a_c_cow")}

local animal_names = {"Deer", "Boar", "Cow"}

addict.list_action(animals_ride_menu, "Ride Animals", {"spawnranimal"}, "", animal_names, function(index, value, click_type)
    if active_rideable_animal ~= 0 then 
        util.toast("Already riding animal")
        return 
    end
    local hash = ranimal_hashes[index]
    util.request_model(hash, 2000)
    local animal = entities.create_ped(8, hash, players.get_position(players.user()), ENTITY.GET_ENTITY_HEADING(players.user_ped()))
    ENTITY.SET_ENTITY_INVINCIBLE(animal, true)
    ENTITY.FREEZE_ENTITY_POSITION(animal, true)
    ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), true)
    active_rideable_animal = animal
    local m_z_off = 0 
    local f_z_off = 0
    switch index do 
        case 1: 
            m_z_off = 0.3 
            f_z_off = 0.15
            break
        case 2:
            m_z_off = 0.4
            f_z_off = 0.3
            break
        case 3:
            m_z_off = 0.2 
            f_z_off = 0.1 
            break
    end
    if ENTITY.GET_ENTITY_MODEL(players.user_ped()) == util.joaat("mp_f_freemode_01") then 
        z_off = f_z_off
    else
        z_off = m_z_off
    end
    ENTITY.ATTACH_ENTITY_TO_ENTITY(players.user_ped(), animal, PED.GET_PED_BONE_INDEX(animal, 24816), -0.3, 0.0, z_off, 0.0, 0.0, 90.0, false, false, false, true, 2, true, 0)
    request_anim_dict("rcmjosh2")
    TASK.TASK_PLAY_ANIM(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
    util.toast("Use your regular player movement controls to move the animal.\nPress your vehicle dismount key to dismount.\nPress your jump key to command the animal to stop.")
    ENTITY.FREEZE_ENTITY_POSITION(animal, false)
    ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), false)
end)

local ride_menu = addict.list(animals_ride_menu, "Pig Rider (Modded Speed Inputs)", {}, "Ride and control a pig like a mount.")

local pig_model = util.joaat("a_c_pig")
local pig_handle = nil
local riding = false
local speed = 2.0 

local function cleanup_pig()
    if pig_handle and ENTITY.DOES_ENTITY_EXIST(pig_handle) then
        entities.delete_by_handle(pig_handle)
        pig_handle = nil
    end
end

local function control_pig()
    while riding do
        if not ENTITY.DOES_ENTITY_EXIST(pig_handle) then break end

        -- Rotation
        local heading = ENTITY.GET_ENTITY_HEADING(pig_handle)

        if PAD.IS_CONTROL_PRESSED(0, 34) then -- A / Left
            heading = heading + 3
        elseif PAD.IS_CONTROL_PRESSED(0, 35) then -- D / Right
            heading = heading - 3
        end
        ENTITY.SET_ENTITY_HEADING(pig_handle, heading)
        if PAD.IS_CONTROL_PRESSED(0, 32) then -- W / Forward
            local forward_vector = ENTITY.GET_ENTITY_FORWARD_VECTOR(pig_handle)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(
                pig_handle, 1,
                forward_vector.x * speed,
                forward_vector.y * speed,
                0.0,
                true, false, true, false
            )
        elseif PAD.IS_CONTROL_PRESSED(0, 33) then -- S / Backward
            local forward_vector = ENTITY.GET_ENTITY_FORWARD_VECTOR(pig_handle)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(
                pig_handle, 1,
                -forward_vector.x * (speed * 0.5),
                -forward_vector.y * (speed * 0.5),
                0.0,
                true, false, true, false
            )
        end

        util.yield()
    end
end

addict.toggle(ride_menu, "Ride a Pig", {"ridepig"}, "Spawn and control a pig mount.", function(on)
    local player_ped = PLAYER.PLAYER_PED_ID()

    if on then
        load_model(pig_model)
        local coords = ENTITY.GET_ENTITY_COORDS(player_ped, true)

        pig_handle = entities.create_ped(28, pig_model, coords, 0.0)
        ENTITY.FREEZE_ENTITY_POSITION(pig_handle, false)
        ENTITY.SET_ENTITY_INVINCIBLE(pig_handle, true)
        ENTITY.SET_ENTITY_VISIBLE(pig_handle, true)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(pig_handle, player_ped, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(
        player_ped, pig_handle, 90,
        0.0, 0.0, 0.5,        
        0.0, 0.0, 0.0, -- Rotation offset (upright & facing forward)
        false, true, false, false, 2, true)

        local anim_dict = "anim@scripted@charlie_missions@mission_5@ig2_avi_sitting@"
        local anim_name = "s_react_left"

        if not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) then
            STREAMING.REQUEST_ANIM_DICT(anim_dict)
            while not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) do
                util.yield()
            end
        end

        TASK.TASK_PLAY_ANIM(
            player_ped,
            anim_dict,
            anim_name,
            8.0,      -- blend in speed
            -8.0,     -- blend out speed
            -1,       -- duration (loop)
            1,        -- flag: repeat
            0.0,      -- playback rate
            false,
            false,
            false)

        riding = true
        util.toast("You are now riding and controlling a pig!")
        control_pig()
    else
        addict.trigger_commands("scenflex")
        util.yield(1)
        addict.trigger_commands("cancelanim")
        ENTITY.DETACH_ENTITY(PLAYER.PLAYER_PED_ID(), true, true)
        cleanup_pig()
        riding = false
        util.toast("Dismounted from pig.")
    end
end)

addict.slider(ride_menu, "Pig Speed", {"pigspeed"}, "How fast your pig runs", 1, 10, 2, 1, function(val)
    speed = val
end)

util.on_stop(function()
    cleanup_pig()
end)

------------------------------------------------------------------------------------------------------

local ride_menu = addict.list(animals_ride_menu, "Cow Rider (Modded Speed Inputs)", {}, "Ride and control a cow like a mount.")

local cow_model = util.joaat("A_C_Cow")
local cow_handle = nil
local riding = false
local speed = 2.0 -- Default cow speed

local function cleanup_cow()
    if cow_handle and ENTITY.DOES_ENTITY_EXIST(cow_handle) then
        entities.delete_by_handle(cow_handle)
        cow_handle = nil
    end
end

local function control_cow()
    while riding do
        if not ENTITY.DOES_ENTITY_EXIST(cow_handle) then break end

        local heading = ENTITY.GET_ENTITY_HEADING(cow_handle)

        if PAD.IS_CONTROL_PRESSED(0, 34) then -- A / Left
            heading = heading + 3
        elseif PAD.IS_CONTROL_PRESSED(0, 35) then -- D / Right
            heading = heading - 3
        end

        ENTITY.SET_ENTITY_HEADING(cow_handle, heading)

        if PAD.IS_CONTROL_PRESSED(0, 32) then -- W / Forward
            local forward_vector = ENTITY.GET_ENTITY_FORWARD_VECTOR(cow_handle)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(
                cow_handle, 1,
                forward_vector.x * speed,
                forward_vector.y * speed,
                0.0,
                true, false, true, false
            )
        elseif PAD.IS_CONTROL_PRESSED(0, 33) then -- S / Backward
            local forward_vector = ENTITY.GET_ENTITY_FORWARD_VECTOR(cow_handle)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(
                cow_handle, 1,
                -forward_vector.x * (speed * 0.5),
                -forward_vector.y * (speed * 0.5),
                0.0,
                true, false, true, false
            )
        end

        util.yield()
    end
end

addict.toggle(ride_menu, "Ride a cow", {"ridecow"}, "Spawn and control a cow mount.", function(on)
    local player_ped = PLAYER.PLAYER_PED_ID()

    if on then
        load_model(cow_model)
        local coords = ENTITY.GET_ENTITY_COORDS(player_ped, true)

        cow_handle = entities.create_ped(28, cow_model, coords, 0.0)
        ENTITY.FREEZE_ENTITY_POSITION(cow_handle, false)
        ENTITY.SET_ENTITY_INVINCIBLE(cow_handle, true)
        ENTITY.SET_ENTITY_VISIBLE(cow_handle, true)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(cow_handle, player_ped, true)
        -- Position offset
        ENTITY.ATTACH_ENTITY_TO_ENTITY(
        player_ped, cow_handle, 90,
        0.0, 0.0, 0.5,        
        0.0, 0.0, 0.0, -- Rotation offset (upright & facing forward)
        false, true, false, false, 2, true)

        local anim_dict = "anim@scripted@charlie_missions@mission_5@ig2_avi_sitting@"
        local anim_name = "s_react_left"

        if not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) then
            STREAMING.REQUEST_ANIM_DICT(anim_dict)
            while not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) do
                util.yield()
            end
        end
        
        TASK.TASK_PLAY_ANIM(
            player_ped,
            anim_dict,
            anim_name,
            8.0,      -- blend in speed
            -8.0,     -- blend out speed
            -1,       -- duration (loop)
            1,        -- flag: repeat
            0.0,      -- playback rate
            false,
            false,
            false)

        riding = true
        util.toast("You are now riding and controlling a cow!")
        control_cow()
    else
        addict.trigger_commands("scenflex")
        util.yield(1)
        addict.trigger_commands("cancelanim")
        ENTITY.DETACH_ENTITY(PLAYER.PLAYER_PED_ID(), true, true)
        cleanup_cow()
        riding = false
        util.toast("Dismounted from cow.")
    end
end)

addict.slider(ride_menu, "Cow Speed", {"cowspeed"}, "How fast your cow runs", 1, 10, 2, 1, function(val)
    speed = val
end)

util.on_stop(function()
    cleanup_cow()
end)

-----------------------------------------------------------------------------------------------------------------------------------

local player = players.user_ped()
local agroup = "missfbi3ig_0"
local anim = "shit_loop_trev"
local mshit = util.joaat("prop_big_shit_02")
local rshit = util.joaat("prop_big_shit_01")

list = addict.list(Self_addict, "Poop", {"lpoop"}, "Poo list", function(); end)

addict.action(list, "Massive shit", {"mshit"}, "Make a massive shit", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(1000)
    entities.create_object(mshit, c)
end)

addict.action(list, "Normal shit", {"nshit"}, "Make a normale sized shit", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(1000)
    entities.create_object(rshit, c)
end)

-----------------------------------------------------------------------------------------------------------------------------------

    local becop = addict.list(Self_addict, "Be A Cop", {}, "")

        addict.toggle(becop, "Drive Cop Heli", {"copheli"}, "Plus bodygaurds.", function(on_toggle)
            if on_toggle then
                addict.trigger_commands("polmav")
                addict.trigger_commands("bodyguardmodel S_M_Y_Swat_01")
                addict.trigger_commands("bodyguardcount 3")
                addict.trigger_commands("bodyguardprimary smg")
                addict.trigger_commands("bodyguardsecondary smg")
                addict.trigger_commands("spawnbodyguards")
                addict.trigger_commands("smyswat01")
                addict.trigger_commands("bodyguardimmortality")
                addict.trigger_commands("undead")
                addict.trigger_commands("otr")
                util.yield(3000)
                util.toast("Make way for the heli.")
                util.yield(3000)
                local vehicleHash = util.joaat("polmav")
                request_model(vehicleHash)
                local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
                copheli = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
                VEHICLE.SET_VEHICLE_ENGINE_ON(copheli, true, true, true)
                ENTITY.SET_ENTITY_INVINCIBLE(copheli, true)
                VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(copheli, 0.0)
                local id = get_closest_vehicle(entity)
                local playerpos = ENTITY.GET_ENTITY_COORDS(id)
                playerpos.z = playerpos.z + 3
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(copheli, pos.x, pos.y, pos.z, false, false, true)
                PED.SET_PED_INTO_VEHICLE(PLAYER.PLAYER_PED_ID(), copheli, -1)
                util.yield(1500)
                addict.trigger_commands("livery -1")
            else
                local Imortality_BodyGuards = addict.ref_by_path("Self>Bodyguards>Immortality")
                addict.trigger_command(Imortality_BodyGuards)
                addict.trigger_commands("delbodyguards")
                addict.trigger_commands("deletevehicle")
                addict.trigger_commands("mpfemale")
                addict.trigger_commands("undead")
                addict.trigger_commands("otr")
                util.toast("Change you're outfit to get clothes normal again.")
            end
        end)


        addict.toggle(becop, "Drive Cop Car", {"copcar"}, "Plus a bodygaurd.", function(on_toggle)
            if on_toggle then
                addict.trigger_commands("bodyguardmodel S_M_Y_Cop_01")
                addict.trigger_commands("bodyguardcount 1")
                addict.trigger_commands("bodyguardprimary pistol")
                addict.trigger_commands("bodyguardsecondary pistol")
                addict.trigger_commands("spawnbodyguards")
                addict.trigger_commands("SMYCop01")
                addict.trigger_commands("bodyguardimmortality")
                addict.trigger_commands("undead")
                addict.trigger_commands("otr")
                util.yield(1000)
                local vehicleHash = util.joaat("police3")
                request_model(vehicleHash)
                local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
                copheli = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
                VEHICLE.SET_VEHICLE_ENGINE_ON(copheli, true, true, true)
                ENTITY.SET_ENTITY_INVINCIBLE(copheli, true)
                VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(copheli, 0.0)
                VEHICLE.SET_VEHICLE_MOD_KIT(copheli, -1)
                local playerpos = ENTITY.GET_ENTITY_COORDS(id)
                playerpos.z = playerpos.z + 3
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(copheli, pos.x, pos.y, pos.z, false, false, true)
                PED.SET_PED_INTO_VEHICLE(PLAYER.PLAYER_PED_ID(), copheli, -1)
            else
                local Imortality_BodyGuards = addict.ref_by_path("Self>Bodyguards>Immortality")
                addict.trigger_command(Imortality_BodyGuards)
                addict.trigger_commands("delbodyguards")
                addict.trigger_commands("deletevehicle")
                addict.trigger_commands("mpfemale")
                addict.trigger_commands("undead")
                addict.trigger_commands("otr")
                util.toast("Change you're outfit to get clothes normal again.")
            end
        end)

local graphics_menu = addict.list(Self_addict, "Graphics Mod", {}, "")
 
    god_graphics_level = 1.25
    addict.slider_float(graphics_menu, "God Graphics Level", {"godgraphlvl"}, "", 1, 1000, 125, 1, function(s)
        god_graphics_level = s * 0.001
    end)


    addict.action(graphics_menu, "Apply God Graphics", {"godgraphon"}, "", function(click_type)
        addict.trigger_commands("shader intnofog")
        addict.trigger_commands("lodscale " .. god_graphics_level)
    end)

    addict.action(graphics_menu, "Unapply God Graphics", {"godgraphoff"}, "", function(click_type)
        addict.trigger_commands("shader off")
        addict.trigger_commands("lodscale 1.00")
    end)


    local auto_accepts = addict.list(Self_addict, "Auto Accept Joins", {}, "")

    addict.toggle_loop(auto_accepts, "Accept Joins & Transaction Errors!", {"accepterrors"}, "Automatically accept join screens and transaction errors.", function()
        local mess_hash = HUD.GET_WARNING_SCREEN_MESSAGE_HASH()
        if mess_hash == -896436592 then
            util.toast("This player left the session.")
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
        elseif mess_hash == 1575023314 then
            util.toast("Session timeout.")
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
        elseif mess_hash == 1446064540 then
            util.toast("You are already in the session.")
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1) 
        elseif mess_hash == -991495373 or mess_hash == -587688989 or mess_hash == 15890625 or mess_hash == 99184332 or mess_hash == 1246147334 then
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
        elseif mess_hash ~= 0 then
            util.toast(mess_hash, TOAST_CONSOLE)
        end
        util.yield()
    end)

    addict.toggle_loop(auto_accepts, "Auto Enter Key", {"autoenter"}, "Automatically hits enter key.", function()
        HUD.GET_WARNING_SCREEN_MESSAGE_HASH()
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        util.yield(100)
    end)

-----------------------------------------------------------------------------------------------------------------------------------------

    addict.toggle(Self_addict, "Auto Run", {"autorun"}, "Suicide or use command 'ewo' to suicide yourself.", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        pos.y = pos.y - 5
        pos.z = pos.z + 1
        for i, peds in ipairs(entities.get_all_peds_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(peds)
            TASK.TASK_COMBAT_PED(peds, ped, 0, 16)
            util.yield()
        end 
    end)


    addict.toggle_loop(Self_addict, "Tp all over Map V1", {"tpspread1"}, "Note: Great for spreading any kinda mods like gifting vehicles or crash events.", function()
        local p = PLAYER.PLAYER_PED_ID()
        local c = ENTITY.GET_ENTITY_COORDS(p)
        local height = 100
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(p, c.x + math.random(-100, 100), c.y + math.random(-100, 100), height)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.toggle_loop(Self_addict, "Tp all over Map V2", {"tpspread2"}, "Note: Great for spreading any kinda mods like gifting vehicles or crash events.", function(on_toggle)
    local player_ped = PLAYER.PLAYER_PED_ID()    
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    for i=1,1  do
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1329.5868, -3041.565, 65.06483)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 12.201786, -2608.5598, 27.00581)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 529.52344, -3159.0903, 46.26378)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 797.6639, -2314.7708, 66.75716)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -904.7783, -1799.8903, 60.525257)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -902.62103, -1797.8055, 68.71026)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -811.026, -1052.471, 84.877464)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -74.7535, -820.54895, 331.0572)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 693.5279, -1200.2932, 45.110516)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1944.0536, -911.7328, 177.15826)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 955.1047, 11.822339, 129.3541)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1329.5868, -3041.565, 65.06483)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -604.4595, 53.186974, 124.79825)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -84.817345, 882.59576, 287.78268)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1755.0154, -75.41939, 137.54353)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 2568.129, 760.6324, 160.43828)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 807.4092, 2714.9368, 103.85771)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 2252.8367, 3330.679, 138.64398)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1970.4495, 2864.2395, 34.49541)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1840.9294, 3868.8608, 54.188793)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 490.04102, 5584.988, 802.92584)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 2313.2842, 5981.442, 136.00969)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -272.11963, 6188.8105, 82.51767)
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1329.5868, -3041.565, 65.06483)
        util.yield(100)
    end
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
end)


local entity_held = 0
local are_hands_up = false

addict.toggle_loop(Self_addict, "Throw Cars", {"throwcars"}, "Hold E or LB to use.", function(on)
    if PAD.IS_CONTROL_JUST_RELEASED(38, 38) and not PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
        if entity_held == 0 then
            if not are_hands_up then
                local veh, dist = get_closest_vehicle(ENTITY.GET_ENTITY_COORDS(players.user_ped()))
                if veh ~= nil and veh ~= 0 and ENTITY.DOES_ENTITY_EXIST(veh) and dist ~= nil and dist <= 5.0 then
                    request_anim_dict("missminuteman_1ig_2")
                    TASK.TASK_PLAY_ANIM(players.user_ped(), "missminuteman_1ig_2", "handsup_enter", 8.0, 0.0, -1, 50, 0, false, false, false)
                    util.yield(500)
                    are_hands_up = true

                    request_control_of_entity_once(veh)
                    ENTITY.SET_ENTITY_ALPHA(veh, 100, false)
                    ENTITY.SET_ENTITY_HEADING(veh, ENTITY.GET_ENTITY_HEADING(players.user_ped()))
                    ENTITY.SET_ENTITY_INVINCIBLE(veh, true)

                    local model = ENTITY.GET_ENTITY_MODEL(veh)
                    local size = get_model_size(model) or {x=0,y=0,z=2}

                    ENTITY.ATTACH_ENTITY_TO_ENTITY(
                        veh, players.user_ped(), 0,
                        0.0, 0.0, size.z / 2.0,
                        0.0, 0.0, 0.0,
                        true, false, true, false, 0, true
                    )

                    entity_held = veh
                else
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
                    are_hands_up = false
                end
            else
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
                are_hands_up = false
            end
        else
            if ENTITY.IS_ENTITY_A_VEHICLE(entity_held) then
                ENTITY.DETACH_ENTITY(entity_held)
                VEHICLE.SET_VEHICLE_FORWARD_SPEED(entity_held, 100.0)
                VEHICLE.SET_VEHICLE_OUT_OF_CONTROL(entity_held, true, true)
                ENTITY.SET_ENTITY_ALPHA(entity_held, 255, false)
                ENTITY.SET_ENTITY_INVINCIBLE(entity_held, false)

                TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
                ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), true)
                ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(entity_held, players.user_ped(), false)

                request_anim_dict("melee@unarmed@streamed_core")
                TASK.TASK_PLAY_ANIM(players.user_ped(), "melee@unarmed@streamed_core", "heavy_punch_a", 8.0, 8.0, -1, 0, 0.3, false, false, false)
                util.yield(500)

                ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), false)
                entity_held = 0
                are_hands_up = false
            end
        end
    end
end)


local ped_held = 0
addict.toggle_loop(Self_addict, "Throw Peds", {"throwpeds"}, "", function(on)
    if PAD.IS_CONTROL_JUST_RELEASED(38, 38) and not PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
        if entity_held == 0 then
            if not are_hands_up then 
                local closest = get_closest_ped_new(ENTITY.GET_ENTITY_COORDS(players.user_ped()))
                if closest ~= nil then
                    local ped = closest[1]
                    if ped ~= nil then
                        local dist = closest[2]
                        if dist <= 5 then 
                            request_anim_dict("missminuteman_1ig_2")
                            TASK.TASK_PLAY_ANIM(players.user_ped(), "missminuteman_1ig_2", "handsup_enter", 8.0, 0.0, -1, 50, 0, false, false, false)
                            util.yield(500)
                            are_hands_up = true
                            ENTITY.SET_ENTITY_ALPHA(ped, 100)
                            ENTITY.SET_ENTITY_HEADING(ped, ENTITY.GET_ENTITY_HEADING(players.user_ped()))
                            request_control_of_entity_once(ped)
                            ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, players.user_ped(), 0, 0, 0, 1.3, 180, 180, -180, true, false, true, true, 0, true, 0)
                            entity_held = ped
                        end 
                    end
                end
            else
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
                are_hands_up = false
            end
        else
            if ENTITY.IS_ENTITY_A_PED(entity_held) then
                ENTITY.DETACH_ENTITY(entity_held)
                ENTITY.SET_ENTITY_ALPHA(entity_held, 255)
                PED.SET_PED_TO_RAGDOLL(entity_held, 10, 10, 0, false, false, false)
                ENTITY.SET_ENTITY_MAX_SPEED(entity_held, 100.0)
                ENTITY.APPLY_FORCE_TO_ENTITY(entity_held, 1, 0, 100, 0, 0, 0, 0, 0, true, false, true, false, false)
                AUDIO.PLAY_PAIN(entity_held, 7, 0, 0)
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
                ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), true)
                ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(entity_held, players.user_ped(), false)
                request_anim_dict("melee@unarmed@streamed_core")
                TASK.TASK_PLAY_ANIM(players.user_ped(), "melee@unarmed@streamed_core", "heavy_punch_a", 8.0, 8.0, -1, 0, 0.3, false, false, false)
                util.yield(500)
                ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), false)
                entity_held = 0
                are_hands_up = false
            end
        end
    end
end)
-------------------------------------------------------------------------------------------------------------------------------------------


    addict.toggle_loop(Self_addict, "Fast Respawn", {"fastrespawn"}, "", function()
        local gwobaw = memory.script_global(2672524 + 1685 + 756) -- Global_2672524.f_1685.f_756
        if PED.IS_PED_DEAD_OR_DYING(players.user_ped()) then
            GRAPHICS.ANIMPOSTFX_STOP_ALL()
            memory.write_int(gwobaw, memory.read_int(gwobaw) | 1 << 1)
        end
    end,
        function()
        local gwobaw = memory.script_global(2672524 + 1685 + 756)
        memory.write_int(gwobaw, memory.read_int(gwobaw) &~ (1 << 1)) 
    end)
    
    addict.toggle_loop(Self_addict, "Fast Roll", {"fastroll"}, "", function()
        STATS.STAT_SET_INT(util.joaat("MP"..util.get_char_slot().."_SHOOTING_ABILITY"), 200, true)
    end)

    addict.toggle(Self_addict, "Quiet footsteps", {"quietsteps"}, "Disables the sound of your footsteps.", function(toggle)
        AUDIO.SET_PED_FOOTSTEPS_EVENTS_ENABLED(players.user_ped(), not toggle)
    end)
    

    local max_health
    undead_otr = addict.toggle(Self_addict, "Undead OTR", {"undead"}, "Turn you off the radar without notifying other players.\nNote: Trigger Modded Health detection.", function(on_toggle)
        if on_toggle then
            max_health = ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped())
            while addict.get_state(undead_otr) == "On" do
                if ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()) ~= 0 then
                    ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(),0)
                end
                util.yield()
            end
        else
            ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(),max_health)
        end
    end)

    
    addict.toggle_loop(Self_addict, "Always Unarmed", {"alwaysunarmed"}, "If your player is frozen on unarmed toggle this off and on to fix without suicide.", function(on_loop)
        local player_ped = PLAYER.PLAYER_PED_ID()    
        WEAPON.GIVE_WEAPON_TO_PED(player_ped, util.joaat('WEAPON_COUGAR'), 1, true, true)
    end)


    addict.toggle(Self_addict, "Autoload Weapons", {"autoloadweapons"}, "Autoload all the weapons everytime you join a new session.", function(state)
        if state then
            players.on_join(function(player_id)
                local my_player_id <const> = players.user()

                if player_id == my_player_id then
                    local all_weapons_command_ref <const> = addict.ref_by_path("Self>Weapons>Get Weapons>All Weapons")

                    wait_session_transition()
                    addict.trigger_command(all_weapons_command_ref)
                    --util.toast("Weapons loaded successfully. :)")
                end
            end)
        end
    end)

    addict.toggle_loop(Self_addict, "Front Flip", {"frontflip"}, "WARNING! Do not click change outfit. Do a front flip.", function(on)
        local hash = util.joaat("prop_ecola_can")
        request_model(hash)
        local prop = entities.create_object(hash, players.get_position(players.user()))
        ENTITY.FREEZE_ENTITY_POSITION(prop)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(players.user_ped(), prop, 0, 0, 0, 0, 0, 0, 0, true, false, false, false, 0, true)
        local hdg = CAM.GET_GAMEPLAY_CAM_ROT(0).z
        ENTITY.SET_ENTITY_ROTATION(prop, 0, 0, hdg, 1)
        for i=1, -360, -8 do
            ENTITY.SET_ENTITY_ROTATION(prop, i, 0, hdg, 1)
            util.yield()
        end
        ENTITY.DETACH_ENTITY(players.user_ped())
        entities.delete_by_handle(prop)
        util.yield(2000)
    end)

        addict.toggle(Self_addict, "LS Mechanic", {"spawnlsman"}, "Activates Mechanic.", function(on)
        if on then
            addict.trigger_commands("smmautoshop01")
            addict.trigger_commands("undead")
            addict.trigger_commands("otr")
            util.toast("Mechanic On") 
        else
            addict.trigger_commands("mpfemale")
            addict.trigger_commands("undead")
            addict.trigger_commands("otr")
            util.toast("Reset to deafult. Change you're outfit to get clothes normal again.")
            end 
        end)


    addict.toggle(Self_addict, "Furry Mode", {"spawnfurry"}, "Activates Furry.", function(on)
        if on then
            addict.trigger_commands("IGFurry")
            addict.trigger_commands("walkstyle mop")
            util.toast("Furry On") 
        else
            addict.trigger_commands("mpfemale")
            addict.trigger_commands("walkstyle poshfemale")
            util.toast("Reset to deafult. Change you're outfit to get clothes normal again.")
            end 
        end)

    addict.toggle(Self_addict, "Rabbit Mode", {"spawnrabbit"}, "Activates Rabbit.", function(on)
        if on then
            addict.trigger_commands("alwaysunarmed")
            addict.trigger_commands("ACRabbit02")
            addict.trigger_commands("walkstyle mop")
            util.toast("Rabbit Mode On") 
        else
            addict.trigger_commands("alwaysunarmed")
            addict.trigger_commands("mpfemale")
            addict.trigger_commands("walkstyle poshfemale")
            util.toast("Reset to deafult. Change you're outfit to get clothes normal again.")
            end 
        end)

    addict.toggle(Self_addict, "Yule Monster Mode", {"spawnyulemonster"}, "Activates Yule Monster, then to Candy's outfit.", function(on)
        if on then
            addict.trigger_commands("UMMYuleMonster")
            addict.trigger_commands("walkstyle mop")
            util.toast("Yule Monster Mode On") 
        else
            addict.trigger_commands("mpfemale")
            addict.trigger_commands("walkstyle poshfemale")
            util.toast("Reset to deafult. Change you're outfit to get clothes normal again.")
            end 
        end)

    addict.toggle(Self_addict, "Hulk Mode", {"hulkmode"}, "Makes you jump high and very strong", function(toggle)
        if toggle then
            addict.trigger_commands("damagemultiplier 10000")
            addict.trigger_commands("superjump")
            util.yield(500)
            util.toast("Hulk Mode On")
        else
            addict.trigger_commands("damagemultiplier 1.01")
            addict.trigger_commands("damagemultiplier 1")
            addict.trigger_commands("superjump")
            util.yield(500)
            util.toast("Hulk Mode Off")
        end 
    end)

    addict.toggle_loop(Self_addict, "Clear All Notifications", {"clearnotifs"}, "", function()
        Clear_Stand_Notifs = addict.ref_by_path("Stand>Clear Notifications")
        Clear_Minimap_Notifs = addict.ref_by_path("Game>Remove Notifications Above Minimap")
        addict.trigger_command(Clear_Stand_Notifs)
        addict.trigger_command(Clear_Minimap_Notifs)
        util.yield(1000)
    end)

    
    local toggle_ghost = false

    addict.toggle(Self_addict, "Local Ghost Mode", {"localghost"}, "You look ghosted but are still visible to others", function(on)
        toggle_ghost = on
        local ped = PLAYER.PLAYER_PED_ID()
        if on then
            ENTITY.SET_ENTITY_ALPHA(ped, 150, false) -- semi-transparent locally
        else
            ENTITY.SET_ENTITY_ALPHA(ped, 255, false)
        end
    end)

---------------------------------------------------------------------------------------------------------------------------------------
--[[
──────────────────────────────────────────────────────────────────────────────────────────────────────
─██████──██████─██████████████─██████──██████─██████████─██████████████─██████─────────██████████████─
─██░░██──██░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░██─██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░██─
─██░░██──██░░██─██░░██████████─██░░██──██░░██─████░░████─██░░██████████─██░░██─────────██░░██████████─
─██░░██──██░░██─██░░██─────────██░░██──██░░██───██░░██───██░░██─────────██░░██─────────██░░██─────────
─██░░██──██░░██─██░░██████████─██░░██████░░██───██░░██───██░░██─────────██░░██─────────██░░██████████─
─██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██───██░░██───██░░██─────────██░░██─────────██░░░░░░░░░░██─
─██░░██──██░░██─██░░██████████─██░░██████░░██───██░░██───██░░██─────────██░░██─────────██░░██████████─
─██░░░░██░░░░██─██░░██─────────██░░██──██░░██───██░░██───██░░██─────────██░░██─────────██░░██─────────
─████░░░░░░████─██░░██████████─██░░██──██░░██─████░░████─██░░██████████─██░░██████████─██░░██████████─
───████░░████───██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
─────██████─────██████████████─██████──██████─██████████─██████████████─██████████████─██████████████─
──────────────────────────────────────────────────────────────────────────────────────────────────────
]]

    Vehicle_1 = addict.list(addict.my_root(), "Vehicle", {}, "", function() end)

    addict.divider(Vehicle_1, "Vehicle")

------------------------------------------------------------------------------------------------------------------------------------

function vector3(x, y, z)
    return {x = x, y = y, z = z}
end

driftCamActive = false
driftCamera = nil

-- Camera defaults
camDistance = 0.0 -- backward
camHeight = 3.0    -- height above vehicle
camLateral = 0.0   -- left/right
camForward = 0.0   -- forward/backward
camPitch = 0.0   -- pitch tilt
camRollAmount = 10.0 -- roll during drift
camLerpSpeed = 0.0   -- smoothing factor
camPos = vector3(0,0,0)
camRot = vector3(0,0,0)

local Vehicle_3_Parent = addict.list(Vehicle_1, "Drift Camera", {}, "")

addict.toggle(Vehicle_3_Parent, "Drift Camera Mode", {"driftcam"}, "", function(on)
    driftCamActive = on
    addict.trigger_commands("camheight 4")
    addict.trigger_commands("camheight 5")
    addict.trigger_commands("campitch -129")
    addict.trigger_commands("campitch -130")
    addict.trigger_commands("camlerp 0")
    addict.trigger_commands("camlerp 1")
    if on then
        util.toast("Start drifting now!")
        util.create_thread(function()
            while driftCamActive do
                local veh = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
                if veh and ENTITY.DOES_ENTITY_EXIST(veh) then
                    local coords = ENTITY.GET_ENTITY_COORDS(veh, true)
                    local px, py, pz = coords.x, coords.y, coords.z

                    if not driftCamera then
                        driftCamera = CAM.CREATE_CAM("DEFAULT_SCRIPTED_CAMERA", true)
                        CAM.SET_CAM_ACTIVE(driftCamera, true)
                        CAM.RENDER_SCRIPT_CAMS(true, false, 0, true, true)
                        camPos = vector3(px, py, pz + camHeight)
                        camRot = vector3(camPitch, 0, ENTITY.GET_ENTITY_HEADING(veh))
                    end

                    local forward = ENTITY.GET_ENTITY_FORWARD_VECTOR(veh)

                    local headingRad = math.rad(ENTITY.GET_ENTITY_HEADING(veh))
                    local right = { x = math.cos(headingRad), y = math.sin(headingRad), z = 0 }

                    local speed = ENTITY.GET_ENTITY_SPEED(veh)
                    local targetDistance = camDistance + speed * 0.3

                    local desiredPos = vector3(
                        px - forward.x * targetDistance + right.x * camLateral + forward.x * camForward,
                        py - forward.y * targetDistance + right.y * camLateral + forward.y * camForward,
                        pz + camHeight
                    )

                    camPos = vector3(
                        camPos.x + (desiredPos.x - camPos.x) * camLerpSpeed,
                        camPos.y + (desiredPos.y - camPos.y) * camLerpSpeed,
                        camPos.z + (desiredPos.z - camPos.z) * camLerpSpeed
                    )

                    local roll = -ENTITY.GET_ENTITY_ROLL(veh) * camRollAmount
                    local desiredRot = vector3(camPitch, 0, ENTITY.GET_ENTITY_HEADING(veh) + roll)

                    camRot = vector3(
                        camRot.x + (desiredRot.x - camRot.x) * camLerpSpeed,
                        camRot.y + (desiredRot.y - camRot.y) * camLerpSpeed,
                        camRot.z + (desiredRot.z - camRot.z) * camLerpSpeed
                    )

                    CAM.SET_CAM_COORD(driftCamera, camPos.x, camPos.y, camPos.z)
                    CAM.SET_CAM_ROT(driftCamera, camRot.x, camRot.y, camRot.z, 2)
                end
                util.yield(0)
            end

            if driftCamera then
                CAM.SET_CAM_ACTIVE(driftCamera, false)
                CAM.RENDER_SCRIPT_CAMS(false, false, 0, true, true)
                CAM.DESTROY_CAM(driftCamera, false)
                driftCamera = nil
                util.toast("Drift camera off!")
            end
        end)
    end
end)

addict.slider(Vehicle_3_Parent, "Distance", {"camdist"}, "Adjust the distance behind the vehicle.", 1, 500, camDistance * 0, 1, function(value)
    camDistance = value / 10
end)

addict.slider(Vehicle_3_Parent, "Height", {"camheight"}, "Adjust the height behind the vehicle.", 1, 500, camDistance * 0.5, 1, function(value)
    camHeight = value / 3
end)

addict.slider(Vehicle_3_Parent, "Left & Right", {"camlateral"}, "Adjust the camera left & right.", -300, 300, camDistance * 0, 1, function(value)
    camLateral = value / 10
end)

addict.slider(Vehicle_3_Parent, "Forward & Back", {"camforward"}, "Adjust forward.", -300, 300, camDistance * 0, 1, function(value)
    camForward = value / 10
end)

addict.slider(Vehicle_3_Parent, "Pitch", {"campitch"}, "Adjust pitch.", -5000, 5000, camDistance * -13, 10, function(value)
    camPitch = value / 10
end)

addict.slider(Vehicle_3_Parent, "RollAmount", {"camroll"}, "Adjust roll.", -5000, 5000, camDistance * 0, 10, function(value)
    camRollAmount = value / 10
end)

addict.slider(Vehicle_3_Parent, "LerpSpeed", {"camlerp"}, "Adjust lerp.", -300, 300, camDistance * 1, 1, function(value)
    camLerpSpeed = value / 10
end)



Vehicle_2 = addict.list(Vehicle_1, "Vehicle Attachments", {}, "", function() end)

local model_name = "h4_prop_h4_loch_monster"
local radius = 10
local offsetX, offsetY, offsetZ = 0, 0, 1
local yawOffset = 270.0 -- default facing forward
local protectVehicles = true -- toggle for vehicle protection

local attached_props = {}
local protected_vehicles = {}

addict.text_input(Vehicle_2, "Prop model name", {"attach_prop_model"}, "Object/model name", function(str)
    if str and str ~= "" then
        model_name = str
        util.toast("Model updated. Use attach action to apply changes.")
    end
end, model_name)

addict.slider_float(Vehicle_2, "Radius (m)", {"attach_prop_radius"}, "Radius to search for vehicles", 5, 200, radius, 1, function(val)
    radius = val
end)

addict.slider_float(Vehicle_2, "Left/Right", {"attach_prop_offsetx"}, "Adjust X offset", -10, 5, offsetX, 1, function(val)
    offsetX = val
end)

addict.slider_float(Vehicle_2, "Forward/Backward", {"attach_prop_offsety"}, "Adjust Y offset", -10, 5, offsetY, 1, function(val)
    offsetY = val
end)

addict.slider_float(Vehicle_2, "Up/Down", {"attach_prop_offsetz"}, "Adjust Z offset", -10, 5, offsetZ, 1, function(val)
    offsetZ = val
end)

addict.slider_float(Vehicle_2, "Rotate", {"attach_prop_yaw"}, "Rotate prop relative to vehicle forward", -180, 180, yawOffset, 1, function(val)
    yawOffset = val
end)

addict.toggle(Vehicle_2, "Protect Vehicles from Despawn", {"protect_vehicles"}, "Prevent vehicles from despawning when props are attached", function(on)
    protectVehicles = on
    util.toast("Vehicle protection is now " .. (on and "ON" or "OFF"))
end, protectVehicles)

local function protect_vehicle(vehicle)
    if not ENTITY.DOES_ENTITY_EXIST(vehicle) then return end
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, true)
    ENTITY.FREEZE_ENTITY_POSITION(vehicle, true)
    util.yield(10)
    ENTITY.FREEZE_ENTITY_POSITION(vehicle, false)
    ENTITY.SET_ENTITY_LOAD_COLLISION_FLAG(vehicle, true, 1)
    ENTITY.SET_ENTITY_SHOULD_FREEZE_WAITING_ON_COLLISION(vehicle, false)
end

local function detach_all_props()
    for _, obj in ipairs(attached_props) do
        if ENTITY.DOES_ENTITY_EXIST(obj) then
            ENTITY.DETACH_ENTITY(obj)
        end
    end
    attached_props = {}

    for _, veh in ipairs(protected_vehicles) do
        if ENTITY.DOES_ENTITY_EXIST(veh) then
            pcall(function()
                ENTITY.SET_ENTITY_AS_NO_LONGER_NEEDED(veh)
            end)
        end
    end
    protected_vehicles = {}

    util.toast("Detached all attached props and released vehicles.")
end

addict.action(Vehicle_2, "Attach Object to Nearby Vehicles", {}, "", function()
    if not model_name or model_name == "" then
        util.toast("Please enter a valid model name.")
        return
    end

    local modelHash = util.joaat(model_name)
    STREAMING.REQUEST_MODEL(modelHash)
    local timeout = 1000
    while not STREAMING.HAS_MODEL_LOADED(modelHash) and timeout > 0 do
        util.yield(10)
        timeout = timeout - 10
    end
    if timeout <= 0 then
        util.toast("Failed to load model: " .. model_name)
        return
    end

    local playerPed = PLAYER.PLAYER_PED_ID()
    local playerPos = ENTITY.GET_ENTITY_COORDS(playerPed, true)
    detach_all_props()
    local vehicles = {}
    for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
        local vehiclePos = ENTITY.GET_ENTITY_COORDS(vehicle, true)
        local dist = SYSTEM.VDIST(playerPos.x, playerPos.y, playerPos.z, vehiclePos.x, vehiclePos.y, vehiclePos.z)
        if dist <= radius then
            table.insert(vehicles, vehicle)
        end
    end

    for _, vehicle in ipairs(vehicles) do
        local vehiclePos = ENTITY.GET_ENTITY_COORDS(vehicle, true)
        local obj = entities.create_object(modelHash, vehiclePos)

        ENTITY.ATTACH_ENTITY_TO_ENTITY(
            obj, vehicle, 0,
            offsetX, offsetY, offsetZ,
            0.0, 10.0, yawOffset,
            true, true, false, false, 2, true
        )

        table.insert(attached_props, obj)
        if protectVehicles and ENTITY.DOES_ENTITY_EXIST(vehicle) then
            protect_vehicle(vehicle)
            table.insert(protected_vehicles, vehicle)
        end
    end

    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(modelHash)
    util.toast(string.format("Attached '%s' to %d vehicles within %.1f meters.", model_name, #vehicles, radius))
end)

addict.action(Vehicle_2, "Detach All Attached Props", {}, "", function()
    detach_all_props()
end)

addict.action(Vehicle_2, "Clear All Attached Props", {}, "", function()
    addict.trigger_commands("superc 3")
end)


------------------------------------------------------------------------------------------------------------------------------------

local CarMagnet = addict.list(Vehicle_1, "Car Magnet", {}, "", function() end)

local MAGNET_RADIUS = 30.0
local magnetOn = false
local polarity = 1 -- 1 = attract, -1 = repel
local magnetThread = nil

local function getNearbyEntities(entityType, radius, origin)
    local entitiesList = {}
    if entityType == "vehicle" then
        entitiesList = entities.get_all_vehicles_as_handles()
    elseif entityType == "ped" then
        entitiesList = entities.get_all_peds_as_handles()
    end
    local nearby = {}
    for _, ent in ipairs(entitiesList) do
        if ENTITY.DOES_ENTITY_EXIST(ent) and ent ~= players.user_ped() then
            local entPos = ENTITY.GET_ENTITY_COORDS(ent, true)
            local dist = SYSTEM.VDIST(origin.x, origin.y, origin.z, entPos.x, entPos.y, entPos.z)
            if dist <= radius then
                table.insert(nearby, ent)
            end
        end
    end
    return nearby
end

local function applyMagnetForce(baseVeh, targetEnt, polarity)
    local basePos = ENTITY.GET_ENTITY_COORDS(baseVeh, true)
    local targetPos = ENTITY.GET_ENTITY_COORDS(targetEnt, true)

    local dx, dy, dz = targetPos.x - basePos.x, targetPos.y - basePos.y, targetPos.z - basePos.z
    local dist = math.max(1.0, math.sqrt(dx*dx + dy*dy + dz*dz)) -- avoid divide by zero
    local nx, ny, nz = dx / dist, dy / dist, dz / dist
    local forceMag = (polarity * 50) / dist
    ENTITY.APPLY_FORCE_TO_ENTITY(targetEnt, 1, nx * forceMag, ny * forceMag, nz * forceMag, 0, 0, 0, true, true, true, true, false, true)
end

local function magnetLoop()
    while magnetOn do
        local playerVeh = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
        if ENTITY.DOES_ENTITY_EXIST(playerVeh) then
            local origin = ENTITY.GET_ENTITY_COORDS(playerVeh, true)
            local nearbyVehs = getNearbyEntities("vehicle", MAGNET_RADIUS, origin)
            for _, veh in ipairs(nearbyVehs) do
                if veh ~= playerVeh then
                    applyMagnetForce(playerVeh, veh, polarity)
                end
            end
            local nearbyPeds = getNearbyEntities("ped", MAGNET_RADIUS, origin)
            for _, ped in ipairs(nearbyPeds) do
                applyMagnetForce(playerVeh, ped, polarity)
            end
        end
        util.yield(100)
    end
end

addict.toggle(CarMagnet, "Toggle Car Magnet", {}, "Toggle magnet mode ON/OFF", function(on)
    magnetOn = on
    if on then
        util.toast("Car Magnet ON! Default: Attract mode.")
        magnetThread = util.create_thread(magnetLoop)
    else
        util.toast("Car Magnet OFF!")
        if magnetThread then
            util.stop_thread(magnetThread)
            magnetThread = nil
        end
    end
end)

addict.action(CarMagnet, "Switch Magnet Polarity", {}, "Toggle between Attract and Repel", function()
    polarity = polarity * -1
    if polarity == 1 then
        util.toast("Magnet polarity set to: Attract")
    else
        util.toast("Magnet polarity set to: Repel")
    end
end)


------------------------------------------------------------------------------------------------------------------------------------
HitchhikerChaos = addict.list(Vehicle_1, "Hitchhiker Chaos", {}, "", function() end)

local attachedPeds = {}
local animDictPose = "misslamar1dead_body"
local animNamePose = "dead_idle"
local animDictFlail = "random@arrests"
local animNameFlail = "idle_2_hands_up"
local ATTACH_DISTANCE = 100.0 -- meters

local randomAttach = true
addict.toggle(HitchhikerChaos, "Random Attach Points", {}, "If off, peds always attach to hood", function(toggle)
    randomAttach = toggle
end, randomAttach)

local launchIndex = 1

local function loadAnimDict(dict)
    STREAMING.REQUEST_ANIM_DICT(dict)
    while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do
        util.yield()
    end
end

local function getTargetVehicle()
    local ped = players.user_ped()
    if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
        return PED.GET_VEHICLE_PED_IS_IN(ped, false)
    else
        local vehicles = entities.get_all_vehicles_as_handles()
        local pos = ENTITY.GET_ENTITY_COORDS(ped, true)
        local closestVeh, minDist = nil, ATTACH_DISTANCE
        for _, veh in ipairs(vehicles) do
            local vehPos = ENTITY.GET_ENTITY_COORDS(veh, true)
            local dx, dy, dz = pos.x - vehPos.x, pos.y - vehPos.y, pos.z - vehPos.z
            local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
            if dist < minDist then
                closestVeh = veh
                minDist = dist
            end
        end
        return closestVeh
    end
end

local function attachHandsKneesPed(veh, ped, attachPoint)
    loadAnimDict(animDictPose)
    loadAnimDict(animDictFlail)

    TASK.TASK_PLAY_ANIM(ped, animDictPose, animNamePose, 8.0, -8.0, -1, 1, 0, false, false, false)
    TASK.TASK_PLAY_ANIM(ped, animDictFlail, animNameFlail, 8.0, -8.0, -1, 49, 0, false, false, false)

    local offsets = {
        hood  = {x = 0.0, y = 2.2, z = 0.5},
        roof  = {x = 0.0, y = 0.0, z = 1.3},
        trunk = {x = 0.0, y = -2.0, z = 0.5}
    }
    local off = offsets[attachPoint] or offsets.hood

    ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, veh, 0, off.x, off.y, off.z, 0.0, 0.0, 0.0, false, false, true, false, 2, true)
    table.insert(attachedPeds, ped)

    AUDIO.PLAY_PAIN(ped, 7, 0) -- Panic scream

    util.create_thread(function()
        while ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(ped, veh) do
            util.yield(math.random(3000, 5000))
            if ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(ped, veh) then
                AUDIO.PLAY_PAIN(ped, 7, 0)
            end
        end
    end)
end

addict.action(HitchhikerChaos, "Grab Nearby Peds", {}, "Attach all nearby NPCs within 100m", function()
    local veh = getTargetVehicle()
    if not veh then util.toast("No vehicle found!") return end

    local myPed = players.user_ped()
    local myPos = ENTITY.GET_ENTITY_COORDS(myPed, true)
    local peds = entities.get_all_peds_as_handles()

    local count = 0
    for _, ped in ipairs(peds) do
        if ped ~= myPed and not PED.IS_PED_IN_ANY_VEHICLE(ped, false) and not PED.IS_PED_A_PLAYER(ped) then
            local pedPos = ENTITY.GET_ENTITY_COORDS(ped, true)
            local dx, dy, dz = myPos.x - pedPos.x, myPos.y - pedPos.y, myPos.z - pedPos.z
            local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
            if dist <= ATTACH_DISTANCE then
                local spot
                if randomAttach then
                    local spots = {"hood", "roof", "trunk"}
                    spot = spots[math.random(#spots)]
                else
                    spot = "hood"
                end
                attachHandsKneesPed(veh, ped, spot)
                count = count + 1
            end
        end
    end
    util.toast(count .. " hitchhikers attached!")
end)

addict.action(HitchhikerChaos, "Launch Next Hitchhiker", {}, "Launch one attached ped forward each time you press", function()
    local veh = getTargetVehicle()
    if not veh then
        util.toast("No vehicle found!")
        return
    end

    if #attachedPeds == 0 then
        util.toast("No hitchhikers attached!")
        launchIndex = 1
        return
    end

    if launchIndex > #attachedPeds then
        launchIndex = 1
    end

    local ped = attachedPeds[launchIndex]
    if ENTITY.DOES_ENTITY_EXIST(ped) then
        ENTITY.DETACH_ENTITY(ped, true, true)

        local forward = ENTITY.GET_ENTITY_FORWARD_VECTOR(veh)
        ENTITY.APPLY_FORCE_TO_ENTITY(
            ped, 1,
            forward.x * 60.0,
            forward.y * 60.0,
            25.0,
            0.0, 0.0, 0.0,
            0,
            false, true, true, false, true
        )
        TASK.CLEAR_PED_TASKS(ped)
    end
    table.remove(attachedPeds, launchIndex)
    util.toast("Launched hitchhiker #" .. launchIndex)
end)

addict.action(HitchhikerChaos, "Reset Hitchhikers", {}, "Detach all attached peds and clear list", function()
    for _, ped in ipairs(attachedPeds) do
        if ENTITY.DOES_ENTITY_EXIST(ped) and ENTITY.IS_ENTITY_ATTACHED(ped) then
            ENTITY.DETACH_ENTITY(ped, true, true)
            TASK.CLEAR_PED_TASKS(ped)
        end
    end
    attachedPeds = {}
    launchIndex = 1
    util.toast("All hitchhikers reset and detached!")
end)

------------------------------------------------------------------------------------------------------------------------------------

StealEngines = addict.list(Vehicle_1, "Steal Car Parts", {}, "", function() end)


addict.action(StealEngines, "Open/Close Hood", {}, "Open or close the hood of the nearest vehicle", function()
    local ped = players.user_ped()
    local pos = ENTITY.GET_ENTITY_COORDS(ped, true)
    local vehicles = entities.get_all_vehicles_as_handles()

    local closestVeh, minDist = nil, 5.0
    for _, veh in ipairs(vehicles) do
        local vehPos = ENTITY.GET_ENTITY_COORDS(veh, true)
        local dx, dy, dz = pos.x - vehPos.x, pos.y - vehPos.y, pos.z - vehPos.z
        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
        if dist < minDist then
            closestVeh = veh
            minDist = dist
        end
    end

    if not closestVeh then
        util.toast("No vehicle nearby!")
        return
    end

    local isHoodOpen = VEHICLE.GET_VEHICLE_DOOR_ANGLE_RATIO(closestVeh, 4) > 0.1 -- Hood index is 4

    if isHoodOpen then
        VEHICLE.SET_VEHICLE_DOOR_SHUT(closestVeh, 4, false)
        util.toast("Hood closed.")
    else
        VEHICLE.SET_VEHICLE_DOOR_OPEN(closestVeh, 4, false, false)
        util.toast("Hood opened.")
    end
end)

local ENGINE_MODEL = util.joaat("prop_car_engine_01")
local WHEEL_MODEL = util.joaat("prop_wheel_01")
local TYRE_MODEL = util.joaat("prop_wheel_tyre")
local CARRY_BONE = 57005 -- Right hand

local spawnedParts = {}

local function loadAnimDict(dict)
    STREAMING.REQUEST_ANIM_DICT(dict)
    while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do
        util.yield()
    end
end

local function getClosestVehicle(maxDist)
    local ped = players.user_ped()
    local pos = ENTITY.GET_ENTITY_COORDS(ped, true)
    local vehicles = entities.get_all_vehicles_as_handles()

    local closestVeh, minDist = nil, maxDist or 5.0
    for _, veh in ipairs(vehicles) do
        local vehPos = ENTITY.GET_ENTITY_COORDS(veh, true)
        if vehPos and pos then
            local dx = pos.x - vehPos.x
            local dy = pos.y - vehPos.y
            local dz = pos.z - vehPos.z
            local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
            if dist < minDist then
                closestVeh = veh
                minDist = dist
            end
        end
    end
    return closestVeh
end

addict.action(StealEngines, "Steal Engine", {}, "Pull engine from nearest vehicle and carry it. Note: if you want to do this to players properly go here Players>NAME>Vehicle Events>Steal Engines", function()
    local ped = players.user_ped()
    local closestVeh = getClosestVehicle(5.0)
    if not closestVeh then
        util.toast("No vehicle nearby!")
        return
    end

    local vehCoords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(closestVeh, 0.0, 2.5, 0.5)
    local engineObj = entities.create_object(ENGINE_MODEL, vehCoords)
    table.insert(spawnedParts, engineObj)

    VEHICLE.SET_VEHICLE_ENGINE_HEALTH(closestVeh, -4000)
    VEHICLE.SET_VEHICLE_BODY_HEALTH(closestVeh, -4000)
    VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(closestVeh, -4000)

    loadAnimDict("anim@heists@box_carry@")
    TASK.TASK_PLAY_ANIM(ped, "anim@heists@box_carry@", "idle", 8.0, -8.0, -1, 49, 0, false, false, false)

    local bone = PED.GET_PED_BONE_INDEX(ped, CARRY_BONE)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(engineObj, ped, bone,
        0.15, 0.0, -0.50,
        0.0, 0.0, 0.0,
        true, true, false, false, 2, true)

    util.toast("Engine pulled and attached!")
end)


addict.action(StealEngines, "Steal All 4 Tyres", {}, "Pull all tyres off nearest vehicle and carry them stacked", function()
    local ped = players.user_ped()
    local closestVeh = getClosestVehicle(5.0)
    if not closestVeh then
        util.toast("No vehicle nearby!")
        return
    end

    VEHICLE.SET_VEHICLE_TYRE_BURST(closestVeh, 0, true, 1000.0) -- front left
    VEHICLE.SET_VEHICLE_TYRE_BURST(closestVeh, 1, true, 1000.0) -- front right
    VEHICLE.SET_VEHICLE_TYRE_BURST(closestVeh, 4, true, 1000.0) -- rear left
    VEHICLE.SET_VEHICLE_TYRE_BURST(closestVeh, 5, true, 1000.0) -- rear right

    local wheelStack = {}

    local vehCoords = ENTITY.GET_ENTITY_COORDS(closestVeh, true)
    local spawnPos = {
        x = vehCoords.x + 2.0,
        y = vehCoords.y + 2.0,
        z = vehCoords.z + 0.5
    }

    for i = 1, 4 do
        local wheelObj = entities.create_object(TYRE_MODEL, spawnPos)
        table.insert(wheelStack, wheelObj)
        table.insert(spawnedParts, wheelObj)
    end

    loadAnimDict("anim@heists@box_carry@")
    TASK.TASK_PLAY_ANIM(ped, "anim@heists@box_carry@", "idle", 8.0, -8.0, -1, 49, 0, false, false, false)

    local bone = PED.GET_PED_BONE_INDEX(ped, CARRY_BONE)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        wheelStack[1], ped, bone,
        0.30, 0.6, -0.3,
        0.0, 0.0, 0.0,
        true, true, false, false, 2, true
    )

    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        wheelStack[2], wheelStack[1], 0,
        0.0, -0.20, 0.0,
        0.0, 0.0, 0.0,
        true, true, false, false, 2, true
    )

    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        wheelStack[3], wheelStack[2], 0,
        0.0, -0.20, 0.0,
        0.0, 0.0, 0.0,
        true, true, false, false, 2, true
    )

    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        wheelStack[4], wheelStack[3], 0,
        0.0, -0.20, 0.0,
        0.0, 0.0, 0.0,
        true, true, false, false, 2, true
    )

    util.yield(5000)
    util.toast("Tyres removed from vehicle and stacked on you!")
end)


addict.action(StealEngines, "Steal All 4 Wheels", {}, "Pull all wheels off nearest vehicle, remove them from the car, and carry as stack. Works best with 4x4 vehicles.", function()
    local ped = players.user_ped()
    local closestVeh = getClosestVehicle(5.0)
    if not closestVeh then
        util.toast("No vehicle nearby!")
        return
    end

    for i = 0, 5 do
        entities.detach_wheel(entities.handle_to_pointer(closestVeh), i)
    end

    addict.trigger_commands("superc 3")
    util.yield(1000)
    local wheelStack = {}

    local vehCoords = ENTITY.GET_ENTITY_COORDS(closestVeh, true)
    local spawnPos = {
        x = vehCoords.x + 2.0,
        y = vehCoords.y + 2.0,
        z = vehCoords.z + 0.5
    }

    for i = 1, 4 do
        local wheelObj = entities.create_object(WHEEL_MODEL, spawnPos)
        table.insert(wheelStack, wheelObj)
        table.insert(spawnedParts, wheelObj)
    end

    loadAnimDict("anim@heists@box_carry@")
    TASK.TASK_PLAY_ANIM(ped, "anim@heists@box_carry@", "idle", 8.0, -8.0, -1, 49, 0, false, false, false)

    local bone = PED.GET_PED_BONE_INDEX(ped, CARRY_BONE)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        wheelStack[1], ped, bone,
        0.30, 0.6, -0.3,
        0.0, 0.0, 0.0,
        true, true, false, false, 2, true
    )

    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        wheelStack[2], wheelStack[1], 0,
        0.0, -0.20, 0.0,
        0.0, 0.0, 0.0,
        true, true, false, false, 2, true
    )

    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        wheelStack[3], wheelStack[2], 0,
        0.0, -0.20, 0.0,
        0.0, 0.0, 0.0,
        true, true, false, false, 2, true
    )

    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        wheelStack[4], wheelStack[3], 0,
        0.0, -0.20, 0.0,
        0.0, 0.0, 0.0,
        true, true, false, false, 2, true
    )
    util.yield()
    util.toast("Wheels removed from vehicle and stacked on you!")
end)

addict.action(StealEngines, "Drop Parts", {}, "Drop currently carried parts", function()
    local ped = players.user_ped()
    if #spawnedParts == 0 then
        util.toast("No parts to drop!")
        return
    end
    for _, part in ipairs(spawnedParts) do
        if ENTITY.DOES_ENTITY_EXIST(part) then
            ENTITY.DETACH_ENTITY(part, true, true)
            ENTITY.APPLY_FORCE_TO_ENTITY(part, 1, 0.0, 2.0, 0.5, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
        end
    end
    TASK.CLEAR_PED_TASKS(ped)
    util.toast("Parts dropped!")
    spawnedParts = {}
end)

local PART_MODELS = {
    util.joaat("prop_car_engine_01"),  -- engine
    util.joaat("prop_wheel_01"),     -- wheel
    util.joaat("prop_wheel_tyre"),     -- tyre
}

local function distance3D(a, b)
    local dx = a.x - b.x
    local dy = a.y - b.y
    local dz = a.z - b.z
    return math.sqrt(dx*dx + dy*dy + dz*dz)
end

function delete_broken_parts(radius)
    local ped = players.user_ped()
    local pedPos = ENTITY.GET_ENTITY_COORDS(ped, true)

    local deletedCount = 0

    for _, obj in pairs(entities.get_all_objects_as_handles()) do
        if ENTITY.DOES_ENTITY_EXIST(obj) then
            local objPos = ENTITY.GET_ENTITY_COORDS(obj, true)
            local dist = distance3D(pedPos, objPos)
            if dist <= radius then
                local model = ENTITY.GET_ENTITY_MODEL(obj)
                local isVehiclePart = false
                local vehicleParts = {
                    "prop_wheel_01",
                    "prop_wheel_02",
                    "prop_wheel_03",
                    "prop_wheel_04",
                    "prop_door_01",
                    "prop_bumper_01",
                    "prop_wheel_tyre",
                    "prop_bumper_02"
                }

                for _, partName in ipairs(vehicleParts) do
                    if model == util.joaat(partName) then
                        isVehiclePart = true
                        break
                    end
                end
                if isVehiclePart then
                    entities.delete_by_handle(obj)
                    deletedCount = deletedCount + 1
                end
            end
        end
    end

    util.toast("Deleted " .. deletedCount .. " broken vehicle parts nearby!")
end

addict.action(StealEngines, "Delete Broken Vehicle Parts", {}, "Delete all broken vehicle parts around you", function()
    delete_broken_parts(10.0) -- 10 meter radius
end)

------------------------------------------------------------------------------------------------------------------------------------

util.create_thread(function()
	while true do
		if drift then
			local veh = entities.get_user_vehicle_as_handle()
			if veh then
				if PAD.IS_CONTROL_PRESSED(21, 21) then
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, true)
                    VEHICLE.SET_VEHICLE_REDUCE_GRIP_LEVEL(veh, 0.0)
				else
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, false)
				end
			end        
		end
		util.yield()
	end
end)

drift = false
addict.toggle(Vehicle_1, "Shift to Drift", {"driftmode"}, "Works using shift key or controller as (A for xbox & X for playstation)", function(on_toggle)
    drift = on_toggle
end)

------------------------------------------------------------------------------------------------------------------------------------

addict.toggle_loop(Vehicle_1, "Stick to Walls", {'sticktg'}, 'Makes it to where the vehicle sticks to walls(using horn boost on the lowest setting helps get up on the walls)', function ()
    local curcar = entities.get_user_vehicle_as_handle()
    if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(curcar, 1, 0, 0, - 0.5, 0, true, true, true, true)
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(curcar, 40)
    else
        util.yield()
    end
end)

------------------------------------------------------------------------------------------------------------------------------------
    
    addict.toggle_loop(Vehicle_1,"All Vehicles Rainbow", {"rainbowvehicles"}, "Turns all vehicles rainbow and sets plates to 'Addict'.", function()
        for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
            VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(veh, math.random(0, 255), math.random(0, 255), math.random(0, 255), chrome)
            VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(veh, math.random(0, 255), math.random(0, 255), math.random(0, 255), chrome)
            VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(veh, math.random(0, 255), math.random(0, 255), math.random(0, 255))
            DECORATOR.DECOR_SET_INT(vehicle, "MPBitset", math.random(0, 50))
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, math.random(17, 22), true)
            VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, math.random(0, 49))
            VEHICLE.SET_VEHICLE_WINDOW_TINT(veh, math.random(0, 6))
            VEHICLE.SET_VEHICLE_WHEEL_TYPE(veh, math.random(0, 5))
            VEHICLE.SET_VEHICLE_MOD(vehicle, math.random(0, 49))
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(veh, "Addict")
        end
    end)
     
    addict.toggle_loop(Vehicle_1,"All Vehicles Pink", {"pinkvehicles"}, "Turns all vehicles pink and sets plates to 'Addict'.", function()
        for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(veh, 255, 0, 255, chrome)
            VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(veh,255, 0, 255, chrome)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(veh, "Addict")
        end
    end)

    addict.toggle_loop(Vehicle_1,"Spinbot Nearby Vehicles", {"glitchall"}, "", function()
        for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
                ENTITY.APPLY_FORCE_TO_ENTITY(veh, 5, 0, 0, 150.0, 0, 0, 0, 0, true, false, true, false, true)
                cam_pos = CAM.GET_GAMEPLAY_CAM_ROT(0)
                cam_pos.x = cam_pos.x + math.random(-20,20)
                cam_pos.y = cam_pos.y + math.random(-20,20)
                cam_pos.z = cam_pos.z + math.random(-20,20)
                ENTITY.SET_ENTITY_ROTATION(veh, cam_pos.x, cam_pos.y, cam_pos.z, 1, true);
        end
    end)
    
    addict.toggle_loop(Vehicle_1, "360 Self Vehicle", {"spinbotself"}, "", function()
        local vehicle = PED.GET_VEHICLE_PED_IS_USING(players.user_ped())
        local velocity = ENTITY.GET_ENTITY_VELOCITY(vehicle)
        local height = ENTITY.GET_ENTITY_HEIGHT_ABOVE_GROUND(vehicle)
        if vehicle ~= 0 and not PED.IS_PED_DEAD_OR_DYING(players.user_ped()) and NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vehicle) then
            ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 5, 0, 0, 150.0, 0, 0, 0, 0, true, false, true, false, true)
        end
    end)
    
    addict.toggle_loop(Vehicle_1,"360 Nearby Vehicles", {"360vehicles"}, "", function()
        for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            ENTITY.APPLY_FORCE_TO_ENTITY(veh, 5, 0, 0, 150.0, 0, 0, 0, 0, true, false, true, false, true)
        end
    end)

    addict.toggle_loop(Vehicle_1,"No Collision (fall) Nearby Vehicles", {"nocolisionfall"}, "", function()
        for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            ENTITY.SET_ENTITY_COLLISION(veh, false, false)
        end
    end)


    no_collision_range = 60

    range_slider = addict.slider(Vehicle_1, "No Collision Range", {"nocolisionrange"}, "Adjust the distance (in meters) to disable collisions with nearby vehicles", 5, 500, 5, 60, function(value)
            no_collision_range = value
    end)

    addict.toggle_loop(Vehicle_1, "No Collision Nearby Vehicles", {"nocolisionvehs"}, "", function()
        myVeh = entities.get_user_vehicle_as_handle(true)
        if myVeh == INVALID_GUID then return end
        myPos = ENTITY.GET_ENTITY_COORDS(myVeh)
        for _, veh in pairs(entities.get_all_vehicles_as_handles()) do
            if veh ~= myVeh and veh ~= INVALID_GUID then
                vehPos = ENTITY.GET_ENTITY_COORDS(veh)
                if v3.distance(myPos, vehPos) < no_collision_range then
                    ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(myVeh, veh, true)
                    ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(veh, myVeh, true)
                end
            end
        end
    end)


    addict.toggle_loop(Vehicle_1,"Bounce Nearby Vehicles", {"bounceall"}, "", function()
        for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, 0, 0, 10, true, false, true)
            util.yield(250)
        end
    end)

    addict.toggle_loop(Vehicle_1,"Nearby vehicles fly away", {"flyawayvehicles"}, "", function()
        for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, 0, 0, 100, true, false, true)
            util.yield(10)
        end
    end)

	local dont_stop = false
	addict.toggle_loop(Vehicle_1,"Fly Nearby vehicles", {"vehflyall"}, "Basically 'impulse like sport mode' but applied to every vehicle", function()
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
				cam_pos = CAM.GET_GAMEPLAY_CAM_ROT(0)
    			ENTITY.SET_ENTITY_ROTATION(veh, cam_pos.x, cam_pos.y, cam_pos.z, 1, true);
				local locspeed = speed*10
				local locspeed2 = speed
				if PAD.IS_CONTROL_PRESSED(0, 61) then
					locspeed = locspeed*2
					locspeed2 = locspeed2*2
				end
				if PAD.IS_CONTROL_PRESSED(2, 71) then
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, speed, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, locspeed)
					end
				end
				if PAD.IS_CONTROL_PRESSED(2, 72) then
					local lsp = speed
					if not PAD.IS_CONTROL_PRESSED(0, 61) then 
						lsp = speed * 2
					end
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, 0 - (lsp), 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0 - (locspeed));
					end
			   end
				if PAD.IS_CONTROL_PRESSED(2, 63) then
					local lsp = (0 - speed)*2
					if not PAD.IS_CONTROL_PRESSED(0, 61) then 
						lsp = 0 - speed
					end
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, (lsp), 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0 - (locspeed), 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1);
					end
				end
				if PAD.IS_CONTROL_PRESSED(2, 64) then
					local lsp = speed
					if not PAD.IS_CONTROL_PRESSED(0, 61) then 
						lsp = speed*2
					end
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, lsp, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, locspeed, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					end
				end
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
			end
		end
	end)


    addict.toggle_loop(Vehicle_1,"Destruction", {"destuct"}, "", function()
        util.show_corner_help("~r~Don't use this if your alone it will cause a prevented crash (A0:32).")
        Destruct()
    end)
 
    	addict.toggle_loop(Vehicle_1,"Fuck up all cars", {"fuckupallcars"}, "Beats the SHIT out of all nearby cars. But this damage is only local.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            local locspeed2 = speed
            local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
                ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                VEHICLE.SET_VEHICLE_DAMAGE(veh, math.random(-5.0, 5.0), math.random(-5.0, 5.0), math.random(-5.0,5.0), 200.0, 10000.0, true)
            if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
			end
		end
	end)

	addict.toggle_loop(Vehicle_1,"Honk all cars", {"honkallcars"}, "Honkss the SHIT out of all nearby cars.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            local locspeed2 = speed
            local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
                ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                VEHICLE.START_VEHICLE_HORN(veh, 200, util.joaat("HELDDOWN"), true)
            if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
			end
		end
	end)
  
	addict.toggle_loop(Vehicle_1, "All cars sink", {"sinkcars"}, "All cars sink.", function(on_toggle)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            local locspeed2 = speed
            local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
                ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                VEHICLE.SET_DISABLE_MAP_COLLISION(veh, vcoords, true)
            if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
			end
		end
	end)

    local wheelRadius = addict.slider(Vehicle_1, "Wheel Removal Radius", {"wheelradius"}, "Change the radius of vehicles affected", 10, 50000, 10, 10, function(value)
    end)

    addict.action(Vehicle_1, "Remove Wheels Nearby", {"removewheels"}, "Removes wheels from all vehicles in the set radius", function()
        local ped = players.user_ped()
        local pos = ENTITY.GET_ENTITY_COORDS(ped, true)
        local vehicles = entities.get_all_vehicles_as_handles()
        local radius = addict.get_value(wheelRadius)

        for _, veh in ipairs(vehicles) do
            local vehPos = ENTITY.GET_ENTITY_COORDS(veh, true)
            if vehPos then
                local dx = pos.x - vehPos.x
                local dy = pos.y - vehPos.y
                local dz = pos.z - vehPos.z
                local dist = math.sqrt(dx*dx + dy*dy + dz*dz)

                if dist <= radius then
                    for i = 0, 5 do
                        entities.detach_wheel(entities.handle_to_pointer(veh), i)
                    end
                end
            end
        end
    end)

	addict.action(Vehicle_1,"Kill all Engines", {"killall"}, "",function()
		local local_veh = get_player_vehicle(PLAYER.PLAYER_ID(),false)
		for_table_do(entities.get_all_vehicles_as_handles(),true,function(ent) 
			if ent == local_veh then return end
			VEHICLE.SET_VEHICLE_ENGINE_HEALTH(ent, -4000)
			VEHICLE.SET_VEHICLE_BODY_HEALTH(ent, -4000)
			VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(ent, -4000)
		end)
	end)

    addict.action(Vehicle_1, "Sirens All Nearby Players", {"sirenall"}, "", function()
        for _, pid in players.list(false, true, true) do
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = players.get_position(pid)
            if ENTITY.DOES_ENTITY_EXIST(ped) then
            addict.trigger_commands("siren " .. players.get_name(pid))
            end
        end
    end)

    local world_addict = addict.list(Vehicle_1, "Anti-Try Hard Shit", {"tryhardshit"}, "")

	addict.divider(world_addict, "Anti-Try Hard Shit")

	oppressor_kick_players = false
	addict.toggle(world_addict, "Anti-Oppressor", {"antioppressor"}, "Automatically kicks players off oppressor mkii's", function(on)
		oppressor_kick_players = on
	end, false)
    
	lazer_kick_players = false
	addict.toggle(world_addict, "Anti-Lazer", {"antilazer"}, "Automatically kicks players out lazers", function(on)
		lazer_kick_players = on
	end, false)

    kosatka_kick_players = false
	addict.toggle(world_addict, "Anti-Kosatka", {"antikosatka"}, "Automatically kicks players out kosatka", function(on)
		kosatka_kick_players = on
	end, false)

    hydra_kick_players = false
	addict.toggle(world_addict, "Anti-Hydra", {"antihydra"}, "Automatically kicks players out hydra", function(on)
		hydra_kick_players = on
	end, false)

    khanjali_kick_players = false
	addict.toggle(world_addict, "Anti-Khanjali", {"antikhanjali"}, "Automatically kicks players out khanjali", function(on)
		khanjali_kick_players = on
	end, false)
 
	target_self = false
	addict.toggle(world_addict, "Target self", {"targetselfmk2"}, "Targets your mk2's as well (this is stupid)", function(on)
		target_self = on
	end, false)

	target_friends = false
	addict.toggle(world_addict, "Target friends", {"targetfriendsmk2"}, "Targets your friends' mk2's as well", function(on)
		target_friends = on
	end, false)

local driveshit = addict.list(Vehicle_1, "Driving Shit", {}, "")

addict.action(driveshit, "Candy Paint", {"candypaint"}, "", function()
    candy_paint(true)
end)

addict.action(driveshit,"Tp into nearest vehicle", {"tptonearveh"}, "",function()
    local player = PLAYER.PLAYER_PED_ID(pid)
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    local P_Coords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
    local vehicles = entities.get_all_vehicles_as_handles()
    local vehicle = get_closest_vehicle(vehicles)
if ENTITY.DOES_ENTITY_EXIST(vehicle) then
    PED.SET_PED_INTO_VEHICLE(player, vehicle, -1)
    end
end)

addict.slider(driveshit, "Change seat", {"switchseat"}, "DriverSeat = -1 Passenger = 0 Left Rear = 1 RightRear = 2", -1, 7, -1, 1, function(seatnumber)
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    local vehicle = entities.get_user_vehicle_as_handle()
    PED.SET_PED_INTO_VEHICLE(ped, vehicle, seatnumber)
end)

local autodrive = addict.list(driveshit, "Auto Drive", {"autodrive"}, "")

chauffeur_root = addict.list(autodrive, "Chauffeur", {"chauffeur"}, "")

taxi_ped = 0
taxi_veh = 0
taxi_blip = -1

taxi_veh_options = {"Taxi", "Eudora", "Broadway"}

addict.list_action(chauffeur_root, "Taxi Vehicles", {"taxiveh"}, "", taxi_veh_options, function(index, value, click_type)
    vhash = util.joaat(value)
    phash = util.joaat("s_m_y_casino_01")
    if taxi_veh ~= 0 then
        entities.delete_by_handle(taxi_veh)
    end
    if taxi_ped ~= 0 then
        util.remove_blip(taxi_blip)
        entities.delete_by_handle(taxi_ped)
    end 
    plyr = players.user_ped()
    coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(plyr, 0.0, 5.0, 0.0)
    RequestModel(vhash)
    RequestModel(phash)
    taxi_veh = entities.create_vehicle(vhash, coords, ENTITY.GET_ENTITY_HEADING(plyr))
    ENTITY.SET_ENTITY_INVINCIBLE(taxi_veh, true)
    taxi_ped = entities.create_ped(32, phash, coords, ENTITY.GET_ENTITY_HEADING(plyr))
    PED.SET_PED_RELATIONSHIP_GROUP_HASH(taxi_ped, util.joaat("rgFM_AiLike"))
    taxi_blip = HUD.ADD_BLIP_FOR_ENTITY(taxi_ped)
    HUD.SET_BLIP_COLOUR(taxi_blip, 7)
    ENTITY.SET_ENTITY_INVINCIBLE(taxi_ped, true)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(taxi_ped, true)
    PED.SET_PED_FLEE_ATTRIBUTES(taxi_ped, 0, false)
    PED.SET_PED_CAN_BE_DRAGGED_OUT(taxi_ped, false)
    VEHICLE.SET_VEHICLE_EXCLUSIVE_DRIVER(taxi_veh, taxi_ped, -1)
    PED.SET_PED_INTO_VEHICLE(taxi_ped, taxi_veh, -1)
    ENTITY.SET_ENTITY_INVINCIBLE(taxi_ped, true)
    PED.SET_PED_INTO_VEHICLE(players.user_ped(), taxi_veh, 0)
    util.yield(500)
    addict.trigger_commands("tune")
    addict.trigger_commands("frontwheels" .. " 18")
    addict.trigger_commands("wheeltype" .. " 9")
    addict.trigger_commands("headlights" .. " 0")
    addict.trigger_commands("windowtint" .. " 1")
    addict.trigger_commands("livery" .. " 11")
    VEHICLE.SET_VEHICLE_WINDOW_TINT(taxi_veh, 1)
    VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(taxi_veh, "Addict")
    util.toast("Taxi driver created!")
end)

Boat_veh_options = {"Avisa", "Kosatka", "Submersible2", "Tug", "Seashark3"}

addict.list_action(chauffeur_root, "Sea Vehicles", {"seaveh"}, "", Boat_veh_options, function(index, value, click_type)
    vhash = util.joaat(value)
    phash = util.joaat("s_m_y_casino_01")
    if taxi_veh ~= 0 then
        entities.delete_by_handle(taxi_veh)
    end
    if taxi_ped ~= 0 then
        util.remove_blip(taxi_blip)
        entities.delete_by_handle(taxi_ped)
    end 
    plyr = players.user_ped()
    coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(plyr, 0.0, 5.0, 0.0)
    RequestModel(vhash)
    RequestModel(phash)
    taxi_veh = entities.create_vehicle(vhash, coords, ENTITY.GET_ENTITY_HEADING(plyr))
    ENTITY.SET_ENTITY_INVINCIBLE(taxi_veh, true)
    taxi_ped = entities.create_ped(32, phash, coords, ENTITY.GET_ENTITY_HEADING(plyr))
    PED.SET_PED_RELATIONSHIP_GROUP_HASH(taxi_ped, util.joaat("rgFM_AiLike"))
    taxi_blip = HUD.ADD_BLIP_FOR_ENTITY(taxi_ped)
    HUD.SET_BLIP_COLOUR(taxi_blip, 7)
    ENTITY.SET_ENTITY_INVINCIBLE(taxi_ped, true)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(taxi_ped, true)
    PED.SET_PED_FLEE_ATTRIBUTES(taxi_ped, 0, false)
    PED.SET_PED_CAN_BE_DRAGGED_OUT(taxi_ped, false)
    VEHICLE.SET_VEHICLE_EXCLUSIVE_DRIVER(taxi_veh, taxi_ped, -1)
    PED.SET_PED_INTO_VEHICLE(taxi_ped, taxi_veh, -1)
    ENTITY.SET_ENTITY_INVINCIBLE(taxi_ped, true)
    PED.SET_PED_INTO_VEHICLE(players.user_ped(), taxi_veh, 2)
    util.yield(500)
    addict.trigger_commands("tune")
    addict.trigger_commands("frontwheels" .. " 18")
    addict.trigger_commands("wheeltype" .. " 9")
    addict.trigger_commands("headlights" .. " 0")
    addict.trigger_commands("windowtint" .. " 1")
    addict.trigger_commands("livery" .. " 11")
    addict.trigger_commands("livery" .. " 11")
    VEHICLE.SET_VEHICLE_WINDOW_TINT(taxi_veh, 1)
    VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(taxi_veh, "Addict")
    util.toast("Boat driver created!")
end)

chauffeur_veh_options = {"T20", "Sm722", "Btype3", "Btype2", "Tenf2", "Stretch", "Patriot2", "Kuruma", "Draugur", "Rhinehart", "Sentinel4", "Vigero2", 
"Weevil2", "Journey2", "Surfer3", "Manchez2", "Manchez", "Vagner", "Zhaba", "Apc", "Chernobog", "Khanjali", "Rhino", "Halftrack", "Faggio3", "Hakuchou2", 
"Mesa2", "Ambulance", "Windsor2", "Asbo", "Issi5", "Issi3", "Dilettante2", "Cerberus2", "Phantom2"}

addict.list_action(chauffeur_root, "Chauffeur Vehicles", {"chauffeurveh"}, "", chauffeur_veh_options, function(index, value, click_type)
    vhash = util.joaat(value)
    phash = util.joaat("s_m_y_casino_01")
    if taxi_veh ~= 0 then
        entities.delete_by_handle(taxi_veh)
    end
    if taxi_ped ~= 0 then
        util.remove_blip(taxi_blip)
        entities.delete_by_handle(taxi_ped)
    end 
    plyr = players.user_ped()
    coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(plyr, 0.0, 5.0, 0.0)
    RequestModel(vhash)
    RequestModel(phash)
    taxi_veh = entities.create_vehicle(vhash, coords, ENTITY.GET_ENTITY_HEADING(plyr))
    max_out_car(taxi_veh)
    VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(taxi_veh, "Addict")
    VEHICLE.SET_VEHICLE_COLOURS(taxi_veh, 0, 0)
    ENTITY.SET_ENTITY_INVINCIBLE(taxi_veh, true)
    taxi_ped = entities.create_ped(32, phash, coords, ENTITY.GET_ENTITY_HEADING(plyr))
    PED.SET_PED_RELATIONSHIP_GROUP_HASH(taxi_ped, util.joaat("rgFM_AiLike"))
    taxi_blip = HUD.ADD_BLIP_FOR_ENTITY(taxi_ped)
    HUD.SET_BLIP_COLOUR(taxi_blip, 7)
    ENTITY.SET_ENTITY_INVINCIBLE(taxi_ped, true)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(taxi_ped, true)
    PED.SET_PED_FLEE_ATTRIBUTES(taxi_ped, 0, false)
    PED.SET_PED_CAN_BE_DRAGGED_OUT(taxi_ped, false)
    VEHICLE.SET_VEHICLE_EXCLUSIVE_DRIVER(taxi_veh, taxi_ped, -1)
    PED.SET_PED_INTO_VEHICLE(taxi_ped, taxi_veh, -1)
    ENTITY.SET_ENTITY_INVINCIBLE(taxi_ped, true)
    PED.SET_PED_INTO_VEHICLE(players.user_ped(), taxi_veh, 2)
    addict.trigger_commands("livery" .. " 11")
    VEHICLE.SET_VEHICLE_WINDOW_TINT(taxi_veh, 1)
    VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(taxi_veh, "Addict")
    util.toast("Chauffeur driver created!")
end)

addict.divider(chauffeur_root, "_________________________________________")

local drive_speed = 15.0
local drive_style = 0
local is_driving = false

addict.slider(chauffeur_root, "Driving Speed", {"setaispeed"}, "", 0, 200, drive_speed, 5.0, function(speed, prev)
    drive_speed = speed
end)

addict.action(chauffeur_root, "Drive to waypoint", {"drivetowp"}, "", function(drive_speed)
    if taxi_ped == 0 then
        util.toast("No active chauffeur you fool!")
    else
        goto_coords = get_waypoint_coords()
        if goto_coords ~= nil then
            TASK.TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(taxi_ped, taxi_veh, goto_coords['x'], goto_coords['y'], goto_coords['z'], 15, 786996, 5)
        end
    end
end)

addict.action(chauffeur_root, "Wander/Hover", {"aiwandering"}, "", function(v)
    local ped, vehicle = get_my_driver()
    is_driving = true
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
    TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
    TASK.TASK_VEHICLE_DRIVE_WANDER(ped, vehicle, drive_speed, drive_style)
    PED.SET_DRIVER_ABILITY(ped, 1.0)
    PED.SET_DRIVER_AGGRESSIVENESS(ped, 0.6)
end)

addict.action(chauffeur_root, "Stop Driving", {"aistops"}, "", function(v)
    addict.trigger_commands("setaispeed" .. " 0")
    addict.trigger_commands("aiwandering")
end)

addict.action(chauffeur_root, "TP to chauffeur", {"tptochauffeur"}, "", function(click_type)
    if taxi_ped == 0 then
        util.toast("No active chauffeur you fool!")
    else
        PED.SET_PED_INTO_VEHICLE(players.user_ped(), taxi_veh, 0)
    end
end)

addict.action(chauffeur_root, "Self Destruct", {"selfdestruct"}, "", function(click_type)
    if taxi_ped == 0 then
        util.toast("No active chauffeur you fool!")
    else
        ped_copy = taxi_ped
        veh_copy = taxi_veh
        taxi_ped = 0
        taxi_veh = 0
        coords = ENTITY.GET_ENTITY_COORDS(veh_copy)
        ENTITY.SET_ENTITY_INVINCIBLE(veh_copy, false)
        FIRE.ADD_EXPLOSION(coords['x'], coords['y'], coords['z'], 7, 100.0, true, false, 1.0)
        ENTITY.SET_ENTITY_HEALTH(veh_copy, 0)
        ENTITY.SET_ENTITY_INVINCIBLE(ped_copy, false)
        ENTITY.SET_ENTITY_HEALTH(ped_copy, 0)
        if math.random(5) == 3 then
            util.toast("Chew papi munyanyo :(")
        end
        util.yield(3000)
        entities.delete_by_handle(ped_copy)
        entities.delete_by_handle(veh_copy)
    end
end)

addict.divider(autodrive, "Drive Actions")

drivetoPlayeraddict = addict.list(autodrive, "Drive To Player", {"drivetoplayer"}, "")
drivetoPlayers = {}
setup_choose_player_addict(drivetoPlayeraddict, drivetoPlayers, function(target_pid, name)
    return addict.action(drivetoPlayeraddict, name, {"driveto"}, "", function(_)
        ped, vehicle = get_my_driver()
        addict.trigger_commands("autodrive")
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(target_pid)
        hash = ENTITY.GET_ENTITY_MODEL(vehicle)
        util.create_tick_handler(function(_)
            target_pos = ENTITY.GET_ENTITY_COORDS(target_ped)
            TASK.TASK_VEHICLE_DRIVE_TO_COORD(ped, vehicle, target_pos.x, target_pos.y, target_pos.z, 30, 5, hash, 6, 1.0, 1.0)
            util.yield(5000)
            return ENTITY.DOES_ENTITY_EXIST(target_ped) and ENTITY.DOES_ENTITY_EXIST(ped) and TASK.GET_SCRIPT_TASK_STATUS(ped, 0x93A5526E) < 7
        end)
    end)
end)


local drive_speed = 15.0
local drive_style = 0
local is_driving = false

addict.slider(autodrive, "Driving Speed", {"setaispeed1"}, "", 0, 200, drive_speed, 5.0, function(speed, prev)
    drive_speed = speed
end)

addict.action(autodrive, "Wander/Hover", {"aiwander"}, "", function(v)
    local ped, vehicle = get_my_driver()
    is_driving = true
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
    TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
    TASK.TASK_VEHICLE_DRIVE_WANDER(ped, vehicle, drive_speed, drive_style)
    PED.SET_DRIVER_ABILITY(ped, 1.0)
    PED.SET_DRIVER_AGGRESSIVENESS(ped, 0.6)
end)

addict.action(autodrive, "Stop Driving", {"aistops"}, "", function(v)
    addict.trigger_commands("setaispeed1" .. " 0")
    addict.trigger_commands("aiwander")
end)

--------------------------------------------------------------------------------------------------------------------------------
--[[
────────────────────────────────────────────────────────────────────────────────────────
─██████──────────██████─██████████████─████████████████───██████─────────████████████───
─██░░██──────────██░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░██─────────██░░░░░░░░████─
─██░░██──────────██░░██─██░░██████░░██─██░░████████░░██───██░░██─────────██░░████░░░░██─
─██░░██──────────██░░██─██░░██──██░░██─██░░██────██░░██───██░░██─────────██░░██──██░░██─
─██░░██──██████──██░░██─██░░██──██░░██─██░░████████░░██───██░░██─────────██░░██──██░░██─
─██░░██──██░░██──██░░██─██░░██──██░░██─██░░░░░░░░░░░░██───██░░██─────────██░░██──██░░██─
─██░░██──██░░██──██░░██─██░░██──██░░██─██░░██████░░████───██░░██─────────██░░██──██░░██─
─██░░██████░░██████░░██─██░░██──██░░██─██░░██──██░░██─────██░░██─────────██░░██──██░░██─
─██░░░░░░░░░░░░░░░░░░██─██░░██████░░██─██░░██──██░░██████─██░░██████████─██░░████░░░░██─
─██░░██████░░██████░░██─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░████─
─██████──██████──██████─██████████████─██████──██████████─██████████████─████████████───
────────────────────────────────────────────────────────────────────────────────────────
────────────────────────────────────────────────────────────────────────────
─██████████████─██████──██████─██████████████─██████████████─██████████████─
─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
─██░░██████████─██░░██──██░░██─██░░██████░░██─██░░██████░░██─██░░██████████─
─██░░██─────────██░░██──██░░██─██░░██──██░░██─██░░██──██░░██─██░░██─────────
─██░░██─────────██░░██████░░██─██░░██████░░██─██░░██──██░░██─██░░██████████─
─██░░██─────────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██─
─██░░██─────────██░░██████░░██─██░░██████░░██─██░░██──██░░██─██████████░░██─
─██░░██─────────██░░██──██░░██─██░░██──██░░██─██░░██──██░░██─────────██░░██─
─██░░██████████─██░░██──██░░██─██░░██──██░░██─██░░██████░░██─██████████░░██─
─██░░░░░░░░░░██─██░░██──██░░██─██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
─██████████████─██████──██████─██████──██████─██████████████─██████████████─
────────────────────────────────────────────────────────────────────────────
]]

worldchaos = addict.list(addict.my_root(), "World Chaos", {}, "", function() end)


addict.toggle_loop(worldchaos, "All Peds Swap Vehicles", {}, "Makes all nearby peds swap vehicles and drive away in the opposite direction. Causes traffic jams and ped chaos.", function()
    switch_peds_vehicles()
    util.yield(1)
end)


local animDict = "amb@world_human_musician@guitar@male@idle_a"
local animName = "idle_a"
local guitarModel = util.joaat("prop_acc_guitar_01")

STREAMING.REQUEST_ANIM_DICT(animDict)
STREAMING.REQUEST_MODEL(guitarModel)
while not STREAMING.HAS_ANIM_DICT_LOADED(animDict) or not STREAMING.HAS_MODEL_LOADED(guitarModel) do
    util.yield()
end

local function cleanup()
    for _, obj in pairs(entities.get_all_objects_as_handles()) do
        if entities.get_model_hash(obj) == guitarModel then
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(obj, true, true)
            entities.delete_by_handle(obj)
        end
    end
end

local is_enabled = false
addict.toggle(worldchaos, "All Peds Play Guitars/Bongos", {"musicpeds"}, "Makes all nearby peds play guitars and bongos.", function(toggle)
    is_enabled = toggle
    if toggle then
        for _, ped in ipairs(entities.get_all_peds_as_handles()) do
            if ped ~= PLAYER.PLAYER_PED_ID() and not PED.IS_PED_A_PLAYER(ped) then
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_MUSICIAN", 0, false)
            end
        end
    else
        cleanup()
        for _, ped in ipairs(entities.get_all_peds_as_handles()) do
            if ped ~= PLAYER.PLAYER_PED_ID() and not PED.IS_PED_A_PLAYER(ped) then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, false)
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, false)
            end
        end
    end
end)

---------------------------------------------------------------------------------------------------------------------------------

local SPAWN_RADIUS = 50
local enabled = false

local VehicleModels = {
    util.joaat("adder"),    util.joaat("banshee"),   util.joaat("buffalo"),  util.joaat("comet2"),
    util.joaat("comet"),    util.joaat("elegy2"),   util.joaat("entityxf"), util.joaat("feltzer2"),
    util.joaat("fmj"),      util.joaat("fmj2"),     util.joaat("nero"),     util.joaat("nero2"),
    util.joaat("vagner"),   util.joaat("zentorno"), util.joaat("vacca"),    util.joaat("voltic"),
    util.joaat("gauntlet"), util.joaat("hermes"),   util.joaat("sabregt"),  util.joaat("dominator"),
    util.joaat("dukes2"),   util.joaat("moonbeam"), util.joaat("peyote"),   util.joaat("blade"),
    util.joaat("bifta"),    util.joaat("mesa"),     util.joaat("dubsta"),   util.joaat("dubsta3"),
    util.joaat("dune"),     util.joaat("insurgent"),util.joaat("monster"),  util.joaat("mesa3"),
    util.joaat("brawler"),  util.joaat("patriot"),  util.joaat("sadler"),   util.joaat("sandking"),
    util.joaat("packer"),   util.joaat("phantom"),  util.joaat("pounder"),  util.joaat("barracks"),
    util.joaat("stockade"), util.joaat("coach"),    util.joaat("pbus"),     util.joaat("bus"),
    util.joaat("mule"),     util.joaat("mule2"),    util.joaat("trash"),    util.joaat("benson"),
    util.joaat("police"),   util.joaat("police2"),  util.joaat("ambulance"),util.joaat("firetruk"),
    util.joaat("taxi"),     util.joaat("flatbed"),  util.joaat("towtruck"),util.joaat("towtruck2"),
    util.joaat("bati2"),    util.joaat("hexer"),    util.joaat("blazer"),   util.joaat("seashark"),
    util.joaat("dinghy"),   util.joaat("marquis"),  util.joaat("toro"),     util.joaat("jetmax"),
    util.joaat("dodo"),     util.joaat("cuban800"), util.joaat("duster"),   util.joaat("mammatus"),
    util.joaat("miljet"),   util.joaat("nimbus"),   util.joaat("shamal"),   util.joaat("stunt"),
    util.joaat("velum"),    util.joaat("velum2"),   util.joaat("luxor"),    util.joaat("luxor2"),
    util.joaat("titan"),    util.joaat("volatol"),  util.joaat("avenger"),  util.joaat("bombushka"),
    util.joaat("starling"), util.joaat("cargoplane"),util.joaat("lazer"),   util.joaat("hydra"),
    util.joaat("besra"),    util.joaat("valkyrie"), util.joaat("annihilator"),util.joaat("akula"),
    util.joaat("cargobob"), util.joaat("rhino"),    util.joaat("t20"),      util.joaat("reaper"),
    util.joaat("tempesta")
}

local PedModels = {
    util.joaat("a_f_m_beach_01"),   util.joaat("a_f_y_bevhills_01"),
    util.joaat("a_m_m_business_01"),util.joaat("a_f_y_business_02"),
    util.joaat("a_m_m_farmer_01"),  util.joaat("a_f_y_fitness_01"),
    util.joaat("a_m_m_skater_01"),  util.joaat("a_f_y_skater_01"),
    util.joaat("a_m_m_tramp_01"),   util.joaat("a_f_y_yoga_01"),
    util.joaat("a_m_y_runner_01"),  util.joaat("a_m_o_tramp_01"),
    util.joaat("s_m_y_cop_01"),     util.joaat("s_m_y_fireman_01"),
    util.joaat("s_m_m_paramedic_01"),util.joaat("s_m_m_doctor_01"),
    util.joaat("s_m_m_gaffer_01"),  util.joaat("s_m_y_hwaycop_01"),
    util.joaat("g_m_y_mexgoon_01"), util.joaat("g_m_m_chiboss_01"),
    util.joaat("g_m_y_famca_01"),   util.joaat("g_m_y_strpunk_01"),
    util.joaat("mp_m_shopkeep_01"), util.joaat("mp_f_boatstaff_01"),
    util.joaat("ig_bankman"),       util.joaat("ig_claypain"),
    util.joaat("ig_lestercrest"),   util.joaat("ig_jimmyboston"),
    util.joaat("csb_mweather"),     util.joaat("csb_chef"),
    util.joaat("a_c_husky"),        util.joaat("a_c_rottweiler"),
    util.joaat("a_c_poodle"),       util.joaat("a_c_cat"),
    util.joaat("a_c_pigeon"),       util.joaat("a_c_chimp"),
    util.joaat("u_m_m_jesus_02")
}

local ObjectModels = {
    util.joaat("prop_barrel_01a"),      util.joaat("prop_ld_suitcase_01"),
    util.joaat("prop_ld_flow_bottle"),  util.joaat("prop_tv_flat_02"),
    util.joaat("prop_skateboard_01"),   util.joaat("prop_chateau_chair_01"),
    util.joaat("prop_stool_01"),        util.joaat("prop_ld_coffee_01"),
    util.joaat("prop_ld_shoe_01"),      util.joaat("prop_ld_wallet_01"),
    util.joaat("prop_ld_ferris_wheel"), util.joaat("prop_ld_gravestone_01"),
    util.joaat("prop_roadcone01a"),     util.joaat("prop_phonebox_01"),
    util.joaat("prop_bin_07a"),         util.joaat("prop_gas_pump_1a"),
    util.joaat("prop_gas_pump_1b"),     util.joaat("prop_crane_01_truck1"),
    util.joaat("prop_pit_tube_01"),     util.joaat("prop_jerrycan_01a"),
    util.joaat("prop_bin_10a"),         util.joaat("prop_bin_11a"),
    util.joaat("prop_cs_ciggy_01"),     util.joaat("prop_cs_beer_bot_01"),
    util.joaat("prop_cs_joint_01"),     util.joaat("prop_cs_remote_01"),
    util.joaat("prop_cs_cardbox_01"),   util.joaat("prop_cs_dildo_01"),
    util.joaat("prop_cs_plastic_cup_01"),util.joaat("prop_cs_lighter_01"),
    util.joaat("prop_cs_brain_chunk"),  util.joaat("prop_tool_chest_01"),
    util.joaat("prop_garden_trowel"),   util.joaat("prop_ld_keypad_01"),
    util.joaat("prop_fbi3_coffee_table"),util.joaat("prop_game_clock_01"),
    util.joaat("prop_ld_saxophone")
}


addict.toggle(worldchaos, "Random Entity Spawner", {}, "Spawns random vehicles, peds, and objects every second. WARNING! This may crash your game if left on too long.", function(on)
    enabled = on
    util.toast(on and "Spawner Enabled" or "Spawner Disabled")
end)

local function random_position()
    local base = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    local x = base.x + math.random(-SPAWN_RADIUS, SPAWN_RADIUS)
    local y = base.y + math.random(-SPAWN_RADIUS, SPAWN_RADIUS)
    local z = base.z + math.random(1, 6)
    return v3.new(x, y, z)
end

local function load_model(hash)
    if not STREAMING.IS_MODEL_VALID(hash) then
        return false
    end
    STREAMING.REQUEST_MODEL(hash)
    local timeout = 200
    while not STREAMING.HAS_MODEL_LOADED(hash) and timeout > 0 do
        util.yield(10)
        timeout = timeout - 1
    end
    return STREAMING.HAS_MODEL_LOADED(hash)
end

util.create_tick_handler(function()
    if not enabled then return true end

    local pos = random_position()

    local vh = VehicleModels[math.random(#VehicleModels)]
    if load_model(vh) then
        entities.create_vehicle(vh, pos, math.random(0, 360))
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(vh)
    end

    local ph = PedModels[math.random(#PedModels)]
    if load_model(ph) then
        entities.create_ped(4, ph, pos, math.random(0, 360))
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ph)
    end

    local oh = ObjectModels[math.random(#ObjectModels)]
    if load_model(oh) then
        entities.create_object(oh, pos, false)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(oh)
    end

    util.yield(0)
    return true
end)


    addict.toggle_loop(worldchaos, "Invisible Peds", {"invisiblepeds"}, "", function(on_toggle)
            all_peds = entities.get_all_peds_as_handles()
        for k,ped in pairs(all_peds) do
            if not PED.IS_PED_A_PLAYER(ped) then
                if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                end
                ENTITY.SET_ENTITY_VISIBLE(ped, false, 0)
                util.yield(100)
            end
        end
    end)


    addict.toggle_loop(worldchaos,"Spinbot Peds", {"spinbotself"}, "Use levitate to move...", function(on)
        for k, peds in pairs(entities.get_all_peds_as_handles()) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(peds)
        local rand_1 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(peds, math.random(-500, 500), math.random(-500, 500), 300.0)
            if not PAD.IS_CONTROL_PRESSED(71, 71) then
                ENTITY.SET_ENTITY_ROTATION(peds, rand_1['x'], rand_1['y'], rand_1['z'])
            end
        end
    end)

    addict.toggle_loop(worldchaos,"Spinbot Self Ped", {"spinbotself"}, "", function(on)
        local self_ped = players.user_ped()
        local rand_1 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.PLAYER_PED_ID(), math.random(-500, 500), math.random(-500, 500), 300.0)
            if not PAD.IS_CONTROL_PRESSED(71, 71) then
                ENTITY.SET_ENTITY_ROTATION(self_ped, rand_1['x'], rand_1['y'], rand_1['z'])
            util.yield_once()
            end
            return
    end)

-----------------------------------------------------------------------------------------------------------------------------------

-- =========================
-- Clone Bully Main Menu
-- =========================
Clone_Bully = addict.list(worldchaos, "Clone Bully", {}, "")

-- =========================
-- Player List Menu
-- =========================
player_list_menu = addict.list(Clone_Bully, "Clone Bully Players", {}, "")
player_toggles = {}
selectedplayer = {}

-- =========================
-- Clone & Taxi Storage
-- =========================
player_clones = {} -- key: target player id, value: clone ped
clone_blips = {}
spawned_taxis = {}
taxi_blips = {}

-- =========================
-- Feature Toggles
-- =========================
feature_options = {
    hostile = false,
    friendly = false,
    passive = false,
    dance = false,
    enter_vehicle = false,
    invincible = false
}

-- =========================
-- Helper Functions
-- =========================
function add_clone_blip(clone)
    if ENTITY.DOES_ENTITY_EXIST(clone) then
        local blip = HUD.ADD_BLIP_FOR_ENTITY(clone)
        HUD.SET_BLIP_COLOUR(blip, 3)
        HUD.SET_BLIP_NAME_FROM_TEXT_FILE(blip, "CLONE")
        clone_blips[clone] = blip
    end
end

function add_taxi_blip(taxi)
    if ENTITY.DOES_ENTITY_EXIST(taxi) then
        local blip = HUD.ADD_BLIP_FOR_ENTITY(taxi)
        HUD.SET_BLIP_COLOUR(blip, 5)
        HUD.SET_BLIP_NAME_FROM_TEXT_FILE(blip, "TAXI")
        taxi_blips[taxi] = blip
    end
end

function remove_all_clone_blips()
    for clone, blip in pairs(clone_blips) do
        if blip and HUD.DOES_BLIP_EXIST(blip) then
            HUD.REMOVE_BLIP(blip)
        end
    end
    clone_blips = {}
end

function remove_all_taxi_blips()
    for taxi, blip in pairs(taxi_blips) do
        if blip and HUD.DOES_BLIP_EXIST(blip) then
            HUD.REMOVE_BLIP(blip)
        end
    end
    taxi_blips = {}
end

function get_nearest_vehicle_with_free_seat(clone)
    local vehicles = entities.get_all_vehicles_as_handles()
    local c = ENTITY.GET_ENTITY_COORDS(clone, true)
    local nearest, min_dist, seat = nil, 999999, nil

    for _, veh in ipairs(vehicles) do
        if ENTITY.DOES_ENTITY_EXIST(veh) then
            local seats = VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(veh)
            for i=-1,seats-1 do
                if VEHICLE.IS_VEHICLE_SEAT_FREE(veh, i, false) then
                    local vpos = ENTITY.GET_ENTITY_COORDS(veh, true)
                    local dist = SYSTEM.VDIST(c.x,c.y,c.z,vpos.x,vpos.y,vpos.z)
                    if dist < min_dist then
                        nearest,min_dist,seat = veh,dist,i
                    end
                end
            end
        end
    end
    return nearest, seat
end

-- =========================
-- Spawn Clone Only
-- =========================
function spawn_clone_for_player(pid)
    local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if not ENTITY.DOES_ENTITY_EXIST(target_ped) then return end

    -- Delete existing clone
    if player_clones[pid] and ENTITY.DOES_ENTITY_EXIST(player_clones[pid]) then
        entities.delete_by_handle(player_clones[pid])
    end

    local pos = ENTITY.GET_ENTITY_COORDS(target_ped, true)
    local clone = PED.CLONE_PED(target_ped, true, true, true)
    ENTITY.SET_ENTITY_COORDS(clone, pos.x + 2, pos.y, pos.z, false, false, false, false)

    player_clones[pid] = clone
    add_clone_blip(clone)
    util.toast("Spawned clone for " .. players.get_name(pid))
end

-- =========================
-- Spawn Clone with Taxi (Countdown 15s)
-- =========================
function spawn_clone_for_player_with_taxi(pid)
    local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if not ENTITY.DOES_ENTITY_EXIST(target_ped) then return end

    -- Spawn clone if it doesn't exist
    local clone = player_clones[pid]
    if not clone or not ENTITY.DOES_ENTITY_EXIST(clone) then
        spawn_clone_for_player(pid)
        clone = player_clones[pid]
    else
        local pos = ENTITY.GET_ENTITY_COORDS(target_ped, true)
        ENTITY.SET_ENTITY_COORDS(clone, pos.x + 2, pos.y, pos.z, false, false, false, false)
    end

    -- Check if clone already has a taxi
    local has_taxi = false
    for _, taxi in ipairs(spawned_taxis) do
        if PED.IS_PED_IN_VEHICLE(clone, taxi, false) then
            has_taxi = true
            break
        end
    end

    if not has_taxi then
        local pos = ENTITY.GET_ENTITY_COORDS(target_ped, true)
        local taxi_model = util.joaat("taxi")
        STREAMING.REQUEST_MODEL(taxi_model)
        while not STREAMING.HAS_MODEL_LOADED(taxi_model) do util.yield() end

        local forward = ENTITY.GET_ENTITY_FORWARD_VECTOR(clone)
        local spawn_pos = {x = pos.x + forward.x*3, y = pos.y + forward.y*3, z = pos.z}
        local taxi = entities.create_vehicle(taxi_model, spawn_pos, ENTITY.GET_ENTITY_HEADING(clone))
        VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(taxi, 5.0)
        PED.SET_PED_INTO_VEHICLE(clone, taxi, -1)
        table.insert(spawned_taxis, taxi)
        add_taxi_blip(taxi)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(taxi_model)

        -- 15-second countdown before driving to you
        util.create_tick_handler(function()
            if not ENTITY.DOES_ENTITY_EXIST(clone) or not ENTITY.DOES_ENTITY_EXIST(taxi) then return false end
            for i=15,1,-1 do
                util.toast("Taxi for " .. players.get_name(pid) .. " will drive to you in " .. i .. " seconds")
                util.yield(1000)
            end
            local myped = PLAYER.PLAYER_PED_ID()
            local mypos = ENTITY.GET_ENTITY_COORDS(myped, true)
            TASK.TASK_VEHICLE_DRIVE_TO_COORD(clone, taxi, mypos.x, mypos.y, mypos.z, 20.0, 1, ENTITY.GET_ENTITY_MODEL(taxi), 786603, 5.0, 10.0)
            return false
        end)
    end

    util.toast("Spawned clone and taxi for " .. players.get_name(pid))
end

-- =========================
-- Add Player Toggle
-- =========================
function add_player_toggle(pid)
    if not player_list_menu then return end
    if player_toggles[pid] then return end

    local ref = addict.toggle(player_list_menu, players.get_name(pid), {}, "PID "..pid, function(on)
        selectedplayer[pid] = on
    end)

    player_toggles[pid] = ref
    selectedplayer[pid] = false
end

-- =========================
-- Build Player List Menu
-- =========================
function build_player_list()
    -- Delete old menu if exists
    if player_list_menu then menu.delete(player_list_menu) end

    player_list_menu = addict.list(Clone_Bully, "Clone Bully Players", {}, "")
    player_toggles = {}
    selectedplayer = {}

    -- Clone actions
    addict.action(player_list_menu, "Spawn Clone for Selected Players", {}, "", function()
        for pid=0,31 do
            if selectedplayer[pid] and players.exists(pid) then
                spawn_clone_for_player(pid)
            end
        end
    end)

    addict.action(player_list_menu, "Spawn Clone with Taxi for Selected Players", {}, "", function()
        for pid=0,31 do
            if selectedplayer[pid] and players.exists(pid) then
                spawn_clone_for_player_with_taxi(pid)
            end
        end
    end)

    addict.action(player_list_menu, "Clear All Clones", {}, "Delete all clones and taxis", function()
        for _, clone in pairs(player_clones) do
            if ENTITY.DOES_ENTITY_EXIST(clone) then entities.delete_by_handle(clone) end
        end
        player_clones = {}
        remove_all_clone_blips()

        for _, taxi in ipairs(spawned_taxis) do
            if ENTITY.DOES_ENTITY_EXIST(taxi) then entities.delete_by_handle(taxi) end
        end
        spawned_taxis = {}
        remove_all_taxi_blips()
        util.toast("All clones and taxis cleared")
    end)

    -- Feature toggles
    addict.toggle(player_list_menu, "Hostile", {}, "Clones attack targets", function(on) feature_options.hostile = on end)
    addict.toggle(player_list_menu, "Friendly", {}, "Clones follow you", function(on) feature_options.friendly = on end)
    addict.toggle(player_list_menu, "Passive", {}, "Clones wander", function(on) feature_options.passive = on end)
    addict.toggle(player_list_menu, "Dance", {}, "Clones dance", function(on) feature_options.dance = on end)
    addict.toggle(player_list_menu, "Enter Vehicle", {}, "Clones enter nearest vehicle", function(on) feature_options.enter_vehicle = on end)
    addict.toggle(player_list_menu, "Invincible", {}, "Make clones invincible", function(on) feature_options.invincible = on end)

    -- Utility actions
    addict.action(player_list_menu, "Force Drive Clones To Me", {}, "", function()
        local myped = PLAYER.PLAYER_PED_ID()
        local mypos = ENTITY.GET_ENTITY_COORDS(myped, true)
        for _, taxi in ipairs(spawned_taxis) do
            if ENTITY.DOES_ENTITY_EXIST(taxi) then
                for pid, clone in pairs(player_clones) do
                    if ENTITY.DOES_ENTITY_EXIST(clone) then
                        if not PED.IS_PED_IN_VEHICLE(clone, taxi, false) then
                            PED.SET_PED_INTO_VEHICLE(clone, taxi, -1)
                        end
                        TASK.TASK_VEHICLE_DRIVE_TO_COORD(clone, taxi, mypos.x, mypos.y, mypos.z, 20.0, 1, ENTITY.GET_ENTITY_MODEL(taxi), 786603, 5.0, 10.0)
                    end
                end
            end
        end
        util.toast("All clone taxis are driving to you!")
    end)

    addict.action(player_list_menu, "Teleport Clones To Me", {}, "", function()
        local myped = PLAYER.PLAYER_PED_ID()
        local mypos = ENTITY.GET_ENTITY_COORDS(myped, true)
        for _, clone in pairs(player_clones) do
            if ENTITY.DOES_ENTITY_EXIST(clone) then
                ENTITY.SET_ENTITY_COORDS(clone, mypos.x + math.random(-2,2), mypos.y + math.random(-2,2), mypos.z, false, false, false, false)
            end
        end
        util.toast("Clones teleported to you")
    end)

    addict.action(player_list_menu, "Teleport Clones Back To Targets", {}, "", function()
        for pid, clone in pairs(player_clones) do
            local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            if ENTITY.DOES_ENTITY_EXIST(clone) and ENTITY.DOES_ENTITY_EXIST(target_ped) then
                local pos = ENTITY.GET_ENTITY_COORDS(target_ped, true)
                ENTITY.SET_ENTITY_COORDS(clone, pos.x + math.random(-2,2), pos.y + math.random(-2,2), pos.z, false, false, false, false)
            end
        end
        util.toast("Clones teleported back to targets")
    end)

    addict.action(player_list_menu, "Delete All Clone Taxis", {}, "", function()
        for _, taxi in ipairs(spawned_taxis) do
            if ENTITY.DOES_ENTITY_EXIST(taxi) then entities.delete_by_handle(taxi) end
        end
        spawned_taxis = {}
        remove_all_taxi_blips()
        util.toast("All clone taxis deleted")
    end)

    addict.action(player_list_menu, "Refresh Player List", {}, "Rebuild player list menu", function()
        build_player_list()
        util.toast("Player list refreshed")
    end)

    -- Add toggles for existing players
    for pid=0,31 do
        if players.exists(pid) then add_player_toggle(pid) end
    end
end

-- Build menu on load
build_player_list()

-- =========================
-- Behavior Tick
-- =========================
util.create_tick_handler(function()
    for pid, clone in pairs(player_clones) do
        if ENTITY.DOES_ENTITY_EXIST(clone) then
            local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

            if feature_options.hostile and ENTITY.DOES_ENTITY_EXIST(target_ped) then
                PED.SET_PED_RELATIONSHIP_GROUP_HASH(clone, util.joaat("HATES_PLAYER"))
                TASK.TASK_COMBAT_PED(clone, target_ped, 0, 16)
            elseif feature_options.friendly then
                PED.SET_PED_RELATIONSHIP_GROUP_HASH(clone, util.joaat("PLAYER"))
                TASK.TASK_FOLLOW_TO_OFFSET_OF_ENTITY(clone, PLAYER.PLAYER_PED_ID(), 0,0,0,2.0,-1,2.0,true)
            elseif feature_options.passive then
                PED.SET_PED_RELATIONSHIP_GROUP_HASH(clone, util.joaat("NEUTRAL"))
                TASK.TASK_WANDER_STANDARD(clone,10.0,10)
            end

            if feature_options.dance then
                local anim_dict = "mini@strip_club@private_dance@part2"
                local anim_name = "priv_dance_p2"
                if not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) then
                    STREAMING.REQUEST_ANIM_DICT(anim_dict)
                    while not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) do util.yield() end
                end
                if not ENTITY.IS_ENTITY_PLAYING_ANIM(clone, anim_dict, anim_name, 3) then
                    TASK.TASK_PLAY_ANIM(clone, anim_dict, anim_name, 8.0, -8.0, -1, 1, 0.0, false, false, false)
                end
            end

            if feature_options.enter_vehicle then
                local veh, seat = get_nearest_vehicle_with_free_seat(clone)
                if veh and seat then
                    TASK.TASK_ENTER_VEHICLE(clone, veh, 10000, seat, 2.0, 1, 0)
                end
            end

            ENTITY.SET_ENTITY_INVINCIBLE(clone, feature_options.invincible)
        end
    end
    return true
end)


-----------------------------------------------------------------------------------------------------------------------------------

Graffiti_addict = addict.list(worldchaos, "Graffiti Tool", {}, "Drop PNG/JPG in: Stand>Lua Scripts>resources>addictscript", function() end)

-- ========== CONFIG ==========
local RESOURCE_GRAFFITI_SUBDIR = "addictscript" .. "\\" -- trailing slash/backslash
local DEFAULT_FADE_TIME = 15000 -- ms before fade starts (if not persistent)
local MAX_DRAW_DISTANCE = 200.0
-- ============================

-- State
local textures = {}
local tags = {}
local selected_texture_index = 1
local tag_size = 1.0
local tag_duration = DEFAULT_FADE_TIME
local persistent_tags = false
local show_tags = true
local attach_mode = 0 -- 0 = world, 1 = hood, 2 = roof

-- Offsets for live editing
local offset_x, offset_y, offset_z = 0.0, 0.0, 0.0
local edit_tag_index = nil

local texture_list_ref = nil
local edit_tag_list_ref = nil

-- Helpers
local function fmt(msg) util.toast("[Graffiti] " .. msg) end
local function time_ms() return util.current_time_millis() end

-- Filesystem helpers
local function graffiti_dir()
    return filesystem.resources_dir() .. RESOURCE_GRAFFITI_SUBDIR
end
local function ensure_graffiti_dir()
    local dir = graffiti_dir()
    if not filesystem.is_dir(dir) then
        filesystem.mkdirs(dir)
    end
    return dir
end
local function is_image_file(path)
    path = path:lower()
    return path:match("%.png$") or path:match("%.jpg$") or path:match("%.jpeg$")
end

-- Load textures
local function load_textures()
    textures = {}
    local dir = ensure_graffiti_dir()
    local files = filesystem.list_files(dir) or {}
    for _, fullpath in ipairs(files) do
        if filesystem.is_regular_file(fullpath) and is_image_file(fullpath) then
            local ok, id = pcall(directx.create_texture, fullpath)
            if ok and id then
                local name = fullpath:match("([^\\/:]+)$") or fullpath
                textures[#textures + 1] = { id = id, name = name, path = fullpath }
            else
                util.toast("Graffiti: failed to load " .. tostring(fullpath))
            end
        end
    end
    if texture_list_ref then
        local opts = {}
        for i, t in ipairs(textures) do opts[#opts + 1] = t.name end
        pcall(addict.set_list_action_options, texture_list_ref, opts)
        selected_texture_index = math.min(math.max(1, selected_texture_index), #textures)
    end
end

-- World->Screen
local function world_to_screen(pos)
    local xptr, yptr = memory.alloc(4), memory.alloc(4)
    local ok = util.get_screen_coord_from_world_coord_no_adjustment(pos.x, pos.y, pos.z, xptr, yptr)
    if ok then
        return memory.read_float(xptr), memory.read_float(yptr), true
    end
    return 0, 0, false
end

-- Rotation -> Direction
local function rotation_to_direction(rot)
    local rad = math.pi / 180.0
    local pitch = rot.x * rad
    local yaw = rot.z * rad
    return v3.new(-math.sin(yaw) * math.cos(pitch), math.cos(yaw) * math.cos(pitch), math.sin(pitch))
end

-- Place tag in world
local function place_tag_at(hit_pos, texture_index, size, duration, persistent)
    if not hit_pos or not textures[texture_index] then
        fmt("Invalid placement.")
        return
    end
    tags[#tags + 1] = {
        pos = hit_pos,
        rot = 0.0,
        size = size or 1.0,
        texture_index = texture_index,
        created = time_ms(),
        duration = duration or DEFAULT_FADE_TIME,
        persistent = persistent or false,
        alpha = 255,
        offset = v3.new(0,0,0),
    }
end

-- Place tag attached to vehicle
local function place_tag_on_vehicle(vehicle, mode)
    if not vehicle or vehicle == 0 then
        fmt("No vehicle found.")
        return
    end
    if #textures == 0 then fmt("No textures loaded.") return end

    local min, max = v3.new(), v3.new()
    MISC.GET_MODEL_DIMENSIONS(ENTITY.GET_ENTITY_MODEL(vehicle), min, max)

    local pos = nil
    if mode == 1 then -- hood
        pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, 0.0, max.y + 0.5, 0.5)
    elseif mode == 2 then -- roof
        pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, 0.0, 0.0, max.z + 0.2)
    end

    if pos then
        local offset = ENTITY.GET_OFFSET_FROM_ENTITY_GIVEN_WORLD_COORDS(vehicle, pos.x, pos.y, pos.z)
        tags[#tags + 1] = {
            vehicle = vehicle,
            offset = offset,
            rot = 0.0,
            size = tag_size,
            texture_index = selected_texture_index,
            created = time_ms(),
            duration = tag_duration,
            persistent = persistent_tags,
            alpha = 255,
        }
        fmt("Graffiti sprayed on " .. (mode == 1 and "hood" or "roof") .. ".")
    end
end

-- Place in front of camera
local function place_tag_from_crosshair()
    if #textures == 0 then fmt("No textures loaded.") return end

    local cam_pos = CAM.GET_FINAL_RENDERED_CAM_COORD()
    local cam_rot = CAM.GET_FINAL_RENDERED_CAM_ROT(2)
    local forward = rotation_to_direction(cam_rot)

    if attach_mode == 0 then
        local hit_pos = v3.add(cam_pos, v3.mul(forward, 2.0))
        place_tag_at(hit_pos, selected_texture_index, tag_size, tag_duration, persistent_tags)
        fmt("Spray placed in front of camera.")
    else
        local veh = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
        if veh ~= 0 then
            place_tag_on_vehicle(veh, attach_mode)
        else
            fmt("Not in a vehicle.")
        end
    end
end

-- Draw tags
local function draw_tags()
    if not show_tags then return end
    local player_pos = ENTITY.GET_ENTITY_COORDS(players.user_ped(), true)
    for i = #tags, 1, -1 do
        local t = tags[i]

        -- fade logic
        if not t.persistent then
            local elapsed = time_ms() - t.created
            if elapsed >= t.duration then
                local fade_elapsed = elapsed - t.duration
                local fade_ratio = math.max(0, 1 - (fade_elapsed / 2000.0))
                t.alpha = math.floor(255 * fade_ratio)
                if fade_ratio <= 0 then table.remove(tags, i) goto cont end
            end
        end

        -- world position
        local draw_pos = nil
        if t.vehicle and ENTITY.DOES_ENTITY_EXIST(t.vehicle) then
            draw_pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(
                t.vehicle, t.offset.x, t.offset.y, t.offset.z
            )
        else
            draw_pos = v3.add(t.pos, t.offset or v3.new(0,0,0))
        end

        -- draw
        local dist = v3.distance(player_pos, draw_pos)
        if dist <= MAX_DRAW_DISTANCE then
            local tex = textures[t.texture_index]
            if tex and tex.id and directx.has_texture_loaded(tex.id) then
                local sx, sy, on_screen = world_to_screen(draw_pos)
                if on_screen then
                    local base = 0.06
                    local w, h = base * t.size, base * t.size
                    directx.draw_texture(tex.id, w, h, 0.5, 0.5, sx, sy, t.rot or 0.0, 1, 1, 1, (t.alpha or 255)/255)
                end
            end
        end
        ::cont::
    end
end

local function clear_tags() tags = {} fmt("Tags cleared.") end

-- Menu
local function init_menu()
    addict.action(Graffiti_addict, "Spray (place a tag at aim)", {"spray"}, "Spray graffiti where you aim.", function()
        place_tag_from_crosshair()
    end)

    addict.action(Graffiti_addict, "Reload textures", {"reloadgraffiti"}, "Reload graffiti images.", function()
        load_textures()
        fmt("Textures reloaded.")
    end)

    local options = {}
    for i, t in ipairs(textures) do options[#options + 1] = t.name end
    texture_list_ref = addict.list_select(Graffiti_addict, "Texture", {"graffititexture"}, "Choose graffiti texture", options, 1, function(value)
        selected_texture_index = value
    end)

    addict.slider_float(Graffiti_addict, "Tag size (0.10 - 5.00)", {"graffitisize"}, "Tag size multiplier", 10, 500, math.floor(tag_size*100), 1, function(value)
        tag_size = value/100.0
    end)

    addict.slider(Graffiti_addict, "Duration (ms, 0=persistent)", {"graffitiduration"}, "Duration before fade", 0, 600000, DEFAULT_FADE_TIME, 100, function(value)
        tag_duration = value
        persistent_tags = (value==0)
    end)

    addict.slider(Graffiti_addict, "Attach Mode", {"graffititagmode"}, "0 = World, 1 = Hood, 2 = Roof", 0, 2, 0, 1, function(val)
        attach_mode = val
    end)

    addict.toggle(Graffiti_addict, "New tags persistent", {"graffitipersist"}, "Make new tags permanent.", function(on) persistent_tags = on end, persistent_tags)
    addict.toggle(Graffiti_addict, "Show tags", {"graffitishow"}, "Toggle rendering of graffiti", function(on) show_tags = on end, show_tags)
    addict.action(Graffiti_addict, "Clear tags", {"cleargraffiti"}, "Remove all graffiti tags", function()
        clear_tags()
    end)

    -- Edit existing tags
    local function update_edit_tag_list()
        local opts = {}
        for i, t in ipairs(tags) do
            opts[#opts + 1] = "Tag #" .. i
        end
        if #opts == 0 then opts[#opts + 1] = "No tags" end
        if edit_tag_list_ref then
            pcall(addict.set_list_action_options, edit_tag_list_ref, opts)
        else
            edit_tag_list_ref = addict.list_select(Graffiti_addict, "Select Tag", {"graffitiedittag"}, "Pick a graffiti tag to edit", opts, 1, function(v)
                if #tags > 0 then
                    edit_tag_index = v
                else
                    edit_tag_index = nil
                end
            end)
        end
    end

    util.create_tick_handler(function()
        update_edit_tag_list()
        draw_tags()
        return true
    end)

    addict.on_focus(Graffiti_addict, function()
        fmt("Graffiti tool loaded. Drop PNG/JPG in: " .. graffiti_dir())
        if #textures == 0 then
            fmt("No textures found in: " .. graffiti_dir())
        else
            fmt("Loaded " .. tostring(#textures) .. " textures.")
        end
    end)
end

-- Init
load_textures()
init_menu()


-----------------------------------------------------------------------------------------------------------------------------------

local ZOMBIE_MODEL = "G_M_M_Zombie_04"
local BASE_ZOMBIES = 3
local ZOMBIES_PER_ROUND = 2
local SPAWN_RADIUS = 40
local MAX_LIVE_ZOMBIES = 120 -- safety cap

local running = false
local zombies = {} -- { { ped = <handle>, died = false } ... }
local round_num = 0
local kills_this_round = 0
local required_kills = 0

local function joaat(s) return util.joaat(s) end

local function notify(msg)
    util.toast("[Zombies] " .. msg)
end

local function safe_delete_entity(ent)
    if ent and ent ~= 0 and ENTITY.DOES_ENTITY_EXIST(ent) then
        entities.delete(ent)
    end
end

local function clear_all_zombies()
    for i = #zombies, 1, -1 do
        local rec = zombies[i]
        if rec and rec.ped then
            safe_delete_entity(rec.ped)
        end
        table.remove(zombies, i)
    end
    kills_this_round = 0
end

local function spawn_zombie_near_player()
    if #zombies >= MAX_LIVE_ZOMBIES then
        return nil
    end

    local player = PLAYER.PLAYER_PED_ID()
    if not player or player == 0 then return nil end
    local pos = ENTITY.GET_ENTITY_COORDS(player, true)
    local angle = math.random() * math.pi * 2
    local r = SPAWN_RADIUS * (0.75 + math.random() * 0.5)
    local spawn = v3.new(pos.x + math.cos(angle) * r, pos.y + math.sin(angle) * r, pos.z)

    local model_hash = joaat(ZOMBIE_MODEL)
    util.request_model(model_hash)
    if not STREAMING.HAS_MODEL_LOADED(model_hash) then
        notify("Failed to load zombie model (" .. ZOMBIE_MODEL .. ").")
        return nil
    end

    local ped = entities.create_ped(26, model_hash, spawn, math.random() * 360.0)
    if not ped or ped == -1 then return nil end

    if type(WEAPON) == "table" and type(WEAPON.REMOVE_ALL_PED_WEAPONS) == "function" then
        WEAPON.REMOVE_ALL_PED_WEAPONS(ped, true)
    end

    if type(PED) == "table" and type(PED.SET_PED_MOVE_RATE_OVERRIDE) == "function" then
        PED.SET_PED_MOVE_RATE_OVERRIDE(ped, 0.55) -- ~55% speed for shuffle/limp
    end

    if type(PED) == "table" and type(PED.SET_PED_ACCURACY) == "function" then
        PED.SET_PED_ACCURACY(ped, 1)
    end
    if type(PED) == "table" and type(PED.SET_PED_COMBAT_ABILITY) == "function" then
        PED.SET_PED_COMBAT_ABILITY(ped, 0)
    end
    if type(PED) == "table" and type(PED.SET_PED_COMBAT_RANGE) == "function" then
        PED.SET_PED_COMBAT_RANGE(ped, 1) -- close range
    end

    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
    PED.SET_PED_CAN_RAGDOLL(ped, true)
    PED.SET_PED_CAN_BE_TARGETTED(ped, true)
    ENTITY.SET_ENTITY_MAX_HEALTH(ped, 125)
    ENTITY.SET_ENTITY_HEALTH(ped, 125)
    TASK.TASK_COMBAT_PED(ped, player, 0, 16)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)
    table.insert(zombies, { ped = ped, died = false })
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(model_hash)
    return ped
end

local function spawn_round_zombies(n)
    for i = 1, n do
        spawn_zombie_near_player()
        util.yield(60)
    end
end

local function check_zombie_states()
    for i = #zombies, 1, -1 do
        local rec = zombies[i]
        local ped = rec.ped
        if not ped or ped == 0 or not ENTITY.DOES_ENTITY_EXIST(ped) then
            table.remove(zombies, i)
            kills_this_round = kills_this_round + 1
        else
            if TASK.GET_SCRIPT_TASK_STATUS(ped, util.joaat("TASK_COMBAT")) ~= 1 then
                local player = PLAYER.PLAYER_PED_ID()
                if ENTITY.DOES_ENTITY_EXIST(player) then
                    TASK.TASK_COMBAT_PED(ped, player, 0, 16)
                end
            end
            if type(WEAPON) == "table" and type(WEAPON.REMOVE_ALL_PED_WEAPONS) == "function" then
                WEAPON.REMOVE_ALL_PED_WEAPONS(ped, true)
            end
        end
    end
end

local function start_round()
    round_num = round_num + 1
    kills_this_round = 0
    required_kills = BASE_ZOMBIES + (round_num - 1) * ZOMBIES_PER_ROUND
    notify("Round " .. round_num .. " started! Kill " .. required_kills .. " zombies.")
    spawn_round_zombies(required_kills)
end

local function end_round()
    notify("Round skipped. Cleaning zombies and starting next round.")
    clear_all_zombies()
    start_round()
end

local function survival_loop()
    while running do
        for i = #zombies, 1, -1 do
            local rec = zombies[i]
            local ped = rec.ped
            if ped and ped ~= 0 and ENTITY.DOES_ENTITY_EXIST(ped) then
                if PED.IS_PED_DEAD_OR_DYING(ped, true) then
                    entities.delete(ped)
                    table.remove(zombies, i)
                    kills_this_round = kills_this_round + 1
                else
                    TASK.TASK_COMBAT_PED(ped, PLAYER.PLAYER_PED_ID(), 0, 16)
                end
            else
                table.remove(zombies, i)
                kills_this_round = kills_this_round + 1
            end
        end

        if kills_this_round >= required_kills then
            notify("Round " .. round_num .. " complete! Starting next round.")
            util.yield(800)
            clear_all_zombies()
            start_round()
        end

        util.yield(250)
    end
end

local Zombies_Root = addict.list(worldchaos, "Zombies Survival Mode", {"zombiessurvival"}, "Zombies survival 49 rounds.")

addict.toggle(Zombies_Root, "Enable Survival Mode", {}, "Toggle survival mode on/off", function(on)
    running = on
    if on then
        round_num = 0
        notify("Survival mode enabled.")
        start_round()
        util.create_thread(function() survival_loop() end)
    else
        notify("Survival mode disabled. Clearing zombies.")
        clear_all_zombies()
    end
end, false)

addict.action(Zombies_Root, "Clear Zombies Now", {}, "Remove all spawned zombies immediately", function()
    clear_all_zombies()
    notify("All zombies cleared.")
end)

addict.action(Zombies_Root, "Skip / End Round", {}, "End current round and start next one", function()
    if running then
        end_round()
    else
        notify("Survival is not running.")
    end
end)

addict.slider(Zombies_Root, "Spawn radius", {}, "Distance from player where zombies will spawn", 10, 200, SPAWN_RADIUS, 1, function(val) SPAWN_RADIUS = val end)
addict.slider(Zombies_Root, "Base zombies (round 1)", {}, "Zombies in round 1", 1, 49, BASE_ZOMBIES, 1, function(val) BASE_ZOMBIES = val end)
addict.slider(Zombies_Root, "Extra zombies per round", {}, "How many extra zombies to add each round", 0, 20, ZOMBIES_PER_ROUND, 1, function(val) ZOMBIES_PER_ROUND = val end)

addict.action(Zombies_Root, "TP to airport", {}, "Spawn at the airport", function()
    addict.trigger_commands("tplsia")
end)

addict.action(Zombies_Root, "Spawn Single Zombie (Debug)", {}, "Spawn a single zombie near you", function()
    spawn_zombie_near_player()
end)

local round_status_display = addict.readonly(
    Zombies_Root,
    "Round Status",
    "",
    "Shows current round, kills this round, and required kills"
)

addict.on_tick_in_viewport(round_status_display, function()
    local text = string.format("Round: %d | Kills: %d / %d", round_num, kills_this_round, required_kills)
    addict.set_value(round_status_display, text)
end)

---------------------------------------------------------------------------------------------------------------------------------

local house_root = addict.list(worldchaos, "Spawn Objects", {}, "Spawn and manipulate multiple objects.", function() end)
local spawned_objects = {}
local selected_index = nil
local offset_x = -15.0
local offset_y = 0.0
local offset_z = -01.0
local rot_x = 0.0
local rot_y = 0.0
local rot_z = 0.0

local function request_model(hash)
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        util.yield()
    end
end

local function spawn_new_object(model_name)
    local player_ped = players.user_ped()
    local player_pos = ENTITY.GET_ENTITY_COORDS(player_ped)
    local heading = ENTITY.GET_ENTITY_HEADING(player_ped)
    local model = util.joaat(model_name)
    request_model(model)
    local obj = entities.create_object(model, v3.new(player_pos.x + offset_x, player_pos.y + offset_y, player_pos.z + offset_z))
    ENTITY.SET_ENTITY_HEADING(obj, heading)
    ENTITY.FREEZE_ENTITY_POSITION(obj, true)
    ENTITY.SET_ENTITY_ROTATION(obj, rot_x, rot_y, rot_z, 2, true)
    table.insert(spawned_objects, {
        entity = obj,
        model = model_name,
        offset_x = offset_x,
        offset_y = offset_y,
        offset_z = offset_z,
        rot_x = rot_x,
        rot_y = rot_y,
        rot_z = rot_z
    })

    selected_index = #spawned_objects
    util.toast(model_name .. " spawned! Selected for manipulation.")
end

local function select_object(index)
    if spawned_objects[index] and ENTITY.DOES_ENTITY_EXIST(spawned_objects[index].entity) then
        selected_index = index
        local obj = spawned_objects[selected_index]
        offset_x = obj.offset_x
        offset_y = obj.offset_y
        offset_z = obj.offset_z
        rot_x = obj.rot_x
        rot_y = obj.rot_y
        rot_z = obj.rot_z
        util.toast("Selected object #" .. index .. " for manipulation.")
    else
        util.toast("Invalid object selection.")
    end
end

local function update_selected_object()
    if selected_index and spawned_objects[selected_index] and ENTITY.DOES_ENTITY_EXIST(spawned_objects[selected_index].entity) then
        local obj = spawned_objects[selected_index].entity
        local player_pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
        ENTITY.SET_ENTITY_COORDS(obj, player_pos.x + offset_x, player_pos.y + offset_y, player_pos.z + offset_z, true, false, false, true)
        ENTITY.SET_ENTITY_ROTATION(obj, rot_x, rot_y, rot_z, 2, true)
    end
end


addict.action(house_root, "Spawn House", {"spawnhouse"}, "Spawn a house in front of you.", function()
    spawn_new_object("lf_house_01_")
end)

addict.text_input(house_root, "Spawn Custom Objects", {"spawnobj"}, "Type any object/model name.", function(input)
    if input ~= nil and input ~= "" then
        spawn_new_object(input)
    else
        util.toast("Invalid object name!")
    end
end)

addict.text_input(house_root, "Select Object #", {"selectobj"}, "Select object to manipulate (number 1, 2, 3 or 4 etc...) just remember the objects in number order.", function(input)
    local index = tonumber(input)
    if index then
        select_object(index)
    else
        util.toast("Invalid index!")
    end
end)

addict.slider(house_root, "Offset X", {"offsetx"}, "Move selected object along X axis", -50.0, 50.0, offset_x, 1.0, function(val)
    offset_x = val
    update_selected_object()
end)

addict.slider(house_root, "Offset Y", {"offsety"}, "Move selected object along Y axis", -50.0, 50.0, offset_y, 1.0, function(val)
    offset_y = val
    update_selected_object()
end)

addict.slider(house_root, "Offset Z", {"offsetz"}, "Move selected object along Z axis", -10.0, 50.0, offset_z, 1.0, function(val)
    offset_z = val
    update_selected_object()
end)

addict.slider(house_root, "Rotation X", {"rotx"}, "Rotate selected object around X axis", -180.0, 180.0, rot_x, 1.0, function(val)
    rot_x = val
    update_selected_object()
end)

addict.slider(house_root, "Rotation Y", {"roty"}, "Rotate selected object around Y axis", -180.0, 180.0, rot_y, 1.0, function(val)
    rot_y = val
    update_selected_object()
end)

addict.slider(house_root, "Rotation Z", {"rotz"}, "Rotate selected object around Z axis", -180.0, 180.0, rot_z, 1.0, function(val)
    rot_z = val
    update_selected_object()
end)

addict.action(house_root, "Delete Selected Object", {"delobj"}, "Delete the selected object", function()
    if selected_index and spawned_objects[selected_index] and ENTITY.DOES_ENTITY_EXIST(spawned_objects[selected_index].entity) then
        entities.delete_by_handle(spawned_objects[selected_index].entity)
        table.remove(spawned_objects, selected_index)
        selected_index = nil
        util.toast("Object deleted!")
    end
end)

addict.action(house_root, "Delete All Objects", {"delallobjs"}, "Delete all spawned objects", function()
    for i, obj in ipairs(spawned_objects) do
        if ENTITY.DOES_ENTITY_EXIST(obj.entity) then
            entities.delete_by_handle(obj.entity)
        end
    end
    spawned_objects = {}
    selected_index = nil
    util.toast("All objects deleted!")
end)


---------------------------------------------------------------------------------------------------------------------------------
    
sky_text = addict.list(worldchaos, "Sky Text", {}, "Prints text in the sky made out of vehicles.", function() end)


addict.text_input(sky_text, "Sky Text", {"skytext"}, "Type the word Cock and look up.", function(val)
    if val and val:len() > 0 then
        draw_text(val)
    end
end)

addict.action(sky_text, "Cleanup Sky Text Vehicles", {"cleanskytxt"}, "Removes all spawned vehicles from the sky", function()
    cleanupSkyVehicles()
end)

---------------------------------------------------------------------------------------------------------------------------------
 
    local getEntityCoords = ENTITY.GET_ENTITY_COORDS
    local getPlayerPed = PLAYER.GET_PLAYER_PED

    function explodeAndDelete(entity, exploID, ownerPed, dmgscale, audible, invisible, camshake)
        local ec = getEntityCoords(entity)
        FIRE.ADD_OWNED_EXPLOSION(ownerPed, ec.x, ec.y, ec.z, exploID, dmgscale, audible, invisible, camshake)
    end

        map_explodes = addict.list(worldchaos, "Explode Map", {}, "Explodes all over the map.", function(); end)

    addict.toggle_loop(map_explodes, "Explode Map", {""}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        local height = 0
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(p, c.x + math.random(-100, 100), c.y + math.random(-100, 100), height)
        explodeAndDelete(p, 47, getPlayerPed(players.user()), 5, true, false, 3)
    end)

    
addict.action(map_explodes, "Antimatter Cataclysm", {}, "Triggers cinematic destruction: NPC panic, thunder, and object mayhem.", function()
    addict.trigger_commands("thunderon")
    util.toast("Initiating antimatter singularity...")
    local player_ped = players.user_ped()
    local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
    local radius = 100
    local num_explosions = 75
    local delay = 50

    for i = 1, num_explosions do
        local offset = v3.new(math.random(-radius, radius), math.random(-radius, radius), math.random(-10, 10))
        local explosion_pos = v3.add(pos, offset)
        FIRE.ADD_EXPLOSION(explosion_pos.x, explosion_pos.y, explosion_pos.z, 37, 12.0, true, false, 1.5)
        util.yield(delay)
    end

    for _, ped in ipairs(entities.get_all_peds_as_handles()) do
        if ped ~= player_ped and not PED.IS_PED_INJURED(ped) then
            PED.SET_PED_TO_RAGDOLL(ped, 5000, 5000, 0, false, false, false)
            FIRE.START_ENTITY_FIRE(ped)
        end
    end

    for i = 1, 10 do
        local offset = v3.new(math.random(-radius, radius), math.random(-radius, radius), 0)
        local flash_pos = v3.add(pos, offset)
        FIRE.ADD_EXPLOSION(flash_pos.x, flash_pos.y, flash_pos.z, 86, 3.0, true, false, 0.5)
        util.yield(150)
    end
    addict.trigger_commands("thunderoff")
    util.toast("Antimatter cataclysm complete. Map integrity compromised.")
end)

    addict.divider(map_explodes, "________________________________________")
    
    local chaos_enabled = false
    local explosion_radius = 50
    local explosion_loop
    
    addict.toggle(map_explodes, "Chaos Explosions", {"chaosexplo"}, "Spawn HUGE random explosions around you.", function(toggle)
        chaos_enabled = toggle
        if toggle then
            explosion_loop = util.create_tick_handler(function()
                if not chaos_enabled then return false end

                local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
                local angle = math.random() * math.pi * 2
                local dist = math.random() * explosion_radius
                local ex = coords.x + math.cos(angle) * dist
                local ey = coords.y + math.sin(angle) * dist
                local ez = coords.z

                FIRE.ADD_EXPLOSION(ex, ey, ez, 29, 10.0, true, false, 1.0, false)
                return true
            end)
        else
            if explosion_loop then
                explosion_loop = nil
            end
        end
    end)

     addict.slider(map_explodes, "Explosion Radius", {"chaosrad"}, "Distance at which random explosions will spawn around you.", 10, 200, 50, 10, function(value)
        explosion_radius = value
    end)

------------------------------------------------------------------------------------------------------------------------------------
 
    areablocks = addict.list(worldchaos, "Block Entrances", {}, "", function(); end)

    addict.toggle(areablocks, "Casino", {"blockcasino"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        request_model(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 920.657, 48.360252, 44.913666, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash) 
    else
        addict.trigger_commands("clearblocks")
        end
    end)

    addict.toggle(areablocks, "Escipse Towers", {"blockeclipse"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        request_model(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, -796.4927, 310.48416, 50.49049, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash) 
    else
        addict.trigger_commands("clearblocks")
        end
    end)

    area_lsc_blocks = addict.list(areablocks, "Block LSC Entrances", {}, "", function(); end)

    addict.toggle(area_lsc_blocks, "LSC Burton", {"blocklscb"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        request_model(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, -361.66696, -132.68272, 1.1650558, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash) 
    else
        addict.trigger_commands("clearblocks")
        end
    end)

    addict.toggle(area_lsc_blocks, "LSC La Mesa", {"blocklm"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        request_model(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 719.7211, -1088.8136, -15.784607, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash) 
    else
        addict.trigger_commands("clearblocks")
        end
    end)

    addict.toggle(area_lsc_blocks, "LSC International Airport", {"blockia"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        request_model(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, -1144.0221, -1989.1848, -21.592183, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash) 
    else
        addict.trigger_commands("clearblocks")
        end
    end)

    addict.toggle(area_lsc_blocks, "LSC Grand Senora Desert", {"blockgsd"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        request_model(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 1174.6398, 2649.226, 1.21482217, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)

        local hash = 1952396163
        request_model(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 1182.6398, 2649.226, 1.21482217, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
    else
        addict.trigger_commands("clearblocks")
        end
    end)

    addict.toggle(area_lsc_blocks, "LSC Paleto Bay", {"blockpb"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        request_model(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 116.85485, 6620.863, -5.287771, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)

        local hash = 1952396163
        request_model(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 110.85485, 6614.863, -5.287771, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
    else
        addict.trigger_commands("clearblocks")
        end
    end)

    addict.divider(areablocks, "__________________bruh__________________")


    addict.action(areablocks, "Clear All Blocks", {"clearblocks"}, "", function()
        local count = 0
        for k,ent in pairs(entities.get_all_objects_as_handles()) do
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
            entities.delete_by_handle(ent)
            count = count + 1
            util.yield()
        end
    end)

    addict.action(areablocks, "Custom Bock", {"customblock"}, "Note: You can custom block entrances using a container object or something like it, Shotcut For Custom Model Gun.", function()
        addict.trigger_commands("custommodlegunloc")
        addict.trigger_commands("modgun")
    end)

local tornado_z_offset = 0
local tornado_radius = 30
local tornado_strength = 30
local dont_stop = false

local tornadoMenu = addict.list(worldchaos, "Tornado", {}, "Swirls entities around a tornado vortex.")

local function get_swirl_force(center, entity_pos, strength)
    local dx = entity_pos.x - center.x
    local dy = entity_pos.y - center.y
    local dist = math.sqrt(dx * dx + dy * dy)

    if dist < 1 then dist = 1 end -- Avoid division by 0

    local fx = -dy / dist * strength
    local fy = dx / dist * strength
    local fz = strength * 0.15

    return fx, fy, fz
end

local function get_tornado_position()
    local ped = PLAYER.PLAYER_PED_ID()
    local pos = ENTITY.GET_ENTITY_COORDS(ped, true)
    local offset = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, 0.0, 10.0, 0.0)
    offset.z = offset.z + tornado_z_offset
    return offset
end

local function swirl_entity(entity, center)
    local pos = ENTITY.GET_ENTITY_COORDS(entity, true)
    local fx, fy, fz = get_swirl_force(center, pos, tornado_strength)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
    ENTITY.SET_ENTITY_INVINCIBLE(entity, true)
    ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(entity, 1, fx, fy, fz, true, false, true, true)
end

addict.toggle_loop(tornadoMenu, "Vehicle Tornado", {"vehicletornado"}, "Swirls all vehicles in the air around a vortex", function(on)
    local center = get_tornado_position()
    for _, veh in pairs(entities.get_all_vehicles_as_handles()) do
        if VEHICLE.IS_VEHICLE_DRIVEABLE(veh, false) and veh ~= entities.get_user_vehicle_as_handle() then
            swirl_entity(veh, center)
            if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0)
            end
        end
    end
end)

addict.toggle_loop(tornadoMenu, "Object Tornado", {"objecttornado"}, "Swirls world objects around the vortex", function(on)
    local center = get_tornado_position()
    for _, obj in pairs(entities.get_all_objects_as_handles()) do
        swirl_entity(obj, center)
    end
end)

addict.toggle_loop(tornadoMenu, "Ped Tornado", {"pedtornado"}, "Swirls NPCs and other peds around the vortex", function(on)
    local center = get_tornado_position()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if not PED.IS_PED_A_PLAYER(ped) then
            swirl_entity(ped, center)
        end
    end
end)

addict.slider(tornadoMenu, "Tornado Z-offset", {"tornadozoffset"}, "Height of the vortex", -100, 100, 0, 5, function(s)
    tornado_z_offset = s
end)

local TornadoEntities = addict.list(worldchaos, "Tornado 2.0", {}, "Swirls entities in a tornado above you")

local tornado_z_offset = 20.0        -- Height above player
local tornado_radius = 25.0          -- How far from player they swirl
local tornado_strength = 35.0        -- Force power
local tornado_density = 10           -- How many entities to swirl per frame
local vehicle_swirl_radius = 15.0    -- Vehicle proximity to player

local dont_stop = false
local entity_index_tracker = {
    vehicle = 1,
    object = 1,
    ped = 1
}

local function get_tornado_center()
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    local coords = ENTITY.GET_ENTITY_COORDS(ped, true)
    coords.z = coords.z + tornado_z_offset
    return coords
end

local function swirl_toward(entity, center, radius)
    local pos = ENTITY.GET_ENTITY_COORDS(entity, true)
    local dx = pos.x - center.x
    local dy = pos.y - center.y
    local dist = math.max(1.0, math.sqrt(dx * dx + dy * dy))

    local swirl_fx = -dy / dist * tornado_strength
    local swirl_fy = dx / dist * tornado_strength
    local swirl_fz = (center.z - pos.z) * 2.0 + 5.0

    local desired_x = center.x + math.cos(util.current_time_millis() / 200) * radius
    local desired_y = center.y + math.sin(util.current_time_millis() / 200) * radius

    swirl_fx = swirl_fx + (desired_x - pos.x) * 2.0
    swirl_fy = swirl_fy + (desired_y - pos.y) * 2.0

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
    ENTITY.SET_ENTITY_INVINCIBLE(entity, true)
    ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(entity, 1, swirl_fx, swirl_fy, swirl_fz, true, false, true, true)
end

addict.toggle_loop(TornadoEntities, "Vehicle Tornado", {"vehicletornado2"}, "Swirls all vehicles above and around you", function(on)
    local center = get_tornado_center()
    local vehicles = entities.get_all_vehicles_as_handles()
    local processed = 0

    for i = entity_index_tracker.vehicle, #vehicles do
        local veh = vehicles[i]
        if VEHICLE.IS_VEHICLE_DRIVEABLE(veh, false) and veh ~= entities.get_user_vehicle_as_handle() then
            swirl_toward(veh, center, vehicle_swirl_radius)
            if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0)
            end
            processed = processed + 1
            if processed >= tornado_density then break end
        end
    end

    entity_index_tracker.vehicle = (entity_index_tracker.vehicle % #vehicles) + 1
end)

addict.toggle_loop(TornadoEntities, "Object Tornado", {"objecttornado"}, "Swirls world objects around and above you", function(on)
    local center = get_tornado_center()
    local objects = entities.get_all_objects_as_handles()
    local processed = 0

    for i = entity_index_tracker.object, #objects do
        swirl_toward(objects[i], center, tornado_radius)
        processed = processed + 1
        if processed >= tornado_density then break end
    end

    entity_index_tracker.object = (entity_index_tracker.object % #objects) + 1
end)

addict.toggle_loop(TornadoEntities, "Ped Tornado", {"pedtornado"}, "Swirls NPCs around and above you", function(on)
    local center = get_tornado_center()
    local peds = entities.get_all_peds_as_handles()
    local processed = 0

    for i = entity_index_tracker.ped, #peds do
        local ped = peds[i]
        if not PED.IS_PED_A_PLAYER(ped) then
            swirl_toward(ped, center, tornado_radius)
            processed = processed + 1
            if processed >= tornado_density then break end
        end
    end

    entity_index_tracker.ped = (entity_index_tracker.ped % #peds) + 1
end)

addict.slider(TornadoEntities, "Tornado Z-Offset", {"tornado2zoffset"}, "How high the tornado vortex is above you", 5, 100, 20, 5, function(val)
    tornado_z_offset = val
end)

addict.slider(TornadoEntities, "Tornado Density", {"tornado2density"}, "How many entities are pulled each frame", 1, 50, 10, 1, function(val)
    tornado_density = val
end)

addict.slider(TornadoEntities, "Vehicle Swirl Radius", {"tornado2vehicleradius"}, "Distance vehicles swirl from center", 5, 100, 15, 5, function(val)
    vehicle_swirl_radius = val
end)


    local aicrashes = addict.list(worldchaos, "A.I. Entities", {"aicrashes"}, "")

    addict.toggle_loop(aicrashes,"A.I. Entity Fuck", {"aient"}, "Toggle all of them but doesn't work the same as if toggled individually. Code generated by a.i.", function()
        entity_fuck(pid)
    end)

    addict.toggle_loop(aicrashes,"A.I. Vehicle Fly", {"aivehfly"}, "Code generated by a.i.", function()
        veh_entity_fly(pid)
    end)
    
    addict.toggle_loop(aicrashes,"A.I. Vehicle Fuck", {"aiveh"}, "Code generated by a.i.", function()
        veh_entity_fuck(pid)
    end)
    
    addict.toggle_loop(aicrashes,"A.I. Object Fuck", {"aiobj"}, "Code generated by a.i.", function()
        obj_entity_fuck(pid)
    end)
    
    addict.toggle_loop(aicrashes,"A.I. Ped Fuck", {"aiped"}, "Code generated by a.i.", function()
        ped_entity_fuck(pid)
    end)
    
    addict.toggle_loop(aicrashes,"A.I. Pickup Fuck", {"aipickup"}, "Code generated by a.i.", function()
        pickup_entity_fuck(pid)
    end)
    
    addict.action(aicrashes, "Restart Script To Stop Fuckery", {"restartfuckery"}, "", function ()
        util.restart_script()
    end)

--------------------------------------------------------------------------------------------------------------------
Chatspam = addict.list(addict.my_root(), "Chat Spammers", {}, "", function() end)

addict.divider(Chatspam, "Chat Spammers")

doxing = addict.list(Chatspam, "Doxing", {}, "", function(); end)


addict.action(doxing, 'That\'s pretty funny! Unfortunately, -IP-', {}, 'Everyone will see their own IP, and nobody will see anyone else\'s (unless they also have a menu anyways).\nCustom chat scripts won\'t render this correctly, but the feature will still work to anyone using vanilla chat.', function(click_type)
    chat.send_message("That\'s pretty funny!", false, true, true)
    chat.send_message("Unfortunately, ${ip}", false, true, true)
end)

addict.action(doxing, 'How are things in -city-', {}, 'Everyone will see their own city, and nobody will see anyone else\'s (unless they also have a menu anyways).\nCustom chat scripts won\'t render this correctly, but the feature will still work to anyone using vanilla chat.', function(click_type)
    chat.send_message("So how are things in ${geoip.city}?", false, true, true)
end)
 
addict.action(doxing, 'Call out non-VPN users', {}, 'Sends targeted messages to all non-VPN users and tells them their ip', function(click_type)
    for players.list(false, true, true) as pid do
        if not players.is_using_vpn(pid) then
            chat.send_targeted_message(pid, players.user(), 'Did you know you\'re not using a VPN? You probably should. ${ip}', false)
            util.toast('Sent call-out to ' .. players.get_name(pid))
        end
    end
end)

helpcommands = addict.list(Chatspam, "Help Commands", {}, "Command: help. Spams every 2.5 minutes", function(); end)

addict.action(helpcommands, "BE Desync", {"bedesync"}, "Explains ", function()
chat.send_message(
    "I have battle eye disabled and because I am host if you have battle eye enabled you will desync every 5 mins",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(helpcommands, "Type Help Commands", {"typehelpcommand"}, "", function(on_toggle)
chat.send_message(
    "Type /help for help",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end)

addict.action(helpcommands, "Help Commands", {"help"}, "", function()
chat.send_message(
    "/help1 /help2 /help3 /whatmenu",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(helpcommands, "Help Commands", {"helpcommand"}, "", function(on_toggle)
chat.send_message(
    "/help1 /help2 /help3 /whatmenu",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end)

help1 = addict.list(Chatspam, "Commands A", {}, "Command: help1", function(); end)

addict.action(help1, "Commands A", {"help1"}, "", function()
chat.send_message(
    "/max NAME /ceopay NAME /boost NAME /addictboost NAME /resetacc NAME /repair NAME",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(help1, "Commands A", {}, "", function(on_toggle)
chat.send_message(
    "/max NAME /ceopay NAME /boost NAME /addictboost NAME /resetacc NAME /repair NAME",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end)

help2 = addict.list(Chatspam, "Commands B", {}, "Command: help2", function(); end)

addict.action(help2, "Commands B", {"help2"}, "", function()
chat.send_message(
    "/arm NAME /ammo NAME /autoheal NAME /bail NAME /giveotr NAME /upgradeveh NAME",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(help2, "Commands B", {}, "", function(on_toggle)
chat.send_message(
    "/arm NAME /ammo NAME /autoheal NAME /bail NAME /giveotr",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end)

help3 = addict.list(Chatspam, "Commands C", {}, "Command: help3", function(); end)

addict.action(help3, "Commands C", {"help3"}, "", function()
chat.send_message(
    "/spawn CARNAME /upgradeveh NAME /gotowaypoint NAME /alltowaypoint NAME",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(help3, "Commands C", {}, "", function(on_toggle)
chat.send_message(
    "/spawn CARNAME  /upgradeveh NAME /gotowaypoint NAME /alltowaypoint NAME",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end)

casinohelp1 = addict.list(Chatspam, "Roulette Method", {}, "Command: casinohelp1", function(); end)

addict.action(casinohelp1, "Roulette Method", {"casinohelp1"}, "", function()
chat.send_message(
    "If you want to make money come to casino play roulette and bet max on 1st 12(50k) and Red 1(5k), win 3 loose 1 330k a minute",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(casinohelp1, "Roulette Method", {"togglecasinohelp1"}, "", function(on_toggle)
chat.send_message(
    "If you want to make money come to casino play roulette and bet max on 1st 12(50k) and Red 1(5k), win 3 loose 1 330k a minute",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end)

casinohelp2 = addict.list(Chatspam, "Blackjack Method", {}, "Command: casinohelp2", function(); end)

addict.action(casinohelp2, "Blackjack Method", {"casinohelp2"}, "", function()
chat.send_message(
    "If you want to make money come to casino play blackjack! Click max bet then hit stand and win 2x your bet!",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(casinohelp2, "Blackjack Method", {"togglecasinohelp2"}, "", function(on_toggle)
chat.send_message(
    "If you want to make money come to casino play blackjack! Click max bet then hit stand and win 2x your bet!",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end)

whatmenu = addict.list(Chatspam, "what menu Do I Use?", {}, "Command: whatmenu", function(); end)

addict.action(whatmenu, "what menu Do I Use?", {"whatmenu"}, "", function()
chat.send_message(
    "I use Stand, Cherax, I got tons other menu's and I coded all the addict scripts.",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(whatmenu, "what menu Do I Use?", {"whatmenu"}, "", function(on_toggle)
chat.send_message(
    "I use Stand, Cherax, I got tons other menu's and I coded all the addict scripts.",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(150000)
end)

imfuckinggod = addict.list(Chatspam, "I'm Fucking God", {}, "Command: imfuckinggod", function(); end)

addict.action(imfuckinggod, "I'm Fucking God", {"imfuckinggod"}, "", function()
chat.send_message(
    "I'M FUCKING GOD!!!",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(imfuckinggod, "I'm Fucking God", {"imfuckinggod"}, "", function(on_toggle)
chat.send_message(
    "I'M FUCKING GOD!!!",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(50)
end)

reportme = addict.list(Chatspam, "Report Me", {}, "Command: reportme", function(); end)

addict.action(reportme, "Report Me", {"reportme"}, "", function()
chat.send_message(
    "REPORT ME!!!",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(reportme, "Report Me", {"reportme"}, "", function(on_toggle)
chat.send_message(
    "REPORT ME!!!",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(50)
end)

ilovezelensky = addict.list(Chatspam, "I <3 ZELEN", {}, "Command: ilovezelensky", function(); end)

addict.action(ilovezelensky, "I <3 ZELEN", {"ilovezelensky"}, "Russians hate this ;)", function()
chat.send_message(
    "I <3 PRESIDENT VOLODYMYR ZELENSKYY",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(ilovezelensky, "I <3 ZELEN", {"ilovezelensky"}, "Russians hate this ;)", function(on_toggle)
chat.send_message(
    "I <3 PRESIDENT VOLODYMYR ZELENSKYY",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(50)
end)

iloveputin = addict.list(Chatspam, "I <3 PUTIN", {}, "Command: iloveputin", function(); end)

addict.action(iloveputin, "I <3 PUTIN", {"iloveputin"}, "Ukranians hate this ;)", function()
chat.send_message(
    "I <3 PRESIDENT VOLODYMYR PUTIN",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.toggle_loop(iloveputin, "I <3 PUTIN", {"iloveputin"}, "Ukranians hate this ;)", function(on_toggle)
chat.send_message(
    "I <3 PRESIDENT VOLODYMYR PUTIN",
    false, -- in team chat
    true, -- add to local history
    true  -- networked
    )
util.yield(50)
end)

--------------------------------------------------------------------------------------------------------------------
--[[
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─████████████████───██████████████─██████████████─██████████████─██████──██████─██████████████─████████████████───████████──████████─
─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░██──██░░░░██─
─██░░████████░░██───██░░██████████─██░░██████████─██░░██████░░██─██░░██──██░░██─██░░██████████─██░░████████░░██───████░░██──██░░████─
─██░░██────██░░██───██░░██─────────██░░██─────────██░░██──██░░██─██░░██──██░░██─██░░██─────────██░░██────██░░██─────██░░░░██░░░░██───
─██░░████████░░██───██░░██████████─██░░██─────────██░░██──██░░██─██░░██──██░░██─██░░██████████─██░░████████░░██─────████░░░░░░████───
─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░██─────────██░░██──██░░██─██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───────████░░████─────
─██░░██████░░████───██░░██████████─██░░██─────────██░░██──██░░██─██░░██──██░░██─██░░██████████─██░░██████░░████─────────██░░██───────
─██░░██──██░░██─────██░░██─────────██░░██─────────██░░██──██░░██─██░░░░██░░░░██─██░░██─────────██░░██──██░░██───────────██░░██───────
─██░░██──██░░██████─██░░██████████─██░░██████████─██░░██████░░██─████░░░░░░████─██░░██████████─██░░██──██░░██████───────██░░██───────
─██░░██──██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██───████░░████───██░░░░░░░░░░██─██░░██──██░░░░░░██───────██░░██───────
─██████──██████████─██████████████─██████████████─██████████████─────██████─────██████████████─██████──██████████───────██████───────
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
]]

Cash_addict = addict.list(addict.my_root(), "Recovery", {}, "", function() end)

addict.divider(Cash_addict, "Recovery")

------------------------------------------------------------------------------------------------------------------------------------------

	Ped_Cash = addict.list(Cash_addict, "Ped Cash", {}, "", function(); end)

    addict.divider(Ped_Cash, "Ped Cash")
    
addict.toggle(Ped_Cash, "Ped Cash", {"pedcashpid"}, "Warning! Do not know if this is safe.", function (on_toggle)
    if on_toggle then
        local Kill_Peds = addict.ref_by_path("World>Inhabitants>NPC Existence Punishments>Die")
        addict.trigger_command(Kill_Peds)
        addict.trigger_commands("toggletppickups" .. PLAYER.GET_PLAYER_NAME(pid))
    else
        local Kill_Peds = addict.ref_by_path("World>Inhabitants>NPC Existence Punishments>Die")
        addict.trigger_command(Kill_Peds)
        addict.trigger_commands("toggletppickups" .. PLAYER.GET_PLAYER_NAME(pid))
    end
end)

addict.toggle(Ped_Cash, "Ped Cash Boost", {"pedboost"}, "Enable the modifcation of ped cash dropped. You may crash after 1 minute using it offline. $2k ped cash drops on players with ped cash enabled..", function()
local _peds = entities.get_all_peds_as_handles()
for i, _ped in pairs(_peds) do
    if _ped and not PED.IS_PED_A_PLAYER(_ped) then
            PED.SET_AMBIENT_PEDS_DROP_MONEY(true)
            PED.SET_PED_MONEY(_ped, 2000)
        else
            PED.SET_AMBIENT_PEDS_DROP_MONEY(true)
            PED.SET_PED_MONEY(_ped, 2000)
        end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------

FSL_Money = addict.list(Cash_addict, "FSL Money", {"fslmoney"}, "Don't use this without Cherax or FSL loaded!", function() end)

    addict.action(FSL_Money, "Give $1 Quintillion", {"givequint"}, "Gives you $1000000000000000000.", function()
        STATS.STAT_INCREMENT(util.joaat("BANK_BALANCE"), 1000000000000000000)
        util.toast("Going above 5 Quintillion can cause you to be unable to purchase anything.\n\nYou have been Warned")
    end)

    addict.action(FSL_Money, "Remove $1 Quintillion", {"removequint"}, "Removes $1000000000000000000.", function()
        local currentBank = util.stat_get_int64(util.joaat("BANK_BALANCE"))
        STATS.STAT_SET_INT(util.joaat("BANK_BALANCE"), 0)
        STATS.STAT_INCREMENT(util.joaat("BANK_BALANCE"), currentBank - 1000000000000000000)
    end)

    addict.action(FSL_Money, "Reset Bank Balance", {"resetmoney"}, "Sets bank balance to 0.", function()
        STATS.STAT_SET_INT(util.joaat("BANK_BALANCE"), 0)
    end)


    addict.toggle_loop(Cash_addict, "Bounty Loop Farm", {"bountyloop"}, "SPAWNS EVERYONE AT ECLIPSE TOWERS AND LOOPS EVERY 60 SECONDS.", function()
        Bountyonself = addict.ref_by_path("Players>All Players>Trolling>Loop Bounty>Place Bounty On Self")
        addict.trigger_command(Bountyonself)
        util.yield(1)
        addict.trigger_commands("loopbountyall")
        util.yield(1)
        addict.trigger_commands("apt1all")
        util.yield(1)
        addict.trigger_commands("apt1" .. PLAYER.GET_PLAYER_NAME(pid))
        util.yield(1)
        util.yield(1)
        Bountyonself = addict.ref_by_path("Players>All Players>Trolling>Loop Bounty>Place Bounty On Self")
        addict.trigger_command(Bountyonself)
        util.yield(1)
        addict.trigger_commands("loopbountyall")
        util.yield(60000)
    end)


--------------------------------------------------------------------------------------------------------------------
--[[
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─██████████████─████████████████───██████████████─██████████████─██████████████─██████████████─██████████████─██████████─██████████████─██████──────────██████─██████████████─
─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░██─██░░░░░░░░░░██─██░░██████████──██░░██─██░░░░░░░░░░██─
─██░░██████░░██─██░░████████░░██───██░░██████░░██─██████░░██████─██░░██████████─██░░██████████─██████░░██████─████░░████─██░░██████░░██─██░░░░░░░░░░██──██░░██─██░░██████████─
─██░░██──██░░██─██░░██────██░░██───██░░██──██░░██─────██░░██─────██░░██─────────██░░██─────────────██░░██───────██░░██───██░░██──██░░██─██░░██████░░██──██░░██─██░░██─────────
─██░░██████░░██─██░░████████░░██───██░░██──██░░██─────██░░██─────██░░██████████─██░░██─────────────██░░██───────██░░██───██░░██──██░░██─██░░██──██░░██──██░░██─██░░██████████─
─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░██──██░░██─────██░░██─────██░░░░░░░░░░██─██░░██─────────────██░░██───────██░░██───██░░██──██░░██─██░░██──██░░██──██░░██─██░░░░░░░░░░██─
─██░░██████████─██░░██████░░████───██░░██──██░░██─────██░░██─────██░░██████████─██░░██─────────────██░░██───────██░░██───██░░██──██░░██─██░░██──██░░██──██░░██─██████████░░██─
─██░░██─────────██░░██──██░░██─────██░░██──██░░██─────██░░██─────██░░██─────────██░░██─────────────██░░██───────██░░██───██░░██──██░░██─██░░██──██░░██████░░██─────────██░░██─
─██░░██─────────██░░██──██░░██████─██░░██████░░██─────██░░██─────██░░██████████─██░░██████████─────██░░██─────████░░████─██░░██████░░██─██░░██──██░░░░░░░░░░██─██████████░░██─
─██░░██─────────██░░██──██░░░░░░██─██░░░░░░░░░░██─────██░░██─────██░░░░░░░░░░██─██░░░░░░░░░░██─────██░░██─────██░░░░░░██─██░░░░░░░░░░██─██░░██──██████████░░██─██░░░░░░░░░░██─
─██████─────────██████──██████████─██████████████─────██████─────██████████████─██████████████─────██████─────██████████─██████████████─██████──────────██████─██████████████─
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
]]

Protex = addict.list(addict.my_root(), "Protections", {}, "", function() end)

addict.divider(Protex, "Protections")

        addict.toggle_loop(Protex, "No Entity Spawn Toggled", {"noentities"}, "Attempt to fuck every single entity without exception. Not recommended but fuck it.", function(on_loop)
            local ct = 0
            for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
                entities.delete_by_handle(ent)
    
                ct = ct + 1
            end
            for k,ent in pairs(entities.get_all_peds_as_handles()) do
                if not PED.IS_PED_A_PLAYER(ent) then
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
                    entities.delete_by_handle(ent)
    
                end
                ct = ct + 1
            end
            for k,ent in pairs(entities.get_all_objects_as_handles()) do
                if ent ~= PLAYER.PLAYER_PED_ID() then
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
                    entities.delete_by_handle(ent)
                    ct = ct + 1
                end
            end
                for k,ent in pairs(entities.get_all_pickups_as_handles()) do
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
                    entities.delete_by_handle(ent)
                    util.yield()
                return
            end
        end)

addict.toggle_loop(Protex,"Clear Shit Up Toggled", {"togglesuperc"}, "Toggled Clean up.", function()
    addict.trigger_commands("superc 1")
end)

	addict.click_slider(Protex,"Clear Shit Up", {"superc"}, "5 = peds, 4 = vehicles, 3 = objects, 2 = pickups, 1 = all \nNote: This excludes players and their vehicles.", 1, 5, 1, 1, function(on_change)
		if on_change == 5 then
			local count = 0
			for k,ent in pairs(entities.get_all_peds_as_handles()) do
				if not PED.IS_PED_A_PLAYER(ent) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1

				end
			end
		end
		if on_change == 4 then
			local count = 0
			for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
				local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1, false)
				if not PED.IS_PED_A_PLAYER(PedInSeat) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end
			return
		end
		if on_change == 3 then
			local count = 0
			for k,ent in pairs(entities.get_all_objects_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			    end
			return
		end
		if on_change == 2 then
			local count = 0
			for k, ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			    end
			return
		end
		if on_change == 1 then
			local count = 0
			for k, ent in pairs(entities.get_all_peds_as_handles()) do
				if not PED.IS_PED_A_PLAYER(ent) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end
			for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
				local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1, false)
				if not PED.IS_PED_A_PLAYER(PedInSeat) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end
			for k,ent in pairs(entities.get_all_objects_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
			for k,ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
			return
		end
	end)

addict.toggle_loop(Protex, "Suspicious Ped Deletion", {}, "Deletes peds with invalid models or crash-like traits", function()
    local myCoords = ENTITY.GET_ENTITY_COORDS(players.user_ped(), false)
    local peds = entities.get_all_peds_as_handles()

    for _, ped in ipairs(peds) do
        if not PED.IS_PED_A_PLAYER(ped) then
            local model = ENTITY.GET_ENTITY_MODEL(ped)
            if not STREAMING.IS_MODEL_VALID(model) then
                try_delete_entity(ped)
                util.toast("Invalid ped deleted")
            end
        end
    end
end)

addict.toggle_loop(Protex, "Name Spoof Detection", {}, "Warns you if a player joins with a name similar to yours", function()
    local myName = players.get_name(players.user())
    for pid = 0, 31 do
        if players.exists(pid) and pid ~= players.user() then
            local name = players.get_name(pid)
            if name:lower():find(myName:lower()) then
                util.toast("Possible name spoof: " .. name)
            end
        end
    end
    util.yield(1000)
end)

addict.action(Protex, "Force Cleanup Entities", {}, "Deletes unowned/unused entities", function()
    local allEnts = entities.get_all_objects_as_handles()
    for _, ent in ipairs(allEnts) do
        if not ENTITY.IS_ENTITY_ATTACHED(ent) then
            try_delete_entity(ent)
        end
    end
    util.toast("Cleanup completed!")
end)


--------------------------------------------------------------------------------------------------------------------
--[[
───────────────────────────────────────────────────────────────────────────────────────────
─██████████████─██████████████─██████─────────██████████████─██████████████─██████████████─
─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
─██░░██████████─██░░██████████─██░░██─────────██░░██████████─██░░██████████─██████░░██████─
─██░░██─────────██░░██─────────██░░██─────────██░░██─────────██░░██─────────────██░░██─────
─██░░██████████─██░░██████████─██░░██─────────██░░██████████─██░░██─────────────██░░██─────
─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░██─██░░██─────────────██░░██─────
─██████████░░██─██░░██████████─██░░██─────────██░░██████████─██░░██─────────────██░░██─────
─────────██░░██─██░░██─────────██░░██─────────██░░██─────────██░░██─────────────██░░██─────
─██████████░░██─██░░██████████─██░░██████████─██░░██████████─██░░██████████─────██░░██─────
─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─────██░░██─────
─██████████████─██████████████─██████████████─██████████████─██████████████─────██████─────
───────────────────────────────────────────────────────────────────────────────────────────
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─██████████████─██████─────────██████████████─████████──████████─██████████████─████████████████───██████████████─
─██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░██─██░░░░██──██░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─
─██░░██████░░██─██░░██─────────██░░██████░░██─████░░██──██░░████─██░░██████████─██░░████████░░██───██░░██████████─
─██░░██──██░░██─██░░██─────────██░░██──██░░██───██░░░░██░░░░██───██░░██─────────██░░██────██░░██───██░░██─────────
─██░░██████░░██─██░░██─────────██░░██████░░██───████░░░░░░████───██░░██████████─██░░████████░░██───██░░██████████─
─██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░██─────████░░████─────██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─
─██░░██████████─██░░██─────────██░░██████░░██───────██░░██───────██░░██████████─██░░██████░░████───██████████░░██─
─██░░██─────────██░░██─────────██░░██──██░░██───────██░░██───────██░░██─────────██░░██──██░░██─────────────██░░██─
─██░░██─────────██░░██████████─██░░██──██░░██───────██░░██───────██░░██████████─██░░██──██░░██████─██████████░░██─
─██░░██─────────██░░░░░░░░░░██─██░░██──██░░██───────██░░██───────██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░░░░░██─
─██████─────────██████████████─██████──██████───────██████───────██████████████─██████──██████████─██████████████─
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────
]]

custselc = addict.list(addict.my_root(), "Select Players", {}, "", function(); end)

addict.toggle(custselc, "Exclude Selected", {"excludepussies"}, "", function(on_toggle)
    if on_toggle then
        excludeselected = true
    else
        excludeselected = false
    end
end)

addict.action(custselc, "Go to Players List", {"gotopl"}, "Shotcut for players list.", function()
    addict.trigger_commands("playerlist")
end)

addict.divider(custselc, "Misc Players")

selectedplayer = {}
for b = 0, 31 do
    selectedplayer[b] = false
end
excludeselected = false

cmd_id = {}
for i = 0, 31 do
    cmd_id[i] = 0
end

addict.action(custselc, "Kick", {}, "Kicks Them.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("kick" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("kick" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        end
    end
end)

addict.action(custselc, "Blast Kick", {}, "Blocks Joins And Kicks Them.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("kick" .. PLAYER.GET_PLAYER_NAME(pids))
                addict.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("kick" .. PLAYER.GET_PLAYER_NAME(pids))
                addict.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        end
    end
end)

addict.action(custselc, "Block Player", {}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        end
    end
end)


tp_players = addict.list(custselc, "Teleports", {}, "", function(); end)

addict.action(tp_players, "TP Players", {"tpplayers"}, "Teleports to you.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                util.yield(2000)
                addict.trigger_commands("summon " .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Give them a second to get on..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                util.yield(2000)
                addict.trigger_commands("summon " .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Give them a second to get on..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        end
    end
end)

addict.action(tp_players, "TP Players Near Me", {"tpplayersnear"}, "Teleports near to you.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                util.yield(2000)
                addict.trigger_commands("aptme " .. PLAYER.GET_PLAYER_NAME(pids))
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                util.yield(2000)
                addict.trigger_commands("aptme " .. PLAYER.GET_PLAYER_NAME(pids))
            end
        end
    end
end)

addict.action(tp_players, "TP Players To Casino", {"autocasinoall"}, "It will send your selected players to the table.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("autocasino " .. PLAYER.GET_PLAYER_NAME(pids))
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("autocasino " .. PLAYER.GET_PLAYER_NAME(pids))
            end
        end
    end
end)

addict.action(tp_players, "TP Players To Their Waypoint", {"towaypoints"}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("wptp " .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Teleporting..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("wptp " .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Teleporting..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        end
    end
end)

addict.action(tp_players, "TP Players To My Waypoint", {"tomywaypoint"}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("wpsummon " .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Teleporting..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("wpsummon " .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Teleporting..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        end
    end
end)


addict.action(tp_players, "TP Player To MazeBank", {"tpplayersmazebank"}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("apt90 " .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Teleporting..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                addict.trigger_commands("apt90 " .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Teleporting..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        end
    end
end)

addict.divider(custselc, "Select Players")

for pids = 0, 31 do
    if players.exists(pids) then
        cmd_id[pids] = addict.toggle(custselc, tostring(PLAYER.GET_PLAYER_NAME(pids)), {}, "PID - ".. pids, function(on_toggle)
            if on_toggle then
                selectedplayer[pids] = true
            else
                selectedplayer[pids] = false
            end
        end)
    end
end

----------------------------------------------------------------------------------------------------------------------------

addict.action(addict.my_root(), "Yeet", {"ye"}, "Instantly sending yourself to desktop.", function()
    addict.trigger_commands("yeet")
end)

addict.action(addict.my_root(), "Yeet Roulette", {"yeetroulette"}, "Take a chance by instantly sending yourself to desktop or use the Restart GTA V Option.", function()
    local pick = math.random(6)
    if pick == 4 then 
        addict.show_command_box("say " .. "I loose.")
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        util.log("I loose.")
        util.yield(200)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        addict.trigger_commands("ye")
    else
        util.toast("Lucky Bastard ;)")
		addict.show_command_box("say " .. "I got lucky.")
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        util.yield(200)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
    end
end, nil, nil, COMMANDPERM_AGGRESSIVE)

addict.action(addict.my_root(), "Restart GTA V", {"restartgta"}, "Restarts your game, closes it Online. You will need to reinject (duh).", function(on_click)
    MISC.RESTART_GAME("E574A662ACAEFBB1")
    util.yield(3000)
    addict.trigger_commands("ye")
    addict.trigger_commands("yeet")
end)


addict.action(addict.my_root(), "Restart Script", {"restartaddictlua"}, "Restarts the script to check for updates. Or you may prefer it on hotkey to make it the first script in players list making spectate option faster to find.", function ()
    util.restart_script()
end)

addict.divider(addict.my_root(), "V1.1", {"addictversion"})

---------------------------------------------------------------------------------------------------------------------------------------

players.on_join(function(pid)

addict.divider(addict.player_root(pid), "Addict")

local Vehicle_Events = addict.list(addict.player_root(pid), "Vehicle Events", {"vehicleevents", ""})
local Trolling = addict.list(addict.player_root(pid), "Trolling", {"trolling", ""})
local Crashing = addict.list(addict.player_root(pid), "Crashes", {"crashes"}, "")
local Kicks = addict.list(addict.player_root(pid), "Kicks", {"kicks"}, "")
local Friendly = addict.list(addict.player_root(pid), "Friendly", {"friendly", ""})

addict.action(addict.player_root(pid), "Spectate", {"spec"}, "", function()
    if pids == PLAYER.PLAYER_ID() then
        util.toast("Spectating " .. PLAYER.GET_PLAYER_NAME(pids))
        return
    else
    end
    addict.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid))
    local hash = util.joaat("baller")
    local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            util.yield()
        end
        local Coords1 = PlayerCoords.y + 10
        local Coords2 = PlayerCoords.y - 10
    addict.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off")
    end
end)

-------------------------------------------------------------------------------------------------------------------------------------

--[[
─────────────────────────────────────────────────────────────────────────────────────────────────────────
─██████──██████─██████████████─██████──██████─██████████─██████████████─██████─────────██████████████────
─██░░██──██░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░██─██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░██────
─██░░██──██░░██─██░░██████████─██░░██──██░░██─████░░████─██░░██████████─██░░██─────────██░░██████████────
─██░░██──██░░██─██░░██─────────██░░██──██░░██───██░░██───██░░██─────────██░░██─────────██░░██────────────
─██░░██──██░░██─██░░██████████─██░░██████░░██───██░░██───██░░██─────────██░░██─────────██░░██████████────
─██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██───██░░██───██░░██─────────██░░██─────────██░░░░░░░░░░██────
─██░░██──██░░██─██░░██████████─██░░██████░░██───██░░██───██░░██─────────██░░██─────────██░░██████████────
─██░░░░██░░░░██─██░░██─────────██░░██──██░░██───██░░██───██░░██─────────██░░██─────────██░░██────────────
─████░░░░░░████─██░░██████████─██░░██──██░░██─████░░████─██░░██████████─██░░██████████─██░░██████████────
───████░░████───██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██────
─────██████─────██████████████─██████──██████─██████████─██████████████─██████████████─██████████████────
─────────────────────────────────────────────────────────────────────────────────────────────────────────
───────────────────────────────────────────────────────────────────────────────────────────────────
─██████████████─██████──██████─██████████████─██████──────────██████─██████████████─██████████████─
─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██─██░░██████████──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
─██░░██████████─██░░██──██░░██─██░░██████████─██░░░░░░░░░░██──██░░██─██████░░██████─██░░██████████─
─██░░██─────────██░░██──██░░██─██░░██─────────██░░██████░░██──██░░██─────██░░██─────██░░██─────────
─██░░██████████─██░░██──██░░██─██░░██████████─██░░██──██░░██──██░░██─────██░░██─────██░░██████████─
─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██─██░░██──██░░██──██░░██─────██░░██─────██░░░░░░░░░░██─
─██░░██████████─██░░██──██░░██─██░░██████████─██░░██──██░░██──██░░██─────██░░██─────██████████░░██─
─██░░██─────────██░░░░██░░░░██─██░░██─────────██░░██──██░░██████░░██─────██░░██─────────────██░░██─
─██░░██████████─████░░░░░░████─██░░██████████─██░░██──██░░░░░░░░░░██─────██░░██─────██████████░░██─
─██░░░░░░░░░░██───████░░████───██░░░░░░░░░░██─██░░██──██████████░░██─────██░░██─────██░░░░░░░░░░██─
─██████████████─────██████─────██████████████─██████──────────██████─────██████─────██████████████─
───────────────────────────────────────────────────────────────────────────────────────────────────
]]

addict.divider(Vehicle_Events, "Vehicle Events")

local Vehicle_Speed = addict.list(Vehicle_Events, "Vehicle Speed", {"vehiclespeed", ""})

	addict.action(Vehicle_Speed,"Boost", {"boost"}, "Sets max speed of vehicle to 100 better for cars",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 100) 
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(Vehicle_Speed,"Addict boost", {"addictboost"}, "Sets max speed of vehicle to 9999999 better for bikes",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 9999999) 
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

	addict.action(Vehicle_Speed,"Reset Speed", {"resetaccs"}, "Resets max speed of vehicle",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 1) 
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(Vehicle_Speed,"Ruin Speed", {"trashaccs"}, "Sets max speed of vehicle to INT_MIN.",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, -2147483647) 
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    local Vehicle_Traj = addict.list(Vehicle_Events, "Vehicle Trajectory", {"vehicletraj", ""})

    addict.toggle_loop(Vehicle_Traj, "360 Vehicle", {"360player"}, "", function()
        local vehicle = get_player_vehicle(pid,true)
        if vehicle ~= 0 and not PED.IS_PED_DEAD_OR_DYING(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) and NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vehicle) then
            ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 5, 0, 0, 150.0, 0, 0, 0, 0, true, false, true, false, true)
        end
    end)

    addict.toggle_loop(Vehicle_Traj,"Spinbot Vehicle", {"glitchveh"}, "", function()
        local vehicle = get_player_vehicle(pid,true)
        if vehicle ~= 0 and not PED.IS_PED_DEAD_OR_DYING(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) and NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vehicle) then
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle)
                ENTITY.APPLY_FORCE_TO_ENTITY(veh, 5, 0, 0, 150.0, 0, 0, 0, 0, true, false, true, false, true)
                cam_pos = CAM.GET_GAMEPLAY_CAM_ROT(0)
                cam_pos.x = cam_pos.x + math.random(-20,20)
                cam_pos.y = cam_pos.y + math.random(-20,20)
                cam_pos.z = cam_pos.z + math.random(-20,20)
                ENTITY.SET_ENTITY_ROTATION(vehicle, cam_pos.x, cam_pos.y, cam_pos.z, 1, true);
        end
    end)

    addict.action(Vehicle_Traj,"Bounce Vehicle", {"bouncecar"}, "", function()
        local vehicle = get_player_vehicle(pid,true)
        if vehicle ~= 0 and not PED.IS_PED_DEAD_OR_DYING(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) and NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vehicle) then
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 0, 10, true, false, true)
            util.yield(250)
        end
    end)
    
    addict.action(Vehicle_Traj, "Launch Forward", {}, "", function()
		local vehicle =  get_player_vehicle(pid,true)
		if vehicle then
			local force = ENTITY.GET_ENTITY_FORWARD_VECTOR(vehicle)
			force:mul(40.0)
			AUDIO.SET_VEHICLE_BOOST_ACTIVE(vehicle, true)
			ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, force.x, force.y, force.z, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			AUDIO.SET_VEHICLE_BOOST_ACTIVE(vehicle, false)
		end
	end)

    addict.action(Vehicle_Traj, "Launch Backward", {}, "", function()
		local vehicle =  get_player_vehicle(pid,true)
		if vehicle then
			local force = ENTITY.GET_ENTITY_FORWARD_VECTOR(vehicle)
			force:mul(-40.0)
			AUDIO.SET_VEHICLE_BOOST_ACTIVE(vehicle, true)
			ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, force.x, force.y, force.z, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			AUDIO.SET_VEHICLE_BOOST_ACTIVE(vehicle, false)
		end
	end)

	addict.action(Vehicle_Traj,"Launch Up", {"launchup"}, "Shoots player up",function()
        local vehicle = get_player_vehicle(pid,true)
        if vehicle then
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 0, 10000, true, false, true)
        end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.action(Vehicle_Traj,"Launch Down", {"launchdown"}, "Shoots player down",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 0, -10000, true, false, true)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)
		
	addict.action(Vehicle_Traj,"East", {"eastveh"}, "Boosts player's vehicle in the East direction",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 10000, 0, 0, true, false, true)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Traj,"West", {"westveh"}, "Boosts player's vehicle in the West direction",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, -10000, 0, 0, true, false, true)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Traj,"South", {"southveh"}, "Boosts player's vehicle in the South direction",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, -10000, 0, true, false, true)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Traj,"North", {"northveh"}, "Boosts player's vehicle in the North direction",function()
        local vehicle = get_player_vehicle(pid,true)
        if vehicle then
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 10000, 0, true, false, true)
        end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

--------------------------------------------------------------------------------------------------------------------------------------------------------------

    Vehicle_kicks = addict.list(Vehicle_Events, "Vehicle Kick", {}, "", function(); end)

    
    addict.action(Vehicle_kicks, "Vehicle Jacker", {}, "Spawns a ped to steal and dump the player's nearest vehicle in sea.", function()
        spawn_jacker_on_player(pid)
    end)


    addict.action(Vehicle_kicks, "Ped In Veh", {""}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local my_ped = PLAYER.PLAYER_PED_ID()
        local ped_coords = ENTITY.GET_ENTITY_COORDS(ped)
        local my_coords = ENTITY.GET_ENTITY_COORDS(my_ped)
        local hash = util.joaat("ratbike")
        request_model(hash)
        addict.trigger_commands("vehkick" .. players.get_name(pid))
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
        local veh = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(ped, true), CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(veh, true)
        TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(veh, true)
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(veh, true, true)
        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
        ENTITY.SET_ENTITY_VISIBLE(veh, false)
        ChangeNetObjOwner(ped, veh)
        util.yield(50)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
        entities.set_can_migrate(entities.handle_to_pointer(ped), false)
        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
        ENTITY.SET_ENTITY_VISIBLE(veh, false)
        ENTITY.FREEZE_ENTITY_POSITION(veh, true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(veh, true)
        PED.CAN_PED_RAGDOLL(ped, false)
        PED.SET_PED_CONFIG_FLAG(ped, 26, true)
        PED.SET_PED_INTO_VEHICLE(ped, veh, -1)
        TASK.TASK_ENTER_VEHICLE(ped, veh, 1000, -1, 1.0, 2|8|16, ped_coords)
        addict.trigger_commands("ragdoll" .. players.get_name(pid))
        util.yield(50)
        addict.trigger_commands("ragdoll" .. players.get_name(pid))
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(veh, my_coords.x, my_coords.y, my_coords.z)
        util.yield(500)
        entities.delete_by_handle(veh)
    end)

    addict.action(Vehicle_kicks, "Steal Vehicle ", {"steal"}, "Spawns a ped to take them out of their vehicle and drives away.", function() -- Skidded from femboy girl prishum
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = players.get_position(pid)
        local vehicle = PED.GET_VEHICLE_PED_IS_USING(ped)

        if not PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            util.toast(lang.get_localised(1067523721):gsub("{}", players.get_name(pid)))
        return end
        local spawned_ped = PED.CREATE_RANDOM_PED(pos.x, pos.y - 10, pos.z)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(spawned_ped)
        entities.set_can_migrate(entities.handle_to_pointer(spawned_ped), false)
        ENTITY.SET_ENTITY_INVINCIBLE(spawned_ped, true)
        ENTITY.SET_ENTITY_VISIBLE(spawned_ped, false)
        ENTITY.FREEZE_ENTITY_POSITION(spawned_ped, true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(spawned_ped, true)
        PED.CAN_PED_RAGDOLL(spawned_ped, false)
        PED.SET_PED_CONFIG_FLAG(spawned_ped, 26, true)
        TASK.TASK_ENTER_VEHICLE(spawned_ped, vehicle, 1000, -1, 1.0, 2|8|16, pos)
        util.yield(1500)
        if TASK.GET_IS_TASK_ACTIVE(ped, 2) then
            repeat
                util.yield()
            until not TASK.GET_IS_TASK_ACTIVE(ped, 2) or PED.IS_PED_IN_ANY_VEHICLE(spawned_ped, false)
            TASK.TASK_VEHICLE_DRIVE_WANDER(spawned_ped, vehicle, 9999.0, 6)
            util.toast("Now your vehcile!")
        else
            util.toast("Failed to steal players vehicle. :/")
            entities.delete_by_handle(spawned_ped)
        end
        if not TASK.GET_IS_TASK_ACTIVE(spawned_ped) then
            repeat
            TASK.TASK_VEHICLE_DRIVE_WANDER(spawned_ped, vehicle, 9999.0, 6)
            util.yield()
            until TASK.GET_IS_TASK_ACTIVE(spawned_ped)
        end
    end)

    addict.action(Vehicle_kicks, "Steal Vehicle V2", {"stealv2"}, "Changes the net object owner of the vehicle.", function()
        local pped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local veh = PED.GET_VEHICLE_PED_IS_IN(ped, true)
        local myveh = PED.GET_VEHICLE_PED_IS_IN(pped, true)
        PED.SET_PED_INTO_VEHICLE(pped, veh, -2)
        util.yield(50)
        ChangeNetObjOwner(veh, pid)
        ChangeNetObjOwner(veh, pped)
        util.yield(50)
        PED.SET_PED_INTO_VEHICLE(pped, myveh, -1)
    end)

    local Steal
    local fail_count = 0
    Steal = addict.action(Vehicle_kicks, "Kick from Vehicle", {"kickfromveh"}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = players.get_position(pid)
        local vehicle = PED.GET_VEHICLE_PED_IS_USING(ped)

        if PED.IS_PED_IN_VEHICLE(ped, vehicle, false) then
            local spawned_ped = PED.CREATE_RANDOM_PED(pos.x, pos.y - 10, pos.z)
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(spawned_ped)
            entities.set_can_migrate(entities.handle_to_pointer(spawned_ped), false)
            ENTITY.SET_ENTITY_INVINCIBLE(spawned_ped, true)
            ENTITY.SET_ENTITY_VISIBLE(spawned_ped, false)
            ENTITY.FREEZE_ENTITY_POSITION(spawned_ped, true)
            PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(spawned_ped, true)
            PED.CAN_PED_RAGDOLL(spawned_ped, false)
            PED.SET_PED_CONFIG_FLAG(spawned_ped, 26, true)
            TASK.TASK_ENTER_VEHICLE(spawned_ped, vehicle, 1000, -1, 1.0, 2|8|16, pos)
            util.yield(1000)
            if TASK.GET_IS_TASK_ACTIVE(ped, 2) then
                repeat
                    util.yield()
                until not TASK.GET_IS_TASK_ACTIVE(ped, 2)
            end
            if fail_count >= 5 then
                util.toast("Failed to steal player too many times. Disabling feature...")
                fail_count = 0
                Steal.value = false
            end
            if PED.IS_PED_IN_ANY_VEHICLE(spawned_ped, false) then
                util.yield(1500)
                TASK.TASK_VEHICLE_DRIVE_WANDER(spawned_ped, vehicle, 9999.0, 6)
                fail_count = 0
            else
                fail_count += 1
                entities.delete_by_handle(spawned_ped)
            end
            util.yield(500)
        end
    end, function()
        fail_count = 0
    end)

    
    addict.toggle_loop(Vehicle_kicks, "Auto Steal Vehicle", {"autosteal"}, "Changes the net object owner of the vehicle looped.", function()
        local pped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local veh = PED.GET_VEHICLE_PED_IS_IN(ped, true)
        local myveh = PED.GET_VEHICLE_PED_IS_IN(pped, true)
        PED.SET_PED_INTO_VEHICLE(pped, veh, -2)
        util.yield(50)
        ChangeNetObjOwner(veh, pid)
        ChangeNetObjOwner(veh, pped)
        util.yield(50)
        PED.SET_PED_INTO_VEHICLE(pped, myveh, -1)
    end)


-----------------------------------------------------------------------------------------------------------------------------------------

    local Vehicle_Air = addict.list(Vehicle_Events, "Aircraft Events", {"airevent", ""})

	addict.action(Vehicle_Air,"Detach from Cargobob", {"detachcbob"}, "Detaches from Cargobob",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle)
            VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle)
            VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle)
            VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle)
            VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    	addict.action(Vehicle_Air,"Deploy Landing Gear", {"landing1"}, "",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.CONTROL_LANDING_GEAR(vehicle, 0)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Air,"Retract Landing Gear", {"landing0"}, "",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.CONTROL_LANDING_GEAR(vehicle, 3)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Air,"Disable Cargobob's Hook", {"nohook"}, "Disables cargobob's hook. when used, that cargobob's hook will no longer work",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.REMOVE_PICK_UP_ROPE_FOR_CARGOBOB(vehicle)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Air,"Strong Turbulence", {"turb1"}, "Makes turbulence stronger",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(vehicle, 1.0)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Air,"No Turbulence", {"turb0"}, "Makes turbulence weaker",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(vehicle, 0.0)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Air,"Set Propeller Speed at 100%", {"propel100"}, "",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.SET_HELI_BLADES_FULL_SPEED(vehicle)	
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Air,"Set Propeller Speed at 0%", {"propel0"}, "",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.SET_HELI_BLADES_SPEED(vehicle, 0.0)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.toggle_loop(Vehicle_Air,"Stop Propeller Blades", {"stopheli"}, "",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
            VEHICLE.SET_HELI_BLADES_SPEED(vehicle, -9999999)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.action(Vehicle_Air, "Fuck Up Plane/Heli", {"fupplane"}, "If you do it to a plane may get an error its nothing, when sent to a heli it will break off the tailboom and anything with propellers", function(v)
        addict.trigger_commands("spin" .. players.get_name(pid))
        util.yield(100)
        addict.trigger_commands("spin" .. players.get_name(pid))
        addict.trigger_commands("flipveh" .. players.get_name(pid))
        addict.trigger_commands("poptyres" .. players.get_name(pid))
        addict.trigger_commands("lock" .. players.get_name(pid))
        addict.trigger_commands("detachwing" .. players.get_name(pid))
        addict.trigger_commands("detachwheel" .. players.get_name(pid))
        addict.trigger_commands("removedoors" .. players.get_name(pid))
        addict.trigger_commands("destroyprop" .. players.get_name(pid))
        addict.trigger_commands("breakofftailboom" .. players.get_name(pid))
    end)

-----------------------------------------------------------------------------------------------------------------------------------------
    
StealEngine = addict.list(Vehicle_Events, "Steal Engines", {}, "", function() end)

ENGINE_MODEL = util.joaat("prop_car_engine_01") -- Engine-looking prop
CARRY_BONE = 57005 -- Right hand
ANIM_DICT = "anim@heists@box_carry@"
ANIM_NAME = "idle"
spawnedEngines = {}

function loadAnimDict(dict)
    STREAMING.REQUEST_ANIM_DICT(dict)
    while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do
        util.yield()
    end
end

addict.action(StealEngine, "Steal Engine", {"stealeng"}, "Pull engine from nearest vehicle and carry it.", function()
    ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    pos = ENTITY.GET_ENTITY_COORDS(ped, true)
    vehicles = entities.get_all_vehicles_as_handles()

    closestVeh, minDist = nil, 5.0
    for _, veh in ipairs(vehicles) do
        vehPos = ENTITY.GET_ENTITY_COORDS(veh, true)
        if vehPos and pos then
            dx = (pos.x or 0) - (vehPos.x or 0)
            dy = (pos.y or 0) - (vehPos.y or 0)
            dz = (pos.z or 0) - (vehPos.z or 0)
            dist = math.sqrt(dx*dx + dy*dy + dz*dz)
            if dist < minDist then
                closestVeh = veh
                minDist = dist
            end
        end
    end

    if not closestVeh then
        util.toast("No vehicle nearby!")
        return
    end

    vehCoords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(closestVeh, 0.0, 2.5, 0.5)
    engineObj = entities.create_object(ENGINE_MODEL, vehCoords)
    table.insert(spawnedEngines, engineObj)

    addict.trigger_commands("killveh " .. players.get_name(pid))

    loadAnimDict(ANIM_DICT)
    TASK.TASK_PLAY_ANIM(ped, ANIM_DICT, ANIM_NAME, 8.0, -8.0, -1, 49, 0, false, false, false)

    bone = PED.GET_PED_BONE_INDEX(ped, CARRY_BONE)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(engineObj, ped, bone,
        0.15, 0.0, -0.50,
        0.0, 0.0, 0.0,
        true, true, false, false, 2, true)

    util.toast("Engine pulled, attached, and carrying animation playing!")
end)

    addict.action(StealEngine, "Drop Engine", {"dropengine"}, "Drop the carried engine.", function()
        ENTITY.DETACH_ENTITY(engineObj, true, true)
        ENTITY.APPLY_FORCE_TO_ENTITY(engineObj, 1, 0.0, 3.0, 1.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
        TASK.CLEAR_PED_TASKS(ped)
        util.toast("Engine dropped!")
    end)

addict.action(StealEngine, "Clear All Engines", {"clearengines"}, "Delete all spawned engine props.", function()
    for _, engine in ipairs(spawnedEngines) do
        if ENTITY.DOES_ENTITY_EXIST(engine) then
            entities.delete_by_handle(engine)
        end
    end
    spawnedEngines = {}
    util.toast("All spawned engines cleared!")
end)

------------------------------------------------------------------------------------------------------------------------------------------

local trolly_vehicles = addict.list(Vehicle_Events, "Trolly Vehicles")


local bandito_godmode = false

addict.divider(trolly_vehicles, "Bandito")

addict.click_slider(trolly_vehicles, 'Send Banditos', {'sendbandito'}, '', 1,25,1,1, function(quantity)
    local bandito_hash = util.joaat("rcbandito")
    local ped_hash = util.joaat('mp_m_freemode_01')
    STREAMING.REQUEST_MODEL(bandito_hash); STREAMING.REQUEST_MODEL(ped_hash)
    while not STREAMING.HAS_MODEL_LOADED(bandito_hash) and not STREAMING.HAS_MODEL_LOADED(ped_hash) do
        util.yield()
    end
    for i = 1, quantity do
        local bandito, driver = spawn_trolly_vehicle(pid, bandito_hash, ped_hash)
        addBlipForEntity(bandito, 646, 4)
        ENTITY.SET_ENTITY_INVINCIBLE(bandito, bandito_godmode)
        ENTITY.SET_ENTITY_VISIBLE(driver, false, 0)
        util.yield(150)
    end
end)

addict.toggle(trolly_vehicles, "Invincible", {"invincbandito"}, "", function(on)
    bandito_godmode = on
end, false)

addict.action(trolly_vehicles, "Delete Banditos", {"deletebandito"}, "", function()
    delete_entities_by_model("rcbandito")
end)

-------------------------------------
-- GO KART 
-------------------------------------

local gokart_godmode = false
addict.divider(trolly_vehicles, 'Go-Kart')


addict.click_slider(trolly_vehicles, "Send Go-Kart(s)", {"sendgokart"}, "",1, 25, 1, 1, function(quantity)
    local vehicleHash = util.joaat("veto2")
    local pedHash = util.joaat("mp_m_freemode_01")
    requestModels(vehicleHash, pedHash)
    
    for i = 1, quantity do
        local gokart, driver = spawn_trolly_vehicle(pid, vehicleHash, pedHash)
        addBlipForEntity(gokart, 748, 5)
        ENTITY.SET_ENTITY_INVINCIBLE(gokart, gokartGodmode)
        VEHICLE.SET_VEHICLE_COLOURS(gokart, 89, 0)
        VEHICLE.TOGGLE_VEHICLE_MOD(gokart, 18, true)
        ENTITY.SET_ENTITY_INVINCIBLE(driver, gokartGodmode)
        PED.SET_PED_COMPONENT_VARIATION(driver, 3, 111, 13, 2)
        PED.SET_PED_COMPONENT_VARIATION(driver, 4, 67, 5, 2)
        PED.SET_PED_COMPONENT_VARIATION(driver, 6, 101, 1, 2)
        PED.SET_PED_COMPONENT_VARIATION(driver, 8, -1, -1, 2)
        PED.SET_PED_COMPONENT_VARIATION(driver, 11, 148, 5, 2)
        PED.SET_PED_PROP_INDEX(driver, 0, 91, 0, true)
        util.yield(150)
    end

end)

addict.toggle(trolly_vehicles, 'Invincible Go-Kart', {"invinckart"}, '', function(toggle)
    gokart_godmode = toggle
end)

addict.action(trolly_vehicles, 'Delete Go-Karts', {"deletekart"}, '', function()
    delete_entities_by_model('veto2')
end)

-------------------------------------
-- Phantom Wedge
-------------------------------------

local phantom_godmode = false

addict.divider(trolly_vehicles, "Phantom Wedge")

addict.click_slider(trolly_vehicles, 'Send Phantom Wedges', {'sendphantom'}, '', 1, 25, 1, 1, function(quantity)
    local phantom_hash = util.joaat("Phantom2")
    local ped_hash = util.joaat('mp_m_freemode_01')
    STREAMING.REQUEST_MODEL(phantom_hash); STREAMING.REQUEST_MODEL(ped_hash)
    while not STREAMING.HAS_MODEL_LOADED(phantom_hash) and not STREAMING.HAS_MODEL_LOADED(ped_hash) do
        util.yield()
    end
    for i = 1, quantity do
        local phantom, driver = spawn_trolly_vehicle(pid, phantom_hash, ped_hash)
        addBlipForEntity(phantom, 646, 4)
        ENTITY.SET_ENTITY_INVINCIBLE(phantom, phantom_godmode)
        ENTITY.SET_ENTITY_VISIBLE(driver, false, 0)
        util.yield(150)
    end
end)

addict.toggle(trolly_vehicles, "Invincible", {"invincphantom"}, "", function(on)
    phantom_godmode = on
end, false)

addict.action(trolly_vehicles, "Delete Phantom Wedges", {"deletephantom"}, "", function()
    delete_entities_by_model("Phantom2")
end)

-------------------------------------
-- Oppressor Swarm
-------------------------------------

addict.divider(trolly_vehicles, "Oppressor Swarm")

local oppressorModel = "oppressor2"
local oppressorHash = util.joaat(oppressorModel)
local spawnedOppressors = {}
local activeHandlers = {}
local oppCount = 80
local swarmActive = false

local countSlider = addict.slider(trolly_vehicles, "Swarm Count", {"oppcount"}, "How many Oppressors to spawn", 10, 1000, 80, 10, function(value)
    oppCount = value
end)

addict.toggle(trolly_vehicles, "Toggle Swarm", {"oppswarmtoggle"}, "Enable or disable the Oppressor swarm", function(on)
    swarmActive = on

    if on then
        local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerPos = ENTITY.GET_ENTITY_COORDS(playerPed)

        STREAMING.REQUEST_MODEL(oppressorHash)
        while not STREAMING.HAS_MODEL_LOADED(oppressorHash) do
            util.yield()
        end

        for i = 1, oppCount do
            local spawnPos = v3.new(
                playerPos.x + math.random(-50, 50),
                playerPos.y + math.random(-50, 50),
                playerPos.z + math.random(10, 40)
            )

            local heading = math.random(0, 360)
            local veh = VEHICLE.CREATE_VEHICLE(oppressorHash, spawnPos.x, spawnPos.y, spawnPos.z, heading, true, false)

            if ENTITY.DOES_ENTITY_EXIST(veh) then
                table.insert(spawnedOppressors, veh)
                ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 150.0)

                local handler = util.create_tick_handler(function()
                    if not swarmActive or not ENTITY.DOES_ENTITY_EXIST(veh) then return false end

                    local plyPos = ENTITY.GET_ENTITY_COORDS(playerPed)
                    local vehPos = ENTITY.GET_ENTITY_COORDS(veh)

                    local dir = v3.new(plyPos.x - vehPos.x, plyPos.y - vehPos.y, plyPos.z - vehPos.z)
                    dir:normalise()
                    local force = v3.new(dir.x * 30, dir.y * 30, dir.z * 10)

                    ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, force.x, force.y, force.z, true, true, true, true)

                    return true
                end)

                table.insert(activeHandlers, handler)
                util.yield(50)
            end
        end
    else
        delete_entities_by_model("oppressor2")
    end
end)


------------------------------------------------------------------------------------------------------------------------------------------

    no_collision_range = 60

    range_slider = addict.slider(Vehicle_Events, "No Collision Range", {"nocolisionrange"}, "Adjust the distance (in meters) to disable collisions with nearby vehicles", 5, 500, 500, 60, function(value)
            no_collision_range = value
    end)

    addict.toggle_loop(Vehicle_Events, "No Collision Nearby Vehicles", {"nocolisionvehs"}, "", function()
        myVeh = get_player_vehicle(pid,true)
        if myVeh == INVALID_GUID then return end
        myPos = ENTITY.GET_ENTITY_COORDS(myVeh)
        for _, veh in pairs(entities.get_all_vehicles_as_handles()) do
            if veh ~= myVeh and veh ~= INVALID_GUID then
                vehPos = ENTITY.GET_ENTITY_COORDS(veh)
                if v3.distance(myPos, vehPos) < no_collision_range then
                    ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(myVeh, veh, true)
                    ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(veh, myVeh, true)
                end
            end
        end
    end)

    addict.action(Vehicle_Events,"No Collision Fall", {"nocolisionfall"}, "Makes there vehicle fall under map or if flying they can't land",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			ENTITY.SET_ENTITY_COLLISION(vehicle, false, false)
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.toggle(Vehicle_Events, "Stealth Remote Control", {"stealthremote"}, "Enters there vehicle without them knowing and exits the same way. Note: It will disable them using that car until spawned again.", function(on_toggle)
	if on_toggle then
		addict.trigger_commands("tpmyspot")
		addict.trigger_commands("invisibility" .. " On")
        addict.trigger_commands("otr")
		addict.trigger_commands("tpveh" .. players.get_name(pid))
		addict.trigger_commands("rc" .. " On")
	else
        addict.trigger_commands("otr")
		addict.trigger_commands("rc" .. " Off")
		addict.trigger_commands("undoteleport")
		addict.trigger_commands("invisibility" .. " Off")
		end
	end)

local function request_control(entity)
    local timeout = 1000
    local start = util.current_time_millis()
    while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
        util.yield()
        if util.current_time_millis() - start > timeout then
            return false
        end
    end
    return true
end

local function spawn_cargobob_with_pilot(pos)
    local heli_hash = util.joaat("cargobob")
    local ped_hash = util.joaat("s_m_m_pilot_01")

    STREAMING.REQUEST_MODEL(heli_hash)
    STREAMING.REQUEST_MODEL(ped_hash)
    while not STREAMING.HAS_MODEL_LOADED(heli_hash) or not STREAMING.HAS_MODEL_LOADED(ped_hash) do
        util.yield()
    end

    local heli = VEHICLE.CREATE_VEHICLE(heli_hash, pos.x, pos.y, pos.z + 10, 0.0, true, false)
    ENTITY.SET_ENTITY_INVINCIBLE(heli, true)
    VEHICLE.SET_HELI_BLADES_FULL_SPEED(heli)
    VEHICLE.SET_VEHICLE_ENGINE_ON(heli, true, true, false)

    local pilot = PED.CREATE_PED_INSIDE_VEHICLE(heli, 1, ped_hash, -1, true, false)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pilot, true)
    TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pilot, true)

    return heli, pilot
end

local function attach_vehicle_to_heli(veh, heli)
    if not request_control(veh) then
        util.toast("Failed to control vehicle.")
        return false
    end
    if not request_control(heli) then
        util.toast("Failed to control cargobob.")
        return false
    end

    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        veh,
        heli,
        0,
        0.0, -5.5, -1.5,
        0.0, 0.0, 0.0,
        false,
        true,
        false,
        false,
        2,
        true
    )

    return true
end

local function fly_and_drop(heli, pilot, veh)
    local start = ENTITY.GET_ENTITY_COORDS(heli)
    local dest = {
        x = start.x + 5000.0,
        y = start.y,
        z = start.z + 50.0
    }

    TASK.TASK_HELI_MISSION(
        pilot,
        heli,
        0, 0,
        dest.x, dest.y, dest.z,
        4,
        60.0,
        0.0,
        0.0,
        100.0,
        10.0,
        0.0,
        0
    )

    util.toast("Towing vehicle...")

    util.create_thread(function()
        util.yield(75000)
        if ENTITY.IS_ENTITY_ATTACHED(veh) then
            ENTITY.DETACH_ENTITY(veh, true, true)
            util.toast("Dropping vehicle into the ocean.")
            util.yield(3000)
            addict.trigger_commands("superc 4")
            util.yield(100)
            addict.trigger_commands("superc 5")
        end
    end)
end

local function tow_and_drop_player_vehicle(pid)
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if not PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
        util.toast("Player is not in a vehicle.")
        return
    end

    local veh = PED.GET_VEHICLE_PED_IS_IN(ped, false)
    local pos = ENTITY.GET_ENTITY_COORDS(veh)

    local heli, pilot = spawn_cargobob_with_pilot(pos)
    if not heli or not pilot then
        util.toast("Failed to spawn cargobob or pilot.")
        return
    end

    util.yield(1000)

    if attach_vehicle_to_heli(veh, heli) then
        fly_and_drop(heli, pilot, veh)
    else
        util.toast("Could not attach vehicle.")
        ENTITY.DELETE_ENTITY(heli)
        ENTITY.DELETE_ENTITY(pilot)
    end
end
 
    addict.action(Vehicle_Events, "Cargobob Kidnap", {"cargonap"}, "Spawns a cargobob, hooks their vehicle, and drops it.", function()
        tow_and_drop_player_vehicle(pid) 
    end)

    addict.action(Vehicle_Events, 'Cargobob Confiscate', {}, 'Featuring a magnet so you don\'t need to worry about scratches or dents!', function()
        local p_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local target_v = PED.GET_VEHICLE_PED_IS_IN(p_ped, true)
        local c = players.get_position(pid)
        c.z += 10
        if target_v == 0 then 
            util.toast('Player does not have a vehicle')
            return
        end
        local v_hash = util.joaat('cargobob2')
        local p_hash = util.joaat('u_m_y_croupthief_01')
        util.request_model(v_hash, 2000)
        util.request_model(p_hash, 2000)
        local veh = entities.create_vehicle(v_hash, c, ENTITY.GET_ENTITY_HEADING(target_v))
        local pilot = entities.create_ped(28, p_hash, c, 0.0)
        VEHICLE.SET_CARGOBOB_FORCE_DONT_DETACH_VEHICLE(veh, true)
        VEHICLE.SET_HELI_BLADES_FULL_SPEED(veh)
        VEHICLE.CREATE_PICK_UP_ROPE_FOR_CARGOBOB(veh, 1)
        PED.SET_PED_INTO_VEHICLE(pilot, veh, -1)    
        VEHICLE.SET_CARGOBOB_PICKUP_MAGNET_ENSURE_PICKUP_ENTITY_UPRIGHT(target_v, true)
        VEHICLE.SET_CARGOBOB_PICKUP_MAGNET_PULL_STRENGTH(veh, 1000.0)
        VEHICLE.SET_CARGOBOB_PICKUP_MAGNET_FALLOFF(veh, 1000.0)
        entities.request_control(target_v)
        ENTITY.SET_ENTITY_INVINCIBLE(target_v, true)
        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
        VEHICLE.SET_VEHICLE_GRAVITY(target_v, false)
        local v = ENTITY.GET_ENTITY_VELOCITY(target_v)
        ENTITY.SET_ENTITY_VELOCITY(veh, 0, 0, 60.0)
        VEHICLE.ATTACH_VEHICLE_TO_CARGOBOB(veh, target_v, 0, 0.0, 0.0, 5.0)
        ENTITY.SET_ENTITY_ANGULAR_VELOCITY(target_v, 0, 0, 0)
        TASK.TASK_HELI_MISSION(pilot, veh, 0, 0, math.random(1000), math.random(1000), 300, 4, 200.0, 0.0, 0, 100, 1000, 0.0, 16)
        VEHICLE.SET_HELI_TURBULENCE_SCALAR(veh, 0.0)
    end)



    addict.toggle_loop(Vehicle_Events, "Glitch Vehicle V1", {"glitchvehv1"}, "", function()
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(player, false)
        local glitch_hash = util.joaat("p_spinning_anus_s")
        STREAMING.REQUEST_MODEL(glitch_hash)
        while not STREAMING.HAS_MODEL_LOADED(glitch_hash) do
            util.yield()
        end
        if not PED.IS_PED_IN_VEHICLE(player, PED.GET_VEHICLE_PED_IS_IN(player), false) then
            util.toast("Player isn't in a vehicle. :/")
            return
        end
        glitched_object = entities.create_object(glitch_hash, playerpos)
        ENTITY.SET_ENTITY_VISIBLE(glitched_object, false)
        ENTITY.SET_ENTITY_INVINCIBLE(glitched_object, true)
        ENTITY.SET_ENTITY_COLLISION(glitched_object, true, true)
        util.yield(100)
        entities.delete_by_handle(glitched_object)
        util.yield()
    end)
 
	addict.action(Vehicle_Events,"Repair Vehicle", {"fixveh"}, "Repairs player's vehicle", function()
        for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
			VEHICLE.SET_VEHICLE_FIXED(veh)
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

	addict.action(Vehicle_Events,"Repair Vehicle Shell", {"repair"}, "Repairs player's vehicle but don't repair it's engine", function()
        for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
			VEHICLE.SET_VEHICLE_DEFORMATION_FIXED(veh)
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

	addict.action(Vehicle_Events,"Addict Upgrade Vehicle", {"ugveh"}, "Note: Spam it if don't work first time. Upgrades player's vehicle.",function()
		upgrade_vehicle(pid)
		upgrade_vehicle(pid)
        upgrade_vehicle(pid)
        upgrade_vehicle(pid)
		upgrade_vehicle(pid)
        upgrade_vehicle(pid)
        upgrade_vehicle(pid)
		upgrade_vehicle(pid)
        upgrade_vehicle(pid)
        upgrade_vehicle(pid)
    end, nil, nil, COMMANDPERM_FRIENDLY)
    
	addict.action(Vehicle_Events,"GodVeh On", {"invon"}, "Gives invincibility to player's vehicle",function(vehicle)
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
            ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

	addict.action(Vehicle_Events,"GodVeh Off", {"invoff"}, "Removes invincibility from player's vehicle",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
            ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(Vehicle_Events,"Detach Trailer", {"detachtrailer"}, "Detaches attached trailer",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle)
            VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle) 
            VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle) 
            VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle) 
            VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle) 
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Events,"Lock Doors", {"lockveh"}, "Locks the doors",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 4) 
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Events,"Unlock Doors", {"unlockveh"}, "Unlocks the doors",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 1)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Events,"Make Vehicle Drivable", {"engineon"}, "Makes player's vehicle drivable again",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_UNDRIVEABLE(vehicle, false)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	addict.action(Vehicle_Events,"Make Vehicle Undrivable", {"engineoff"}, "Makes player's vehicle undrivable",function()
		local vehicle = get_player_vehicle(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_UNDRIVEABLE(vehicle, true)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.action(Vehicle_Events,"Honk Car", {"honkcar"}, "Honks.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
            VEHICLE.START_VEHICLE_HORN(veh, 200, util.joaat("HELDDOWN"), true)
		end
	end)

    addict.action(Vehicle_Events, "Sound Car Alarm", {"soundalarm"}, "", function()
        for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
            VEHICLE.SET_VEHICLE_ALARM(veh, true)
            VEHICLE.START_VEHICLE_ALARM(veh)
        end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.action(Vehicle_Events, "Phantom Ram", {"phantomram"}, "", function()
        local hash = util.joaat("phantom2")
        local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)
            while not STREAMING.HAS_MODEL_LOADED(hash) do
                util.yield()
            end
            local Coords1 = PlayerCoords.y + 10
            local Coords2 = PlayerCoords.y - 10
            local veh1 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords1, PlayerCoords.z, -180, true, false, true)
            ENTITY.SET_ENTITY_VELOCITY(veh1, 0, -100, 0)
            util.yield(500)
            entities.delete_by_handle(veh1)
        end
    end)

    addict.action(Vehicle_Events, "Lazer Ram", {"lazerram"}, "", function()
        local hash = util.joaat("lazer")
        local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)
            while not STREAMING.HAS_MODEL_LOADED(hash) do
                util.yield()
            end
            local Coords1 = PlayerCoords.y + 10
            local Coords2 = PlayerCoords.y - 10
            local veh1 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords1, PlayerCoords.z, -180, true, false, true)
            ENTITY.SET_ENTITY_VELOCITY(veh1, 0, -100, 0)
            util.yield(500)
            entities.delete_by_handle(veh1)
        end
    end)

    addict.action(Vehicle_Events,"Kamikaze lazer", {"kamikazelazer"}, "", function(on)
        local ped = 2459507570
        STREAMING.REQUEST_MODEL(ped)
        while not STREAMING.HAS_MODEL_LOADED(ped) do
            util.yield(100)
        end
        local lazer = 3013282534
        STREAMING.REQUEST_MODEL(lazer)
        while not STREAMING.HAS_MODEL_LOADED(lazer) do
            util.yield(100)
        end
        local pid = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        local spawn = VEHICLE.CREATE_VEHICLE(lazer, pid.x, pid.y, pid.z+20, 0, true, false, false)
        local pedspawn = PED.CREATE_PED(26, ped, pid.x, pid.y, pid.z+20, 0, true, false)
        PED.SET_PED_INTO_VEHICLE(pedspawn, spawn, -1)
        VEHICLE.SET_VEHICLE_ENGINE_HEALTH(spawn, -20)
        ENTITY.SET_ENTITY_ROTATION(spawn, -90.0, 0.0, 0.0, 1, true)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(spawn, 100)
        util.yield(3000)
    end)

    addict.action(Vehicle_Events, "Fuck Up Car", {"fupcar"}, "", function(v)
        addict.trigger_commands("spin" .. players.get_name(pid))
        util.yield(100)
        addict.trigger_commands("spin" .. players.get_name(pid))
        addict.trigger_commands("poptyres" .. players.get_name(pid))
        addict.trigger_commands("lock" .. players.get_name(pid))
        addict.trigger_commands("detachwheel" .. players.get_name(pid))
        addict.trigger_commands("removedoors" .. players.get_name(pid))
    end)

    addict.action(Vehicle_Events, "Attach Sirens Under Vehicle", {"siren"}, "Attaches annoying cop car under there car with the sirens on. 48 spawned max before stands throttlers delete them.", function()
        if not PED.IS_PED_IN_ANY_VEHICLE(pid) then
            local player_vehicle = get_player_vehicle(pid, true)
            local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        hash = util.joaat("policeold2")
        ped_hash = util.joaat("mp_m_freemode_01")
        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)
            while not STREAMING.HAS_MODEL_LOADED(hash) do
                util.yield()
            end
            local aab = 
            {
                x = -5784.258301,
                y = -8289.385742,
                z = -136.411270
            }
            ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
            ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, false)
            siren_vehicle = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true), CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
            while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
                STREAMING.REQUEST_MODEL(ped_hash)
                util.yield()
            end
            ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ENTITY.SET_ENTITY_INVINCIBLE(siren_vehicle, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(siren_vehicle, ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
                true, true, false, 0, false)
            coords_ped = v3()
            coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
            coords_ped.x = coords_ped.x + math.random(-20, 20)
            coords_ped.y = coords_ped.y + math.random(-20, 20)
            coords_ped.z = coords_ped.z
            ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
            PED.SET_PED_INTO_VEHICLE(ped_to_drive, siren_vehicle, -1)
            VEHICLE.SET_VEHICLE_ENGINE_ON(siren_vehicle, true, true, false)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(siren_vehicle, true, true)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(siren_ped, true, true)
            PED.SET_PED_INTO_VEHICLE(siren_ped, siren_vehicle, -1)
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(siren_vehicle)
            ENTITY.SET_ENTITY_INVINCIBLE(siren_vehicle, true)
            VEHICLE.SET_VEHICLE_SIREN(siren_vehicle, true)
            ENTITY.SET_ENTITY_VISIBLE(siren_vehicle, false, 0)
            ENTITY.SET_ENTITY_VISIBLE(siren_ped, false, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(siren_vehicle, player_vehicle, 0, 0, 0, -3, 0, 0, 0, 0, false, true, false, 0, true)
            VEHICLE.SET_VEHICLE_WILL_FORCE_OTHER_VEHICLES_TO_STOP(siren_vehicle, true)
            ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(siren_vehicle, player_vehicle, true)
            VEHICLE.SET_VEHICLE_SIREN(siren_vehicle, true)
            util.yield(1)
            entities.delete_by_handle(ped_to_kidnap)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
        else
            util.toast("Player is not in a vehicle. :/")
            end
        end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)


    givevehicle = addict.list(Vehicle_Events, "Give Player A Vehicle", {}, "", function(); end)

    addict.action(givevehicle, "Give A UFO", {"giveufo"}, "", function()
        addict.trigger_commands("stopspectating")
        addict.trigger_commands("spectate" .. players.get_name(pid))
        addict.trigger_commands("giveotr" .. players.get_name(pid))
        util.yield(2000)
        local vehicleHash = util.joaat("hydra")
        request_model(vehicleHash)
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        jet = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
        VEHICLE.SET_VEHICLE_ENGINE_ON(jet, true, true, true)
        ENTITY.SET_ENTITY_INVINCIBLE(jet, true)
        VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(jet, 0.0)
        NETWORK.SET_ENTITY_LOCALLY_INVISIBLE(jet, true)
        ENTITY.SET_ENTITY_VISIBLE(jet, true, 0)
------------Ufo Object------------------------------------------------------------------------------------------------------------------------------------------------------------
        local id = get_closest_vehicle_ufo(entity)
        local playerpos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        playerpos.z = playerpos.z + 3
        local ufo_object = util.joaat("sum_prop_dufocore_01a")
        STREAMING.REQUEST_MODEL(ufo_object)
        while not STREAMING.HAS_MODEL_LOADED(ufo_object) do
            util.yield()
        end
        local object1 = entities.create_object(ufo_object, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, jet, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(object1, jet)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(jet, object1, 0, 0, 3, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, jet, 0, 0, 3, 0, 0, 0, 0, 0, false, true, false, 0, true)
        --NETWORK.SET_ENTITY_LOCALLY_INVISIBLE(id, true)
        util.yield(500)
        addict.trigger_commands("stopspectating")
    end, nil, nil, COMMANDPERM_FRIENDLY)

        addict.action(givevehicle, "Give A MK2", {"givemk2"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " oppressor2")
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(givevehicle, "Give A Deluxo", {"givedeluxo"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " deluxo")
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(givevehicle, "Give A Festival Bus", {"givefestivalbus"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " pbus2")
    end, nil, nil, COMMANDPERM_FRIENDLY)
    
    addict.action(givevehicle, "Give A Forklift", {"giveforklift"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " forklift")
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(givevehicle, "Give A Khanjali", {"givekhanjali"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " khanjali")
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(givevehicle, "Give A Future Shock Sasquatch", {"givesasquatch"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " monster4")
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(givevehicle, "Give A Future Shock Scarab", {"givescarab"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " scarab2")
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(givevehicle, "Give Aqua Blazer", {"giveblazer"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " blazer5")
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(givevehicle, "Give A Lazer", {"givelazer"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " lazer")
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(givevehicle, "Give A Hydra", {"givehydra"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " hydra")
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(givevehicle, "Give A Starling", {"givestarling"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " starling")
    end, nil, nil, COMMANDPERM_FRIENDLY)

    addict.action(givevehicle, "Give A Pyro", {"givepyro"}, "", function()
        addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " pyro")
    end, nil, nil, COMMANDPERM_FRIENDLY)

	addict.action(givevehicle,"Spawn them a vehicle", {}, "Spawns a vehicle on target player", function()
		addict.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " ")
    end, nil, nil, COMMANDPERM_FRIENDLY)

---------------------------------------------------------------------------------------------------------------------------------------------
--[[
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─██████████████─████████████████───██████████████─██████─────────██████─────────██████████─██████──────────██████─██████████████─
─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░██─────────██░░██─────────██░░░░░░██─██░░██████████──██░░██─██░░░░░░░░░░██─
─██████░░██████─██░░████████░░██───██░░██████░░██─██░░██─────────██░░██─────────████░░████─██░░░░░░░░░░██──██░░██─██░░██████████─
─────██░░██─────██░░██────██░░██───██░░██──██░░██─██░░██─────────██░░██───────────██░░██───██░░██████░░██──██░░██─██░░██─────────
─────██░░██─────██░░████████░░██───██░░██──██░░██─██░░██─────────██░░██───────────██░░██───██░░██──██░░██──██░░██─██░░██─────────
─────██░░██─────██░░░░░░░░░░░░██───██░░██──██░░██─██░░██─────────██░░██───────────██░░██───██░░██──██░░██──██░░██─██░░██──██████─
─────██░░██─────██░░██████░░████───██░░██──██░░██─██░░██─────────██░░██───────────██░░██───██░░██──██░░██──██░░██─██░░██──██░░██─
─────██░░██─────██░░██──██░░██─────██░░██──██░░██─██░░██─────────██░░██───────────██░░██───██░░██──██░░██████░░██─██░░██──██░░██─
─────██░░██─────██░░██──██░░██████─██░░██████░░██─██░░██████████─██░░██████████─████░░████─██░░██──██░░░░░░░░░░██─██░░██████░░██─
─────██░░██─────██░░██──██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░██─██░░██──██████████░░██─██░░░░░░░░░░██─
─────██████─────██████──██████████─██████████████─██████████████─██████████████─██████████─██████──────────██████─██████████████─
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
]]

    addict.divider(Trolling, "Trolling")
 
    addict.toggle_loop(Trolling, "Push player up", {"pushup"}, "Works best if the player is walking on flat ground.", function()
        local vehicle = 4174679674 -- 1518533038
        STREAMING.REQUEST_MODEL(vehicle)
        while not STREAMING.HAS_MODEL_LOADED(vehicle) do
            util.yield(100)
        end
        local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        local spawn = VEHICLE.CREATE_VEHICLE(vehicle, coords.x, coords.y, coords.z-3, 0, true, false, false)
        ENTITY.SET_ENTITY_VISIBLE(spawn, false, false)
        ENTITY.SET_ENTITY_ROTATION(spawn, 90.0, 0.0, 0.0, 1, true)
        util.yield(100)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(spawn, 200)
        util.yield(2000)
        util.yield(2000)
        request_control_of_entity(spawn)
        addict.trigger_commands("superc 4")
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(vehicle)
    end)
    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    tpoptions = addict.list(Trolling, "TP Options", {}, "", function(); end)

    griefingtpp = addict.list(tpoptions, "TP Player", {}, "", function(); end)

        addict.action(griefingtpp, "Teleport To Them", {"goingtheere"}, "", function()
            addict.trigger_commands("tp" .. players.get_name(pid))
        end, nil, nil, COMMANDPERM_FRIENDLY)

        addict.action(griefingtpp, "Teleport To Me", {"cometome"}, "", function()
            addict.trigger_commands("summon" .. players.get_name(pid))
        end, nil, nil, COMMANDPERM_FRIENDLY)

        addict.action(griefingtpp, "TP Player To Eclipse Towers", {"tpeclipse"}, "", function()
            addict.trigger_commands("apt1" .. players.get_name(pid))
        end, nil, nil, COMMANDPERM_FRIENDLY)

        addict.action(griefingtpp, "TP Player To MazeBank", {"tpmazebank"}, "", function()
            addict.trigger_commands("apt90" .. players.get_name(pid))
        end, nil, nil, COMMANDPERM_FRIENDLY)
                        
        griefingtp = addict.list(tpoptions, "TP All Players", {}, "", function(); end)

    addict.action(griefingtp, "TP All Players to me", {"tpallplayers"}, "Teleports all players to you.", function()
        addict.trigger_commands("say " .. " Get on the bike :)")
        addict.trigger_commands("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " manchez")
        util.toast("Give them a second to get on...")
        excludeselected = true
        addict.trigger_commands("tpplayers")
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.action(griefingtp, "TP All Players Near me", {"tpallnear"}, "Teleports all players near you.", function()
        addict.trigger_commands("aptmeall")
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    
    local getPlayerPed = PLAYER.GET_PLAYER_PED
    local getEntityCoords = ENTITY.GET_ENTITY_COORDS

    local function tpTableToPlayer(tbl, pid)
        if NETWORK.NETWORK_IS_PLAYER_CONNECTED(pid) then
            local c = getEntityCoords(getPlayerPed(pid))
            for _, v in pairs(tbl) do
                if (not PED.IS_PED_A_PLAYER(v)) then
                    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(v, c.x, c.y, c.z, false, false, false)
                end
            end
        end
    end

    function TpAllPeds(player)
        local pedHandles = entities.get_all_peds_as_handles()
        tpTableToPlayer(pedHandles, player)
    end
    function TpAllVehs(player)
        local vehHandles = entities.get_all_vehicles_as_handles()
        tpTableToPlayer(vehHandles, player)
    end
    function TpAllObjects(player)
        local objHandles = entities.get_all_objects_as_handles()
        tpTableToPlayer(objHandles, player)
    end
    function TpAllPickups(player)
        local pickupHandles = entities.get_all_pickups_as_handles()
        tpTableToPlayer(pickupHandles, player)
    end

    local pteleportEntities = addict.list(tpoptions, "Teleport Entities to Player", {}, "")

    addict.action(pteleportEntities, "Teleport ALL Entities to Player", {"tpallentities"}, "WARNING: DO NOT SPECTATE! & Toggle Panic Mode Or You Most Likly Crash.", function()
        addict.trigger_commands("tppeds" .. players.get_name(pid))
        util.yield(100)
        addict.trigger_commands("tpvehs" .. players.get_name(pid))
        util.yield(100)
        addict.trigger_commands("tpobjs" .. players.get_name(pid))
        util.yield(100)
        addict.trigger_commands("tppickups" .. players.get_name(pid))
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.toggle_loop(pteleportEntities, "Teleport ALL Entities to Player Loop", {"tpallentitiesloop"}, "WARNING: DO NOT SPECTATE! & Toggle Panic Mode Or You Most Likly Crash.", function(on_toggle)
        if on_toggle then
            addict.trigger_commands("tppeds" .. players.get_name(pid))
            util.yield(100)
            addict.trigger_commands("tpvehs" .. players.get_name(pid))
            util.yield(100)
            addict.trigger_commands("tpobjs" .. players.get_name(pid))
            util.yield(100)
            addict.trigger_commands("tppickups" .. players.get_name(pid))
        else
            addict.trigger_commands("tppeds" .. players.get_name(pid))
            util.yield(100)
            addict.trigger_commands("tpvehs" .. players.get_name(pid))
            util.yield(100)
            addict.trigger_commands("tpobjs" .. players.get_name(pid))
            util.yield(100)
            addict.trigger_commands("tppickups" .. players.get_name(pid))
        end
    end)

    addict.action(pteleportEntities, "TP Peds on Player", {"tppeds"}, "", function ()
        TpAllPeds(pid)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.toggle_loop(pteleportEntities, "TP Peds on Player", {"toggletppeds"}, "", function (on_toggle)
            if on_toggle then
                TpAllPeds(pid)
            else
                TpAllPeds(pid)
            end
    end)

    addict.action(pteleportEntities, "TP All Vehicles on Player", {"tpvehs"}, "", function ()
        TpAllVehs(pid)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.toggle_loop(pteleportEntities, "TP All Vehicles on Player", {"toggletppedstpvehs"}, "", function (on_toggle)
            if on_toggle then
                TpAllVehs(pid)
            else
                TpAllVehs(pid)
            end
    end)

    addict.action(pteleportEntities, "TP All Objects on Player", {"tpobjs"}, "", function ()
        TpAllObjects(pid)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.toggle_loop(pteleportEntities, "TP All Objects on Player", {"toggletpobjs"}, "", function (on_toggle)
            if on_toggle then
                TpAllObjects(pid)
            else
                TpAllObjects(pid)
            end
    end)

    addict.action(pteleportEntities, "TP All Pickups on Player", {"tppickups"}, "", function ()
        TpAllPickups(pid)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.toggle_loop(pteleportEntities, "TP All Pickups on Player", {"toggletppickups"}, "", function (on_toggle)
            if on_toggle then
                TpAllPickups(pid)
            else
                TpAllPickups(pid)
            end
    end)

addict.toggle_loop(tpoptions, "TP On Ped Loop", {"tploopon"}, "", function(on_toggle)
    if on_toggle then
    addict.trigger_commands("tp" .. players.get_name(pid))
    else
    addict.trigger_commands("tp" .. players.get_name(pid))
    end
    end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        attachoptions = addict.list(Trolling, "Attach Options", {}, "", function(); end)

    local windmilling = addict.list(attachoptions, "Spam Windmills", {}, "")

    addict.action(windmilling, "Spam Windmills", {"togglemills"}, "", function()
        local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
        local Object_pizza2 = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        local Object_pizza2 = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        local Object_pizza2 = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        local Object_pizza2 = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        for i = 0, 100 do 
            local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true);
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            util.yield(10)
            entities.delete_by_handle(Object_pizza2)
            entities.delete_by_handle(Object_pizza2)
            entities.delete_by_handle(Object_pizza2)
            entities.delete_by_handle(Object_pizza2)
            return
        end
    end)

    addict.toggle_loop(windmilling, "Attach Windmills", {"attachmills"}, "", function()
        if pid ~= players.user() then
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3
        local windmill = util.joaat("prop_windmill_01")
        STREAMING.REQUEST_MODEL(windmill)
        while not STREAMING.HAS_MODEL_LOADED(windmill) do
            util.yield()
        end
        local vehicle1 = entities.create_object(windmill, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle2 = entities.create_object(windmill, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle3 = entities.create_object(windmill, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle4 = entities.create_object(windmill, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
        util.yield(10)
        end
    end)

    addict.divider(windmilling, "__________________bruh__________________")

    addict.action(windmilling, "Clear Windmill's", {"clearwindmills"}, "", function()
        local count = 0
        for k,ent in pairs(entities.get_all_objects_as_handles()) do
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
            entities.delete_by_handle(ent)
            count = count + 1
            util.yield()
        end
    end)

------------------------------------------------------------------------------------------------------------------------------------------------

heli_attaches = addict.list(attachoptions, "Heli Attachment Fun", {}, "", function(); end)


local heliModel = util.joaat("buzzard")
local pedModel = util.joaat("s_m_y_pilot_01")
local vehicleModelName = "adder"

local heli, ped = nil, nil
local attachedVeh = nil
local tickHandler = nil
local attachHeliToPlayer = false
local heliAttachHeight = 1

local function request_model(model)
    STREAMING.REQUEST_MODEL(model)
    while not STREAMING.HAS_MODEL_LOADED(model) do
        util.yield()
    end
end

local function spawnHeliWithPed(pos)
    request_model(heliModel)
    request_model(pedModel)

    local heli = entities.create_vehicle(heliModel, pos, 0)
    local ped = entities.create_ped(2, pedModel, pos, 0)

    ENTITY.SET_ENTITY_VISIBLE(heli, false)
    ENTITY.SET_ENTITY_VISIBLE(ped, false)
    ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
    PED.SET_PED_INTO_VEHICLE(ped, heli, -1)
    
    ENTITY.SET_ENTITY_INVINCIBLE(heli, true)
    VEHICLE.SET_DISABLE_VEHICLE_PETROL_TANK_DAMAGE(heli, true)
    ENTITY.SET_ENTITY_PROOFS(heli, false, false, false, false, true, true, true, false)

    VEHICLE.SET_HELI_BLADES_FULL_SPEED(heli)
    VEHICLE.SET_HELI_BLADES_SPEED(heli, 10.0)  -- Spin faster
    VEHICLE.SET_VEHICLE_ENGINE_ON(heli, true, true, true)
    VEHICLE.SET_VEHICLE_FORWARD_SPEED(heli, 10.0)

    util.yield(1)

    return heli, ped
end

local function attachVehicleToRotor(heli)
    local boneIndex = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(heli, "rotor_main")
    if boneIndex == -1 then
        util.toast("Rotor bone not found.")
        return nil
    end

    local coords = ENTITY.GET_ENTITY_COORDS(heli, true)
    local vehicleHash = util.joaat(vehicleModelName)
    request_model(vehicleHash)

    local vehicle = entities.create_vehicle(vehicleHash, v3(coords.x, coords.y, coords.z + 2.0), 0)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        vehicle, heli, boneIndex,
        0.0, 0.0, 0.5,   -- offset
        0.0, 0.0, 0.0,   -- rotation
        false, false, false, false, 2, true
    )

    return vehicle
end

local function cleanup()
    if tickHandler and type(tickHandler) == "table" and tickHandler.remove then
        tickHandler:remove()
        tickHandler = nil
    end

    for _, ent in ipairs({heli, ped, attachedVeh}) do
        if ent and ENTITY.DOES_ENTITY_EXIST(ent) then
            entities.delete(ent)
        end
    end

    heli, ped, attachedVeh = nil, nil, nil
end

local function attachHeliToPlayerPed()
    if not heli or not ENTITY.DOES_ENTITY_EXIST(heli) then
        return
    end
    local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        heli, playerPed, 0,
        0.0, 0.0, heliAttachHeight,
        0.0, 0.0, 0.0,
        false, false, false, false, 2, true
    )
    util.toast("Helicopter attached to player at height: " .. heliAttachHeight)
end

local function toggleHeliLink(enabled)
    if enabled then
        local pos = players.get_position(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        if not pos then
            util.toast("Failed to get player position.")
            return
        end

        heli, ped = spawnHeliWithPed(v3(pos.x + 5, pos.y, pos.z + 1))
        if not heli then
            util.toast("Helicopter spawn failed.")
            cleanup()
            return
        end

        util.yield(10)

        attachedVeh = attachVehicleToRotor(heli)

        if attachHeliToPlayer then
            attachHeliToPlayerPed()
        end

        tickHandler = util.create_tick_handler(function()
            if ENTITY.DOES_ENTITY_EXIST(heli) and not VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(heli) then
                VEHICLE.SET_HELI_BLADES_FULL_SPEED(heli)
                VEHICLE.SET_HELI_BLADES_SPEED(heli, 10.0)
                VEHICLE.SET_VEHICLE_ENGINE_ON(heli, true, true, true)
            end
            return true
        end)

        util.create_tick_handler(function()
            if not heli or not ENTITY.DOES_ENTITY_EXIST(heli) then return false end

            local heliPos = ENTITY.GET_ENTITY_COORDS(heli, true)
            local nearbyPeds = entities.get_all_peds_as_handles()

            for _, ped in ipairs(nearbyPeds) do
                if ped ~= players.user_ped() and not ENTITY.IS_ENTITY_DEAD(ped) and not PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                    local pedPos = ENTITY.GET_ENTITY_COORDS(ped, true)
                    local dist = SYSTEM.VDIST(heliPos.x, heliPos.y, heliPos.z + 1.0, pedPos.x, pedPos.y, pedPos.z)

                    if dist < 5.0 then
                        if not PED.IS_PED_RAGDOLL(ped) then
                            PED.SET_PED_TO_RAGDOLL(ped, 500, 1000, 0, false, false, false)
                        end
                        PED.APPLY_DAMAGE_TO_PED(ped, 1000, false)
                    end
                end
            end

            return true
        end)

    else
        cleanup()
    end
end

addict.text_input(heli_attaches, "Vehicle to Attach", {"heli_attach_vehicle"}, "Enter vehicle model to attach to the rotor. e.g. 'Kosatka'.", function(value)
    vehicleModelName = value:lower()
end, vehicleModelName)

addict.slider(heli_attaches, "Helicopter Attach Height", {"heli_attach_height"}, "Set vertical offset height for the helicopter attached to player.", -100, 100, 1, heliAttachHeight, function(value)
    heliAttachHeight = value
end)

addict.toggle(heli_attaches, "Attach Helicopter to Player", {}, "Attach the whole helicopter (with ped) to your player. Note: Toggle this before enabling Linked Helicopter.", function(state)
    attachHeliToPlayer = state
end, false)

addict.toggle(heli_attaches, "Spawn Helicopter", {}, "Spawn 1 helicopter with ped and attach custom vehicle to rotor.", toggleHeliLink)


addict.divider(heli_attaches, "__________________bruh__________________")

------------------------------------------------------------------------------------------------------------------------------------------------

local heliModel = util.joaat("buzzard")
local pilotModel = util.joaat("s_m_m_pilot_01")
local attachHeight = 1.5
local attachedParts = {}
local heli_handle = nil
local pilot = nil

addict.slider(heli_attaches, "Blade Height", {"bladeheight"}, "Adjust height of the helicopter blade above player or scrap.", 1, 100, math.floor(attachHeight * 10), 1, function(val)
    attachHeight = val / 10
end)

local function cleanup_blade_attack()
    if heli_handle and ENTITY.DOES_ENTITY_EXIST(heli_handle) then
        entities.delete_by_handle(heli_handle)
        heli_handle = nil
    end
    if pilot and ENTITY.DOES_ENTITY_EXIST(pilot) then
        entities.delete_by_handle(pilot)
        pilot = nil
    end
    for _, obj in ipairs(attachedParts) do
        if ENTITY.DOES_ENTITY_EXIST(obj) then
            entities.delete_by_handle(obj)
        end
    end
    attachedParts = {}
end

local function attach_scrap_and_blade()
    local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerPos = ENTITY.GET_ENTITY_COORDS(playerPed, true)
    for _, obj in ipairs(entities.get_all_objects_as_handles()) do
        if ENTITY.IS_ENTITY_ATTACHED(obj) == false and ENTITY.IS_ENTITY_VISIBLE(obj) and ENTITY.IS_ENTITY_ON_SCREEN(obj) then
            local objPos = ENTITY.GET_ENTITY_COORDS(obj, true)
            local dist = SYSTEM.VDIST(playerPos.x, playerPos.y, playerPos.z, objPos.x, objPos.y, objPos.z)
            if dist < 25.0 then
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(obj, true, true)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(obj, playerPed, 0, math.random(-2,2), math.random(-2,2), math.random(0,2), 0, 0, 0, false, false, true, false, 2, true)
                table.insert(attachedParts, obj)
                if #attachedParts >= 3 then break end
            end
        end
    end
    STREAMING.REQUEST_MODEL(heliModel)
    STREAMING.REQUEST_MODEL(pilotModel)
    while not STREAMING.HAS_MODEL_LOADED(heliModel) or not STREAMING.HAS_MODEL_LOADED(pilotModel) do
        util.yield()
    end
    local spawnPos = ENTITY.GET_ENTITY_COORDS(playerPed, true)
    spawnPos.z = spawnPos.z + 3
    heli_handle = entities.create_vehicle(heliModel, spawnPos, 0)

    if heli_handle and ENTITY.DOES_ENTITY_EXIST(heli_handle) then
        ENTITY.SET_ENTITY_INVINCIBLE(heli_handle, true)
        pilot = entities.create_ped(26, pilotModel, spawnPos, 0)
        PED.SET_PED_INTO_VEHICLE(pilot, heli_handle, -1)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pilot, true)
        TASK.TASK_HELI_MISSION(pilot, heli_handle, 0, playerPed, 0.0, 0.0, 0.0, 4, 30.0, 10.0, -1.0, 0, 0, 0, 0)
        local attachTarget = attachedParts[1] or playerPed
        ENTITY.ATTACH_ENTITY_TO_ENTITY(heli_handle, attachTarget, 0, 0, 0, attachHeight, 180, 0, 0, false, false, true, false, 2, true)
    end
end

addict.toggle(heli_attaches, "Heli Chop", {"helichop"}, "Attaches nearby scrap, then mounts a heli to attack with blades.", function(val)
    if val then
        attach_scrap_and_blade()
    else
        cleanup_blade_attack()
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------

addict.toggle_loop(attachoptions,"Attach A Umbrella", {}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local candyattach = util.joaat("p_amb_brolly_01")
    STREAMING.REQUEST_MODEL(candyattach)
    while not STREAMING.HAS_MODEL_LOADED(candyattach) do
        util.yield()
    end
    local cane1 = entities.create_object(candyattach, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    ENTITY.ATTACH_ENTITY_TO_ENTITY(cane1, id, playerpos, 0.2, 0.2, 0.5, 0, 0, 0, -180, 0, true, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(cane1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(cane1)
    util.yield(100)
end)

    addict.toggle_loop(attachoptions, "Attach Candy Cane", {"attachcandycane"}, "", function()
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3
        local candyattach = util.joaat("w_me_candy_xm3")
        STREAMING.REQUEST_MODEL(candyattach)
        while not STREAMING.HAS_MODEL_LOADED(candyattach) do
            util.yield()
        end
        local cane1 = entities.create_object(candyattach, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(cane1, id, playerpos, 0, 0, 1, 0, 0, 0, -180, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(cane1, true, 0)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(cane1)
        util.yield(100)
    end)
    
    addict.toggle_loop(attachoptions, "Attach A Ramp", {"attachramp"}, "Works best on vehicles", function()
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3
        local rampattach = util.joaat("lts_prop_lts_ramp_03")
        STREAMING.REQUEST_MODEL(rampattach)
        while not STREAMING.HAS_MODEL_LOADED(rampattach) do
            util.yield()
        end
        local vehicle1 = entities.create_object(rampattach, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle2 = entities.create_object(rampattach, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle3 = entities.create_object(rampattach, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle4 = entities.create_object(rampattach, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
        util.yield(100)
    end)

    
    addict.toggle(attachoptions, "Attach To Player", {"attachto"}, "", function(on)
        if PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) == players.user_ped() then 
            return
        end
        if on then
            ENTITY.ATTACH_ENTITY_TO_ENTITY(players.user_ped(), PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0, 0.0, -0.20, 2.00, 1.0, 1.0,1, true, true, true, false, 0, true)
        else
            ENTITY.DETACH_ENTITY(players.user_ped(), false, false)
            end
        end)

        addict.toggle_loop(attachoptions, "Attach All Vehicles", {"attachallvehs"}, "", function(on_toggle)
                local tar = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                vehicles = entities.get_all_vehicles_as_handles()
                for i, ent in pairs(vehicles) do
                    if not is_ped_player(VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1)) then
                        ENTITY.ATTACH_ENTITY_TO_ENTITY(ent, tar, 0, 0.0, -0.20, 2.00, 1.0, 1.0,1, true, true, true, false, 0, true)
                    end
                end
            end)

        -- Attach all nearby objects to target player
        addict.toggle_loop(attachoptions, "Attach All Objects", {"attachallobjects"}, "Attaches all objects nearby to the selected player.", function()
            local tar = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            if not ENTITY.DOES_ENTITY_EXIST(tar) then return end

            local objects = entities.get_all_objects_as_handles()
            for _, obj in ipairs(objects) do
                if ENTITY.DOES_ENTITY_EXIST(obj) and obj ~= tar then
                    ENTITY.ATTACH_ENTITY_TO_ENTITY(
                        obj, tar, 0,
                        0.0, -0.20, 2.00,   -- offset (X, Y, Z)
                        0.0, 0.0, 0.0,      -- rotation (pitch, roll, yaw)
                        true, true, true,   -- collision, soft pinning, etc.
                        false, 0, true
                    )
                end
            end

            util.yield(500) -- small delay for stability
        end)


        local chaos_enabled = false

        local function chaos_valid(h)
            return h and h ~= 0 and h ~= -1 and h ~= entities.INVALID_GUID
        end

        addict.toggle_loop(attachoptions, "Attach Nearby Peds", {}, "Attaches every ped near you to your player.", function()
            chaos_enabled = true
            local user_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            if not chaos_valid(user_ped) then
                util.yield(100)
                return
            end

            local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(user_ped, true)
            local rot = ENTITY.GET_ENTITY_ROTATION(user_ped, 2)

            local peds = {}
            pcall(function() peds = entities.get_all_peds_as_handles() or {} end)

            for _, ped in ipairs(peds) do
                if chaos_valid(ped) and ped ~= user_ped then
                    -- Move ped to player position
                    ENTITY.SET_ENTITY_COORDS(ped, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, true, false, false, true)
                    -- Attach ped to player
                    ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, user_ped, -1, 0, 0, 0, rot.x, rot.y, rot.z, false, false, false, false, 0, false)
                end
            end

            util.yield(500) -- slow down the loop so it doesn’t overload
        end, function()
            chaos_enabled = false

            -- Detach all peds when toggle is turned off
            local peds = {}
            pcall(function() peds = entities.get_all_peds_as_handles() or {} end)

            for _, ped in ipairs(peds) do
                if chaos_valid(ped) and ped ~= PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) then
                    ENTITY.DETACH_ENTITY(ped, false, false)
                end
            end
        end)



-- Attach all nearby entities
addict.toggle_loop(attachoptions, "Attach All Nearby Entities", {"attachallnearby"}, "Attaches all nearby peds, vehicles, and objects to the target player.", function()
    local tar = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

    -- Attach all nearby peds (excluding players)
    for _, ped in ipairs(entities.get_all_peds_as_handles()) do
        if ped ~= tar and not PED.IS_PED_A_PLAYER(ped) then
            ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, tar, 0, 0.0, -0.2, 2.0, 0.0, 0.0, 0.0,
                true, true, true, false, 0, true)
        end
    end

    -- Attach all nearby vehicles (excluding ones driven by players)
    for _, veh in ipairs(entities.get_all_vehicles_as_handles()) do
        local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1)
        if veh ~= tar and (not PED.IS_PED_A_PLAYER(driver)) then
            ENTITY.ATTACH_ENTITY_TO_ENTITY(veh, tar, 0, 0.0, -0.2, 2.0, 0.0, 0.0, 0.0,
                true, true, true, false, 0, true)
        end
    end

    -- Attach all nearby objects
    for _, obj in ipairs(entities.get_all_objects_as_handles()) do
        ENTITY.ATTACH_ENTITY_TO_ENTITY(obj, tar, 0, 0.0, -0.2, 2.0, 0.0, 0.0, 0.0,
            true, true, true, false, 0, true)
    end

    util.yield(500) -- prevents overloading
end)

-- Detach all nearby entities
addict.toggle_loop(attachoptions, "Detach All Nearby Entities", {"detachallnearby"}, "Detaches all nearby peds, vehicles, and objects from the player.", function()
    local tar = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

    -- Detach all nearby peds (excluding players)
    for _, ped in ipairs(entities.get_all_peds_as_handles()) do
        if ped ~= tar and not PED.IS_PED_A_PLAYER(ped) then
            ENTITY.DETACH_ENTITY(ped, false, false)
        end
    end

    -- Detach all nearby vehicles (excluding ones driven by players)
    for _, veh in ipairs(entities.get_all_vehicles_as_handles()) do
        local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1)
        if veh ~= tar and (not PED.IS_PED_A_PLAYER(driver)) then
            ENTITY.DETACH_ENTITY(veh, false, false)
        end
    end

    -- Detach all nearby objects
    for _, obj in ipairs(entities.get_all_objects_as_handles()) do
        ENTITY.DETACH_ENTITY(obj, false, false)
    end

    util.yield(500)
end)

    

local usingPiggyback = false
local usingRape = false

addict.toggle(attachoptions, "Rape Player", {"rape"}, "Rapes a player.", function(on)
    usingRape = on

    if pid == players.user() then return end

    if usingRape then
        usingPiggyback = false

        local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local myPed = players.user_ped()

        local animDict = "rcmpaparazzo_2"
        local animName = "shag_loop_a"
        STREAMING.REQUEST_ANIM_DICT(animDict)
        while not STREAMING.HAS_ANIM_DICT_LOADED(animDict) do
            util.yield_once()
        end

        TASK.TASK_PLAY_ANIM(myPed, animDict, animName, 8.0, -8.0, -1, 1, 0.0, false, false, false)

        ENTITY.ATTACH_ENTITY_TO_ENTITY(
            myPed,               -- entity to attach
            targetPed,           -- target to attach to
            0,                   -- bone index (0 = root)
            0.0, -0.3, 0.0,      -- x, y, z offset
            0.0, 0.0, 0.0,       -- pitch, roll, yaw (rotation)
            false, true, false, false, 0, true
        )

        while usingRape and is_player_active(pid, false, true) and not util.is_session_transition_active() do
            util.yield_once()
        end

        usingRape = false
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(myPed)
        ENTITY.DETACH_ENTITY(myPed, true, false)
    end
end)

    addict.action(attachoptions, "Clear Peds", {"clearpeds"}, "", function()
        local count = 0
        for k,ent in pairs(entities.get_all_peds_as_handles()) do
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
            entities.delete_by_handle(ent)
            count = count + 1
            util.yield()
        end
    end)

    addict.action(attachoptions, "Clear Objects", {"clearobjects"}, "", function()
        local count = 0
        for k,ent in pairs(entities.get_all_objects_as_handles()) do
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
            entities.delete_by_handle(ent)
            count = count + 1
            util.yield()
        end
    end)

    addict.action(attachoptions, "Clear Vehicles", {"clearvehicles"}, "", function()
        local count = 0
        for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
            local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1, false)
            if not PED.IS_PED_A_PLAYER(PedInSeat) then
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
                entities.delete_by_handle(ent)
                count = count + 1
                util.yield()
            end
        end
    end)

    addict.action(attachoptions, "Clear All", {"clearall"}, "", function()
        addict.trigger_commands("clearpeds" .. players.get_name(pid))
        addict.trigger_commands("clearobjects" .. players.get_name(pid))
        addict.trigger_commands("clearvehicles" .. players.get_name(pid))
    end)

------------------------------------------------------------------------------------------------------------------------------------------

    efucks = addict.list(Trolling, "Entity Fuck", {""}, "", function(); end)



    Stack_Ents  = addict.list(efucks, "Stack Entitys", {""}, "", function(); end)
    

local STACK_HEIGHT = 2.5
local SEARCH_RADIUS = 150.0
local stack_mode = "All"
local blackhole_mode = false
local explode_on_arrival = false

local stack_options = {"All", "Peds", "Vehicles", "Objects"}

local function get_entities(pool_type)
    if pool_type == "peds" then
        return entities.get_all_peds_as_handles()
    elseif pool_type == "vehicles" then
        return entities.get_all_vehicles_as_handles()
    elseif pool_type == "objects" then
        return entities.get_all_objects_as_handles()
    else
        return {}
    end
end


local function stack_entities()
    local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local base_pos = ENTITY.GET_ENTITY_COORDS(player_ped, true)

    local selected = {}

    if stack_mode == "All" or stack_mode == "Peds" then
        for _, ped in ipairs(get_entities("peds")) do
            if ped ~= player_ped and v3.distance(base_pos, ENTITY.GET_ENTITY_COORDS(ped, true)) <= SEARCH_RADIUS then
                table.insert(selected, ped)
            end
        end
    end
    if stack_mode == "All" or stack_mode == "Vehicles" then
        for _, veh in ipairs(get_entities("vehicles")) do
            if v3.distance(base_pos, ENTITY.GET_ENTITY_COORDS(veh, true)) <= SEARCH_RADIUS then
                table.insert(selected, veh)
            end
        end
    end
    if stack_mode == "All" or stack_mode == "Objects" then
        for _, obj in ipairs(get_entities("objects")) do
            if v3.distance(base_pos, ENTITY.GET_ENTITY_COORDS(obj, true)) <= SEARCH_RADIUS then
                table.insert(selected, obj)
            end
        end
    end

    for i, ent in ipairs(selected) do
        local target_pos
        if blackhole_mode then
            target_pos = base_pos
        else
            target_pos = v3.new(base_pos.x, base_pos.y, base_pos.z + (i * STACK_HEIGHT))
        end

        ENTITY.SET_ENTITY_COORDS(ent, target_pos.x, target_pos.y, target_pos.z, false, false, false, true)

        if explode_on_arrival then
            FIRE.ADD_EXPLOSION(target_pos.x, target_pos.y, target_pos.z, 4, 1.0, true, false, 0.0)
        end
    end

    util.toast("Pulled in " .. #selected .. " entities.")
end


addict.list_select(Stack_Ents, "Stack Entity Type", {"stacktype"}, "Choose which types to stack", stack_options, 1, function(index, name)
    stack_mode = name
end)

addict.toggle(Stack_Ents, "Black Hole Mode", {"blackhole"}, "Teleports all to exact same point instead of stacking", function(val)
    blackhole_mode = val
end)

addict.toggle(Stack_Ents, "Explode on Arrival", {"explodestack"}, "Explodes each entity when it arrives", function(val)
    explode_on_arrival = val
end)

addict.toggle_loop(Stack_Ents, "Activate Entity Pull", {"pullstack"}, "Pull selected entities into one place, Note: if you are close to the target it will pull your ped in if selected.", function()
    stack_entities()
end)

    local function ensure_model(hash)
    if not STREAMING.IS_MODEL_VALID(hash) then return false end
    STREAMING.REQUEST_MODEL(hash)
    local timeout = 1000
    while not STREAMING.HAS_MODEL_LOADED(hash) and timeout > 0 do
        util.yield(10)
        timeout = timeout - 1
    end
    return STREAMING.HAS_MODEL_LOADED(hash)
end

addict.action(
    efucks,
    "Flying whales",
    {},
    "Deletes all peds within 100m and spawns whales. Deletes all vehicles within 100m and spawns cargoplanes.",
    function()
        local userPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local userPos = ENTITY.GET_ENTITY_COORDS(userPed)
        local radius  = 100.0

        local whaleHash = util.joaat("A_C_HumpBack")
        local planeHash = util.joaat("cargoplane")

        if not ensure_model(whaleHash) then
            util.toast("Failed to load whale model")
            return
        end
        if not ensure_model(planeHash) then
            util.toast("Failed to load cargo plane model")
            return
        end

        -- Replace peds
        for _, ped in ipairs(entities.get_all_peds_as_handles()) do
            if ped ~= userPed and not PED.IS_PED_INJURED(ped) then
                local pedPos = ENTITY.GET_ENTITY_COORDS(ped)
                if v3.distance(userPos, pedPos) <= radius then
                    entities.delete_by_handle(ped)
                    entities.create_ped(28, whaleHash, pedPos, math.random(0, 360))
                end
            end
        end

        -- Replace vehicles
        for _, veh in ipairs(entities.get_all_vehicles_as_handles()) do
            local vehPos = ENTITY.GET_ENTITY_COORDS(veh)
            if v3.distance(userPos, vehPos) <= radius then
                entities.delete_by_handle(veh)
                local spawnPos = v3.new(vehPos.x, vehPos.y, vehPos.z + 10)
                entities.create_vehicle(planeHash, spawnPos, math.random(0, 360))
            end
        end

        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(whaleHash)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(planeHash)

        util.toast("Replaced nearby peds with whales and vehicles with cargoplanes!")
    end
)
    
    addict.action(efucks, "Metro Madness", {""}, "Use with caution this will lag your game if you can see it or close to it, restart the lua and clear area to stop it quicker.", function()
            while true do
            local coords = player_coords(pid)
            coords.x = coords.x
            coords.y = coords.y + -30
            coords.z = coords.z
            util.request_model(util.joaat("metrotrain"))
            STREAMING.REQUEST_MODEL(util.joaat("metrotrain"))
            while not STREAMING.HAS_MODEL_LOADED(util.joaat("metrotrain")) do
                util.yield()
            end
            local trailer = entities.create_object(util.joaat("prop_snow_truktrailer_01a"),  coords, 0.0)
        for i = 1, 50 do
            local dubsta = entities.create_vehicle(util.joaat("metrotrain"),  coords, 0.0)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(dubsta, true, true)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(trailer, true, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(trailer, dubsta, 0, 0, 0, 0, 0, 0, 0, true, true, false, true, 1, true)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(trailer, 1, 0.0, 10000.0, 0.0, 0.0, 0.0, 0.0, false, true, true, false, true)
            util.yield(5)
            ENTITY.DETACH_ENTITY(trailer, dubsta)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dubsta, trailer, 0, 0, 0, 0, 0, 0, 0, true, true, false, true, 1, true)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(dubsta, 1, 0.0, 10000.0, 0.0, 0.0, 0.0, 0.0, false, true, true, false, true)
            util.yield(5)
            ENTITY.DETACH_ENTITY(dubsta, trailer)
            entities.delete_by_handle(dubsta)
            entities.delete_by_handle(trailer)
            end
        end
    end)

    addict.action(efucks, "Drunk Pilot", {"drunkpilot"}, "", function()
            local coords = player_coords(pid)
            coords.x = coords.x
            coords.y = coords.y + -30
            coords.z = coords.z
            STREAMING.REQUEST_MODEL(745926877)
            while not STREAMING.HAS_MODEL_LOADED(745926877) do
                util.yield()
            end
            for i = 1, 50 do
            local heli_vehicle = entities.create_vehicle(745926877, coords, 0.0)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(heli_vehicle, true, true)
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(heli_vehicle)
            ENTITY.SET_ENTITY_INVINCIBLE(heli_vehicle, true)
            VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(heli_vehicle, true)
            VEHICLE.SET_VEHICLE_ENGINE_ON(heli_vehicle, true, true, true)
            VEHICLE.SET_HELI_BLADES_FULL_SPEED(heli_vehicle)
            ENTITY.SET_ENTITY_VISIBLE(heli_vehicle, true, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(heli_vehicle, playerpos, 0, 0, -1, 2.5, 0, 180, 0, 0, false, true, false, 0, true)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(heli_vehicle, 1, 0.0, 10000.0, 0.0, 0.0, 0.0, 0.0, false, true, true, false, true)
            ENTITY.SET_ENTITY_VELOCITY(heli_vehicle, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
            ENTITY.SET_ENTITY_MAX_SPEED(heli_vehicle, 500.0)
            ENTITY.SET_ENTITY_ROTATION(heli_vehicle, math.random(0, 360), math.random(0, 360), math.random(0, 360), 0, true)
            VEHICLE.SET_VEHICLE_WILL_FORCE_OTHER_VEHICLES_TO_STOP(heli_vehicle, true)

            STREAMING.REQUEST_MODEL(970385471)
            while not STREAMING.HAS_MODEL_LOADED(970385471) do
                util.yield()
            end
            for i = 1, 50 do

            local craft_vehicle2 = entities.create_vehicle(970385471, coords, 0.0)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(craft_vehicle2, true, true)
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(craft_vehicle2)
            ENTITY.SET_ENTITY_INVINCIBLE(craft_vehicle2, true)
            VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(craft_vehicle2, true)
            VEHICLE.SET_VEHICLE_ENGINE_ON(craft_vehicle2, true, true, true)
            ENTITY.SET_ENTITY_VISIBLE(craft_vehicle2, true, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(craft_vehicle2, heli_vehicle, 0, 0, -1, 2.5, 0, 180, 0, 0, false, true, false, 0, true)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(craft_vehicle2, 1, 0.0, 10000.0, 0.0, 0.0, 0.0, 0.0, false, true, true, false, true)
            ENTITY.SET_ENTITY_VELOCITY(craft_vehicle2, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
            ENTITY.SET_ENTITY_MAX_SPEED(craft_vehicle2, 500.0)
            ENTITY.SET_ENTITY_ROTATION(craft_vehicle2, math.random(0, 360), math.random(0, 360), math.random(0, 360), 0, true)
            util.yield(500)
            entities.delete_by_handle(heli_vehicle)
            entities.delete_by_handle(craft_vehicle2)
            end
        end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.action(efucks, "Garage Doors", {"garagedoors"}, "", function()
        local coords = player_coords(pid)
        coords.x = coords.x
        coords.y = coords.y + -30
        coords.z = coords.z
        local object_req = util.joaat("prop_bh1_09_mp_gar")
        util.request_model(object_req)
        STREAMING.REQUEST_MODEL(970385471)
        while not STREAMING.HAS_MODEL_LOADED(970385471) do
            util.yield()
        end
        for i = 1, 50 do
        local object = entities.create_object(object_req, coords, 0.0)
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, true, true)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(object, 1, 0.0, 10000.0, 0.0, 0.0, 0.0, 0.0, false, true, true, false, true)
        ENTITY.SET_ENTITY_ROTATION(object, math.random(0, 360), math.random(0, 360), math.random(0, 360), 0, true)
        ENTITY.SET_ENTITY_VELOCITY(object, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
        end
    end)

    addict.action(efucks, "Train Fuck", {"trainfuck"}, "Use with caution this will lag your game if you can see it or close to it, restart the lua and clear area to stop it quicker.", function()
        local coords = player_coords(pid)
        coords.x = coords.x
        coords.y = coords.y + -30
        coords.z = coords.z
        local vehicle_req = util.joaat("freight")
        util.request_model(vehicle_req)
        local object_req = util.joaat("prop_container_01a")
        util.request_model(object_req)
    for i = 1, 50 do
        local object = entities.create_object(object_req, coords, 0.0)
        local vehicle = entities.create_vehicle(vehicle_req, coords, 0.0)
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, true)
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, true, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(object, vehicle, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0.0, 10000.0, 0.0, 0.0, 0.0, 0.0, false, true, true, false, true)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(object, 1, 0.0, 10000.0, 0.0, 0.0, 0.0, 0.0, false, true, true, false, true)
        ENTITY.SET_ENTITY_ROTATION(vehicle, math.random(0, 360), math.random(0, 360), math.random(0, 360), 0, true)
        ENTITY.SET_ENTITY_ROTATION(object, math.random(0, 360), math.random(0, 360), math.random(0, 360), 0, true)
        ENTITY.SET_ENTITY_VELOCITY(vehicle, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
        ENTITY.SET_ENTITY_VELOCITY(object, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
        util.yield(500)
        entities.delete_by_handle(object)
        entities.delete_by_handle(vehicle)
        end
    end)
    
    addict.action(efucks, "Nuke V1", {"nuke"}, "Nuke the player", function()
        addict.trigger_commands("levitate")
        util.yield(10)
        addict.trigger_commands("anticrashcamera")
        local self_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(self_ped, -75.2188, -818.582, 2698.8700, true, true, true)
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = offset_coords_forward(ENTITY.GET_ENTITY_COORDS(p), ENTITY.GET_ENTITY_HEADING(p), 100)
        local defx = 0
        local defy = 0
        local defz = 0
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(50)
        defz = defz + 2
        c = offset_coords_forward(ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz), ENTITY.GET_ENTITY_HEADING(p), 300)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(50)
        defz = defz + 2
        c = offset_coords_forward(ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz), ENTITY.GET_ENTITY_HEADING(p), 300)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(50)
        defz = defz + 2
        c = offset_coords_forward(ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz), ENTITY.GET_ENTITY_HEADING(p), 300)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(50)
         defz = defz + 2
        c = offset_coords_forward(ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz), ENTITY.GET_ENTITY_HEADING(p), 300)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
         util.yield(50)
        defz = defz + 2
        c = offset_coords_forward(ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz), ENTITY.GET_ENTITY_HEADING(p), 300)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(50)
        defx = defx + 2
        defy = defy + 2
        c = offset_coords_forward(ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz), ENTITY.GET_ENTITY_HEADING(p), 300)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        while not STREAMING.HAS_MODEL_LOADED(2336777441) do
            STREAMING.REQUEST_MODEL(2336777441)
            util.yield(10)
        end
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local PlayerPedCoords = offset_coords_forward(ENTITY.GET_ENTITY_COORDS(player_ped, true), ENTITY.GET_ENTITY_HEADING(player_ped), 300)
        spam_amount = 300
        while spam_amount >= 1 do
            entities.create_vehicle(2336777441, PlayerPedCoords, 0)
            spam_amount = spam_amount - 1
            util.yield(10)
        end
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local PlayerPedCoords = offset_coords_forward(ENTITY.GET_ENTITY_COORDS(player_ped, true), ENTITY.GET_ENTITY_HEADING(player_ped), 300)
        spam_amount = 300
        while spam_amount >= 1 do
            entities.create_vehicle(2336777441, PlayerPedCoords, 0)
            spam_amount = spam_amount - 1
            util.yield(10)
        end
        local ct = 0       
        util.toast("Working")
        for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
            entities.delete_by_handle(ent)
            ct = ct + 1
        end
        addict.trigger_commands("levitate")
        util.yield(10)
        addict.trigger_commands("anticrashcamera")
        util.toast("Finished")
        for k, ent in pairs(entities.get_all_peds_as_handles()) do
            if not PED.IS_PED_A_PLAYER(ent) then
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
                entities.delete_by_handle(ent)
            end
            ct = ct + 1
        end
    end)
 
    addict.action(efucks, "Scrap Storm", {}, "Collects wheels, doors, hood, trunk, bumpers and attaches them to a player", function()
        local local_ped = players.user_ped()
        local my_coords = ENTITY.GET_ENTITY_COORDS(local_ped, true)
        local player_list = players.list(true, true, true)
        if #player_list == 0 then util.toast("No players found.") return end
        local target_pid = player_list[1]
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(target_pid)
        local vehicles = entities.get_all_vehicles_as_handles()
        local parts_to_attach = {}
        for _, veh in ipairs(vehicles) do
            local vpos = ENTITY.GET_ENTITY_COORDS(veh, true)
            if get_distance(my_coords, vpos) < 100.0 then
                for i = 0, 5 do
                    if not VEHICLE.IS_VEHICLE_TYRE_BURST(veh, i, false) then
                        VEHICLE.SET_VEHICLE_TYRE_BURST(veh, i, true, 1000.0)
                        table.insert(parts_to_attach, util.joaat("prop_wheel_rim_01"))
                    end
                end
                for i = 0, 5 do
                    if not VEHICLE.IS_VEHICLE_DOOR_DAMAGED(veh, i) then
                        VEHICLE.SET_VEHICLE_DOOR_BROKEN(veh, i, true)
                        table.insert(parts_to_attach, util.joaat("prop_car_door_01"))
                    end
                end
                table.insert(parts_to_attach, util.joaat("prop_car_bonnet_01")) -- hood extra
                table.insert(parts_to_attach, util.joaat("prop_car_engine_01")) -- engine block
                table.insert(parts_to_attach, util.joaat("prop_bumper_01"))     -- fake bumper
            end
        end
        for _, model in ipairs(parts_to_attach) do
            STREAMING.REQUEST_MODEL(model)
        end
        util.yield(500)
        for _, model in ipairs(parts_to_attach) do
            while not STREAMING.HAS_MODEL_LOADED(model) do util.yield() end
        end
        local base = ENTITY.GET_ENTITY_COORDS(target_ped, true)
        local attached = 0
        for _, model in ipairs(parts_to_attach) do
            local offset = {
                x = math.random(-300, 300) / 100,
                y = math.random(-300, 300) / 100,
                z = math.random(0, 200) / 100
            }
            local obj = OBJECT.CREATE_OBJECT_NO_OFFSET(model, base.x, base.y, base.z, true, false, false)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(obj, target_ped, 0, offset.x, offset.y, offset.z, 0, 0, 0, false, false, true, false, 2, true)
            attached = attached + 1
        end
        util.toast("Scrap Storm: Attached "..attached.." parts to "..players.get_name(target_pid))
    end)

    addict.action(efucks,"Entity Dump", {"entcrash"}, "Working.", function()
        local player_ped = PLAYER.PLAYER_PED_ID()    
        local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    for i=1,1  do
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -858.3132, 184.23877, 100.07001)
        addict.trigger_commands("objfuck" .. players.get_name(pid))
        util.yield(1000)
        addict.trigger_commands("vehfuck" .. players.get_name(pid))
        end
        util.yield(1000)
        addict.trigger_commands("objfuck" .. players.get_name(pid))
        addict.trigger_commands("vehfuck" .. players.get_name(pid))
        addict.trigger_commands("cleararea")
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.toggle_loop(efucks, "Vehicle fuck", {"vehfuck"}, "", function()
    for _, entity in ipairs(entities.get_all_vehicles_as_handles()) do
        if ENTITY.DOES_ENTITY_EXIST(entity) and not PED.IS_PED_A_PLAYER(NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(entity)) then
            local entityCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
            local height = 100.0
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, entityCoords.x, entityCoords.y , height)
            ENTITY.SET_ENTITY_VELOCITY(entity, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
            ENTITY.SET_ENTITY_MAX_SPEED(entity, 500.0)
            ENTITY.SET_ENTITY_ROTATION(entity, math.random(-180, 180), math.random(-180, 180), math.random(-180, 180), 0, 1)
            end
        end
        util.yield(1)
    end)

    addict.toggle_loop(efucks, "Ped fuck", {"pedfuck"}, "", function()
        for _, entity in ipairs(entities.get_all_peds_as_handles()) do
            if ENTITY.DOES_ENTITY_EXIST(entity) and not PED.IS_PED_A_PLAYER(NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(entity)) then
                local entityCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
                local height = 100.0
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, entityCoords.x, entityCoords.y , height)
                ENTITY.SET_ENTITY_VELOCITY(entity, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
                ENTITY.SET_ENTITY_MAX_SPEED(entity, 500.0)
                ENTITY.SET_ENTITY_ROTATION(entity, math.random(-180, 180), math.random(-180, 180), math.random(-180, 180), 0, 1)
                end
            end
            util.yield(1)
        end)

    addict.toggle_loop(efucks, "Object fuck", {"objfuck"}, "", function()
        for _, entity in ipairs(entities.get_all_objects_as_handles()) do
            if ENTITY.DOES_ENTITY_EXIST(entity) and not PED.IS_PED_A_PLAYER(NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(entity)) then
                local entityCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
                local height = 100.0
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, entityCoords.x, entityCoords.y , height)
                ENTITY.SET_ENTITY_VELOCITY(entity, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
                ENTITY.SET_ENTITY_MAX_SPEED(entity, 500.0)
                ENTITY.SET_ENTITY_ROTATION(entity, math.random(-180, 180), math.random(-180, 180), math.random(-180, 180), 0, 1)
                end
            end
            util.yield(1)
        end)

    local BlackholeEntities = addict.list(efucks, "Blackholes", {}, "")
    
	local dont_stop = false
	addict.toggle_loop(BlackholeEntities,"Vehicle Blackhole", {"vehicleblackholes"}, "Basically 'impulse like sport mode. but applied to every vehicle.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

    addict.toggle_loop(BlackholeEntities,"Object Blackhole", {"objectblackholes"}, "Basically 'impulse like sport mode. but applied to every object.", function(on)
		for k, veh in pairs(entities.get_all_objects_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

    addict.toggle_loop(BlackholeEntities,"Ped Blackhole", {"pedblackholes"}, "Turn on undead to not effect you. Basically 'impulse like sport mode. but applied to every ped.", function(on)
		for k, veh in pairs(entities.get_all_peds_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				    end
			    end
            end
        end)

    hole_zoff = 0
    addict.slider(BlackholeEntities, "Blackhole Z-offset", {"blackholeoffset"}, "", 0, 100, 50, 10, function(s)
        hole_zoff = s
    end)

local TornadoEntities = addict.list(efucks, "Tornado", {}, "Swirls entities in a tornado above you")

local tornado_z_offset = 20.0        -- Height above player
local tornado_radius = 25.0          -- How far from player they swirl
local tornado_strength = 35.0        -- Force power
local tornado_density = 10           -- How many entities to swirl per frame
local vehicle_swirl_radius = 15.0    -- Vehicle proximity to player

local dont_stop = false
local entity_index_tracker = {
    vehicle = 1,
    object = 1,
    ped = 1
}

local function get_tornado_center()
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    local coords = ENTITY.GET_ENTITY_COORDS(ped, true)
    coords.z = coords.z + tornado_z_offset
    return coords
end

local function swirl_toward(entity, center, radius)
    local pos = ENTITY.GET_ENTITY_COORDS(entity, true)
    local dx = pos.x - center.x
    local dy = pos.y - center.y
    local dist = math.max(1.0, math.sqrt(dx * dx + dy * dy))

    local swirl_fx = -dy / dist * tornado_strength
    local swirl_fy = dx / dist * tornado_strength
    local swirl_fz = (center.z - pos.z) * 2.0 + 5.0

    local desired_x = center.x + math.cos(util.current_time_millis() / 200) * radius
    local desired_y = center.y + math.sin(util.current_time_millis() / 200) * radius

    swirl_fx = swirl_fx + (desired_x - pos.x) * 2.0
    swirl_fy = swirl_fy + (desired_y - pos.y) * 2.0

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
    ENTITY.SET_ENTITY_INVINCIBLE(entity, true)
    ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(entity, 1, swirl_fx, swirl_fy, swirl_fz, true, false, true, true)
end

addict.toggle_loop(TornadoEntities, "Vehicle Tornado", {"vehicletornado2"}, "Swirls all vehicles above and around you", function(on)
    local center = get_tornado_center()
    local vehicles = entities.get_all_vehicles_as_handles()
    local processed = 0

    for i = entity_index_tracker.vehicle, #vehicles do
        local veh = vehicles[i]
        if VEHICLE.IS_VEHICLE_DRIVEABLE(veh, false) and veh ~= entities.get_user_vehicle_as_handle() then
            swirl_toward(veh, center, vehicle_swirl_radius)
            if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0)
            end
            processed = processed + 1
            if processed >= tornado_density then break end
        end
    end

    entity_index_tracker.vehicle = (entity_index_tracker.vehicle % #vehicles) + 1
end)

addict.toggle_loop(TornadoEntities, "Object Tornado", {"objecttornado"}, "Swirls world objects around and above you", function(on)
    local center = get_tornado_center()
    local objects = entities.get_all_objects_as_handles()
    local processed = 0

    for i = entity_index_tracker.object, #objects do
        swirl_toward(objects[i], center, tornado_radius)
        processed = processed + 1
        if processed >= tornado_density then break end
    end

    entity_index_tracker.object = (entity_index_tracker.object % #objects) + 1
end)

addict.toggle_loop(TornadoEntities, "Ped Tornado", {"pedtornado"}, "Swirls NPCs around and above you", function(on)
    local center = get_tornado_center()
    local peds = entities.get_all_peds_as_handles()
    local processed = 0

    for i = entity_index_tracker.ped, #peds do
        local ped = peds[i]
        if not PED.IS_PED_A_PLAYER(ped) then
            swirl_toward(ped, center, tornado_radius)
            processed = processed + 1
            if processed >= tornado_density then break end
        end
    end

    entity_index_tracker.ped = (entity_index_tracker.ped % #peds) + 1
end)

addict.slider(TornadoEntities, "Tornado Z-Offset", {"tornado2zoffset"}, "How high the tornado vortex is above you", 5, 100, 20, 5, function(val)
    tornado_z_offset = val
end)

addict.slider(TornadoEntities, "Tornado Density", {"tornado2density"}, "How many entities are pulled each frame", 1, 50, 10, 1, function(val)
    tornado_density = val
end)

addict.slider(TornadoEntities, "Vehicle Swirl Radius", {"tornado2vehicleradius"}, "Distance vehicles swirl from center", 5, 100, 15, 5, function(val)
    vehicle_swirl_radius = val
end)

-------------------------------------------------------------------------------------------------------------------------------------

	seizures = addict.list(Trolling, "Seizure Shit", {}, "", function(); end)

    addict.toggle_loop(seizures, "Seizure V1", {"seizurev1"}, "", function()
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3

        local khanjali = util.joaat("cargobob")
        STREAMING.REQUEST_MODEL(khanjali)
        while not STREAMING.HAS_MODEL_LOADED(khanjali) do
            util.yield()
        end

        local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
        util.yield(0)
        entities.delete_by_handle(vehicle1)

        local khanjali = util.joaat("kosatka")
        STREAMING.REQUEST_MODEL(khanjali)
        while not STREAMING.HAS_MODEL_LOADED(khanjali) do
            util.yield()
        end

        local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
        util.yield(0)
        entities.delete_by_handle(vehicle1)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.toggle_loop(seizures, "Seizure V2", {"seizurev2"}, "", function(on_toggle)
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3

        local khanjali = util.joaat("cargoplane")
        STREAMING.REQUEST_MODEL(khanjali)
        while not STREAMING.HAS_MODEL_LOADED(khanjali) do
            util.yield()
        end

        local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, 180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, 180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
        util.yield(0)
        entities.delete_by_handle(vehicle1)

        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3

        local khanjali = util.joaat("cargoplane")
        STREAMING.REQUEST_MODEL(khanjali)
        while not STREAMING.HAS_MODEL_LOADED(khanjali) do
            util.yield()
        end

        local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
        util.yield(0)
        entities.delete_by_handle(vehicle1)

        local khanjali = util.joaat("cargobob")
        STREAMING.REQUEST_MODEL(khanjali)
        while not STREAMING.HAS_MODEL_LOADED(khanjali) do
            util.yield()
        end

        local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
        util.yield(0)
        entities.delete_by_handle(vehicle1)

        local khanjali = util.joaat("kosatka")
        STREAMING.REQUEST_MODEL(khanjali)
        while not STREAMING.HAS_MODEL_LOADED(khanjali) do
            util.yield()
        end

        local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
        util.yield(0)
        entities.delete_by_handle(vehicle1)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)


	addict.toggle(seizures, "Seizure V3", {"seizurev3"}, "", function(on_toggle)
	if on_toggle then
			addict.trigger_commands("seizurev1" .. players.get_name(pid))
			addict.trigger_commands("seizurev2" .. players.get_name(pid))
	else
			addict.trigger_commands("seizurev1" .. players.get_name(pid))
			addict.trigger_commands("seizurev2" .. players.get_name(pid))
		end
	end)

    local tormentspam = addict.list(Trolling, "Spammers")

    addict.toggle_loop(tormentspam, "Crap trail", {"crapon"}, "", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] + 1.5
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 35, 0, false, false, 0, false)
        util.yield(65)
    end)

    player_toggle_loop(tormentspam, pid, "Taser", {"taseron"}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        for i = 1, 50 do
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 0, true, util.joaat("weapon_stungun"), players.user_ped(), false, true, 1.0)
        end
        util.yield()
    end)

    player_toggle_loop(tormentspam, pid, "Up-n-Atomizer", {"atomizeron"}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        for i = 1, 24 do
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 0, true, util.joaat("weapon_raypistol"), players.user_ped(), false, true, 1.0)
        end
        util.yield()
    end)

    player_toggle_loop(tormentspam, pid, "Firework", {"fireworkon"}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        for i = 1, 30 do
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 0, true, util.joaat("weapon_firework"), players.user_ped(), false, true, 1.0)
        end
        util.yield()
    end)

    addict.toggle_loop(tormentspam, "Asteroid Smash", {"asteroidon"}, "Crush the player with an asteroid", function() 
        local coords = players.get_position(pid)
        coords.z = coords['z'] + 15.0
        local asteroid = entities.create_object(3751297495, coords)
        ENTITY.SET_ENTITY_DYNAMIC(asteroid, true)
    end)

    addict.toggle_loop(tormentspam, "Ragdoll", {"ragdollon"}, "Keeps target ragdolled", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 11, 1, false, true, 0, true)
        util.yield(10)
    end)

    addict.toggle_loop(tormentspam, "Flames", {"fireon"}, "Spam fire beneath the target", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 12, 1, true, false, 0, false)
        util.yield(25)
    end)

    addict.toggle_loop(tormentspam, "Water Jet", {"wateron"}, "Spam water jets beneath the target", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 13, 1, true, false, 0, false)
        util.yield(25)
    end)

    addict.toggle_loop(tormentspam, "Flame path", {"flamepathon"}, "They better run", function()
        local coords = players.get_position(pid)
        --coords.z = coords['z'] + 1.5
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 38, 0, false, false, 0, false)
        util.yield(65)
    end)

    local tormentplayer = addict.list(Trolling, "Torment Shit")
    
    addict.action(tormentplayer, "Tram Lag", {"tramlag"}, "", function()
        TramLag(pid)
    end)
    
    addict.action(tormentplayer,"Heli Rapel Chimp", {"helirapel"}, "(Needs Fixing)", function(on)
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        pos.z = pos.z + 35
        local mdl = util.joaat("A_C_Chimp_02")
        local veh_mdl = util.joaat("maverick")
        util.request_model(mdl)
        util.request_model(veh_mdl)
        local modelHash <const> = util.joaat("weapon_raypistol")
        local flag_hash = util.joaat("prop_flag_uk")
        PED.SET_PED_RELATIONSHIP_GROUP_HASH(ped, util.joaat("PLAYER"))
        local veh = entities.create_vehicle(veh_mdl, pos, 0)
        VEHICLE.SET_HELI_BLADES_FULL_SPEED(veh)
        local chimp2 = entities.create_ped(2, mdl, pos, 0)
        local player_chimp_army = entities.create_ped(2, mdl, pos, 0)
        local object = entities.create_object(flag_hash, pos)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(object, player_chimp_army, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_COLLISION(veh, false, false)
        ENTITY.SET_ENTITY_COLLISION(player_chimp_army, false, false)
        ENTITY.SET_ENTITY_COLLISION(chimp2, false, false)
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(veh, true, true)
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(player_chimp_army, true, true)
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(chimp2, true, true)
        ENTITY.SET_ENTITY_INVINCIBLE(player_chimp_army, true)
        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
        ENTITY.SET_ENTITY_INVINCIBLE(chimp2, true)
        PED.SET_PED_INTO_VEHICLE(player_chimp_army, veh, 1)
        PED.SET_PED_INTO_VEHICLE(chimp2, veh, -1)
        TASK.TASK_RAPPEL_FROM_HELI(player_chimp_army, 20)
        PED.SET_PED_MAX_HEALTH(player_chimp_army, 100)
        ENTITY.SET_ENTITY_HEALTH(player_chimp_army, 100)
        ENTITY.SET_ENTITY_INVINCIBLE(player_chimp_army, true)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(player_chimp_army)
        PED.SET_PED_AS_ENEMY(player_chimp_army, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(player_chimp_army, 46, true)
        WEAPON.GIVE_WEAPON_TO_PED(player_chimp_army, modelHash, 9999,  true)
        PED.SET_PED_COMBAT_ATTRIBUTES(player_chimp_army, player_ped, 0, 16)
        PED.SET_PED_RELATIONSHIP_GROUP_HASH(player_chimp_army, util.joaat("HATES_PLAYER"))
        util.toast("Chimp sent to " .. PLAYER.GET_PLAYER_NAME(pid))
        util.log("Chimp sent to " .. PLAYER.GET_PLAYER_NAME(pid))
    end)

    
    addict.action(tormentplayer, "Huge Shit On Head", {"hshit"}, "Make a massive shit", function()
        addict.trigger_commands("tp" .. players.get_name(pid))
        local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
        c.z = c.z -1
        while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
            STREAMING.REQUEST_ANIM_DICT(agroup)
            util.yield()
        end
        TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
        util.yield(1000)
        entities.create_object(mshit, c)
        end)
    
    addict.action(tormentplayer, "Normal Shit On Head", {"nshit"}, "Make a normale sized shit", function()
        addict.trigger_commands("tp" .. players.get_name(pid))
        local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
        c.z = c.z -1
        while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
            STREAMING.REQUEST_ANIM_DICT(agroup)
            util.yield()
        end
        TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
        util.yield(1000)
        entities.create_object(rshit, c)
    end)
    
    addict.toggle_loop(tormentplayer, "Drop Fake Bags", {"dropfakebags"}, "Old School :D", function()
        local coords = players.get_position(pid)
        coords.z = coords.z + 1.5
        local card = MISC.GET_HASH_KEY("prop_money_bag_01")
        STREAMING.REQUEST_MODEL(card)
        if STREAMING.HAS_MODEL_LOADED(card) == false then  
            STREAMING.REQUEST_MODEL(card)
        end
        OBJECT.CREATE_AMBIENT_PICKUP(-1009939663, coords.x, coords.y, coords.z, 0, 1, card, false, true)
    end)

    addict.toggle_loop(tormentplayer, "Glitch Physics", {"glitchphysics"}, "", function(on_toggle)
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3

        local khanjali = util.joaat("prop_ld_ferris_wheel")
        STREAMING.REQUEST_MODEL(khanjali)
        while not STREAMING.HAS_MODEL_LOADED(khanjali) do
            util.yield()
        end

        local vehicle1 = entities.create_object(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        local vehicle2 = entities.create_object(khanjali, playerpos, 0)
        local vehicle3 = entities.create_object(khanjali, playerpos, 0)
        local vehicle4 = entities.create_object(khanjali, playerpos, 0)

        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, false)
        util.yield(1200)
        entities.delete_by_handle(vehicle1)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)


addict.toggle_loop(tormentplayer, "Rain Peds on Player", {"rainingpeds"}, "", function(on_toggle)
    local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    local ped_c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_peds_as_handles()
    for k,ped in pairs(all_peds) do
        if not PED.IS_PED_A_PLAYER(ped) then
            if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
            end
            ENTITY.IS_ENTITY_IN_AIR(ped)
            ENTITY.SET_ENTITY_COORDS(ped, ped_c.x, ped_c.y, ped_c.z)
            ped_c.x = ped_c.x + math.random(-5, 5)
            ped_c.y = ped_c.y + math.random(-5, 5)
            ped_c.z = ped_c.z + math.random(5, 10)
            ENTITY.SET_ENTITY_VELOCITY(ped, 0.0, 0.0, -1.0)
            util.yield(100)
        end
    end
end)

addict.toggle_loop(tormentplayer, "Rain Vehicles on Player", {"rainveh"}, "", function(on_toggle)
    local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    local ped_c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_vehicles_as_handles()
    for k,ped in pairs(all_peds) do
        if not PED.IS_PED_A_PLAYER(ped) then
            if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
            end
            ENTITY.IS_ENTITY_IN_AIR(ped)
            ENTITY.SET_ENTITY_COORDS(ped, ped_c.x, ped_c.y, ped_c.z)
            ped_c.x = ped_c.x + math.random(-5, 5)
            ped_c.y = ped_c.y + math.random(-5, 5)
            ped_c.z = ped_c.z + math.random(5, 10)
            ENTITY.SET_ENTITY_VELOCITY(ped, 0.0, 0.0, -1.0)
            util.yield(100)
        end
    end
end)


addict.toggle_loop(tormentplayer, "Rain Objects on Player", {"rainobj"}, "", function(on_toggle)
    local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    local ped_c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_objects_as_handles()
    for k,ped in pairs(all_peds) do
        if not PED.IS_PED_A_PLAYER(ped) then
            if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
            end
            ENTITY.IS_ENTITY_IN_AIR(ped)
            ENTITY.SET_ENTITY_COORDS(ped, ped_c.x, ped_c.y, ped_c.z)
            ped_c.x = ped_c.x + math.random(-5, 5)
            ped_c.y = ped_c.y + math.random(-5, 5)
            ped_c.z = ped_c.z + math.random(5, 10)
            ENTITY.SET_ENTITY_VELOCITY(ped, 0.0, 0.0, -100.0)
            util.yield(0)
        end
    end
end)

addict.toggle_loop(tormentplayer, "Bend There Knees", {"bendknees"}, "Forces them down making them bend there knees.", function(on_toggle)
    for k, ped in pairs(entities.get_all_peds_as_handles()) do
        local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ped, -1, false)
        local locspeed2 = speed
                local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        if not PED.IS_PED_A_PLAYER(PedInSeat) then
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                    vcoords = ENTITY.GET_ENTITY_COORDS(ped, true)
                    speed = 100
                    local x_vec = (holecoords['x']-vcoords['x'])*speed
                    local y_vec = (holecoords['y']-vcoords['y'])*speed
                    local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                    ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                    ENTITY.IS_ENTITY_IN_AIR(ped)
                    local ped_c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
                    ped_c.x = ped_c.x + math.random(-50, 50)
                    ped_c.y = ped_c.y + math.random(-50, 50)
                    ped_c.z = ped_c.z + math.random(100, 120)
                    ENTITY.SET_ENTITY_VELOCITY(ped, 0.0, 0.0, -1.0)
                    if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_FORWARD_SPEED(ped, 0.0);
            end
        end
    end
end)

addict.toggle_loop(tormentplayer, "Give Wanted", {"givewanted"}, "", function(on_toggle)
        local p_hash = util.joaat("s_m_y_swat_01")
        local c 
        local cop
        for i=0, 5 do
            c = players.get_position(pid)
            c.z = 2500
            request_model(p_hash)
            local cop = entities.create_ped(6, p_hash, c, 0)
            FIRE.ADD_OWNED_EXPLOSION(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), c.x, c.y, c.z, 1, 100.0, false, true, 0.0)
            util.yield(2000)
            entities.delete_by_handle(cop)
        end
    end)

    
    addict.toggle(tormentplayer, "Toggle Sneaky Mode", {"sneakymode"}, "Teleports you to player then turns you invisible, off radar, blocks outgoing syncs and no collisions...", function(on_toggle)
        if on_toggle then
            addict.trigger_commands("tp" .. PLAYER.GET_PLAYER_NAME(pid))
            addict.trigger_commands("invisibility" .. " on")
            addict.trigger_commands("reducedcollision" .. " on")
            addict.trigger_commands("otr")
            addict.trigger_commands("quietsteps")
            addict.trigger_commands("desyncall")
            util.toast("Sneaky Mode On") 
        else
            addict.trigger_commands("tpmazehelipad")
            addict.trigger_commands("invisibility" .. " off")
            addict.trigger_commands("reducedcollision" .. " off")
            addict.trigger_commands("otr")
            addict.trigger_commands("quietsteps")
            addict.trigger_commands("desyncall")
            util.toast("Sneaky Mode Off")
            end 
    end)

    addict.toggle(tormentplayer, "Toggle Pidgeon Mode", {"pidgeonmode"}, "Teleports you to player then turns you into a Pidgeon, off radar and no collisions...", function(on_toggle)
        if on_toggle then
            addict.trigger_commands("otr")
            addict.trigger_commands("tp" .. PLAYER.GET_PLAYER_NAME(pid))
            addict.trigger_commands("reducedcollision" .. " on")
            addict.trigger_commands("acpigeon")
            util.yield(100)
            addict.trigger_commands("alwaysunarmed")
            util.toast("Pidgeon Mode On") 
        else
            addict.trigger_commands("alwaysunarmed")
            addict.trigger_commands("otr")
            addict.trigger_commands("tpmazehelipad")
            addict.trigger_commands("reducedcollision" .. " off")
            addict.trigger_commands("mpfemale")
            util.toast("Pidgeon Mode Off")
            end 
    end)
    
    addict.toggle_loop(tormentplayer, "Sky Dive Peds", {"skydivepeds"}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
                all_peds = entities.get_all_peds_as_handles()
                player_ped = PLAYER.PLAYER_PED_ID()
                for k,ped in pairs(all_peds) do
                    if not PED.IS_PED_A_PLAYER(ped) then
                        TASK.TASK_SKY_DIVE(ped)
                    end
            end
    end)

    addict.toggle_loop(tormentplayer, "Writher Peds", {"writherpeds"}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
                all_peds = entities.get_all_peds_as_handles()
                player_ped = PLAYER.PLAYER_PED_ID()
                for k,ped in pairs(all_peds) do
                    if not PED.IS_PED_A_PLAYER(ped) then
                        TASK.TASK_WRITHE(ped, player_ped, -1, 0)
                    end
            end
    end)

    addict.toggle_loop(tormentplayer, "Vault Peds", {"vaultpeds"}, "", function()
        util.yield(1000)
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
                all_peds = entities.get_all_peds_as_handles()
                player_ped = PLAYER.PLAYER_PED_ID()
                for k,ped in pairs(all_peds) do
                    if not PED.IS_PED_A_PLAYER(ped) then
                        TASK.TASK_CLIMB(ped, true)
                    end
            end
    end)

    addict.toggle_loop(tormentplayer, "Cower Peds", {"cowerpeds"}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
                all_peds = entities.get_all_peds_as_handles()
                player_ped = PLAYER.PLAYER_PED_ID()
                for k,ped in pairs(all_peds) do
                    if not PED.IS_PED_A_PLAYER(ped) then
                        TASK.TASK_COWER(ped, -1)
                    end
            end
    end)

    addict.toggle_loop(tormentplayer, "Cover Peds", {"coverpeds"}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
                all_peds = entities.get_all_peds_as_handles()
                player_ped = PLAYER.PLAYER_PED_ID()
                for k,ped in pairs(all_peds) do
                    if not PED.IS_PED_A_PLAYER(ped) then
                        TASK.TASK_STAY_IN_COVER(ped)
                    end
            end
    end)

	centipedegriefing = addict.list(Trolling, "Human Centipede", {}, "", function(); end)

    addict.action(centipedegriefing, "Human Centipede", {"centipede"}, "", function()
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_peds_as_handles()
        local last_ped = 0
        local last_ped_ht = 0
        for k,ped in pairs(all_peds) do
            if not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_FATALLY_INJURED(ped) then
                get_control_request(ped)
                if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
                end
    
                ENTITY.DETACH_ENTITY(ped, false, false)
                if last_ped ~= 0 then
                    ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, last_ped, 0, 0.0, 0.0, last_ped_ht- -0.5, 0.0, 0.0, 0.0, false, false, false, false, 0, false)
                else
                    ENTITY.SET_ENTITY_COORDS(ped, c.x, c.y, c.z)
                end
                last_ped = ped
            end
        end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)
    
    addict.toggle_loop(centipedegriefing, "Human Centipede", {"togglecentipede"}, "", function(on_toggle)
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_peds_as_handles()
        local last_ped = 0
        local last_ped_ht = 0
        for k,ped in pairs(all_peds) do
            if not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_FATALLY_INJURED(ped) then
                get_control_request(ped)
                if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
                end
    
                ENTITY.DETACH_ENTITY(ped, false, false)
                if last_ped ~= 0 then
                    ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, last_ped, 0, 0.0, 0.0, last_ped_ht- -0.5, 0.0, 0.0, 0.0, false, false, false, false, 0, false)
                else
                    ENTITY.SET_ENTITY_COORDS(ped, c.x, c.y, c.z)
                end
                last_ped = ped
            end
        end
    end)

    local pclpid = {}
    addict.toggle_loop(centipedegriefing, "Clone Centipede", {"clonecentipede"}, "Clone the player into a centipede. Note: Click a few times for better results.", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        PED.SET_PED_RELATIONSHIP_GROUP_HASH(p, util.joaat("PLAYER"))
        local pclone = entities.create_ped(26, ENTITY.GET_ENTITY_MODEL(p), c, 0)
        pclpid [#pclpid + 1] = pclone 
        PED.CLONE_PED_TO_TARGET(p, pclone)
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_peds_as_handles()
        local last_ped = 0
        local last_ped_ht = 0
        for k,ped in pairs(all_peds) do
            if not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_FATALLY_INJURED(ped) then
                get_control_request(ped)
                if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(pclone)
                    TASK.TASK_LEAVE_ANY_VEHICLE(pclone, 0, 16)
                    PED.SET_PED_MAX_HEALTH(pclone, 100)
                    ENTITY.SET_ENTITY_HEALTH(pclone, 100)
                    ENTITY.SET_ENTITY_INVINCIBLE(pclone, true)
                    PED.SET_PED_AS_ENEMY(pclone, true)
                    PED.SET_PED_FLEE_ATTRIBUTES(pclone, 0, false)
                    PED.SET_PED_COMBAT_ATTRIBUTES(pclone, 46, true)
                    WEAPON.GIVE_WEAPON_TO_PED(pclone, util.joaat("weapon_raypistol"), 9999,  true)
                    PED.SET_PED_COMBAT_ATTRIBUTES(pclone, ped, 0, 16)
                    PED.SET_PED_RELATIONSHIP_GROUP_HASH(pclone,util.joaat("HATES_PLAYER"))
                end
    
                ENTITY.DETACH_ENTITY(ped, false, false)
                if last_ped ~= 0 then
                    ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, last_ped, 0, 0.0, 0.0, last_ped_ht- -0.5, 0.0, 0.0, 0.0, false, false, false, false, 0, false)
                else
                    ENTITY.SET_ENTITY_COORDS(ped, c.x, c.y, c.z)
                end
                last_ped = ped
            end
        end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

all_weapons_list = {
    "weapon_unarmed",
    "weapon_candycane",
    "weapon_candycane",
    "weapon_briefcase",
    "weapon_briefcase_02",
    "weapon_digiscanner",
    "weapon_raypistol",
    "weapon_firework",
    "weapon_stungun",
    "weapon_switchblade",
    "weapon_emplauncher",
    "weapon_railgun",
    "weapon_flare",
    "weapon_knife",
    "weapon_NIGHTSTICK",
    "weapon_bottle",
    "weapon_HAMMER",
    "weapon_BAT",
    "weapon_GOLFCLUB",
    "weapon_CROWBAR",
    "weapon_PISTOL",
    "weapon_COMBATPISTOL",
    "weapon_APPISTOL",
    "weapon_PISTOL50",
    "weapon_MICROSMG",
    "weapon_SMG",
    "weapon_ASSAULTSMG",
    "weapon_ASSAULTRIFLE",
    "weapon_hatchet",
    "weapon_knuckle",
    "weapon_machete",
    "weapon_dagger",
    "weapon_wrench",
    "weapon_battleaxe",
    "weapon_poolcue",
    "weapon_pistol_mk2",
    "weapon_snspistol",
    "weapon_snspistol_mk2",
    "weapon_heavypistol",
    "weapon_vintagepistol",
    "weapon_flaregun",
    "weapon_marksmanpistol",
    "weapon_revolver",
    "weapon_revolver_mk2",
    "weapon_doubleaction",
    "weapon_ceramicpistol",
    "weapon_navyrevolver",
    "weapon_smg_mk2",
    "weapon_combatpdw",
    "weapon_machinepistol",
    "weapon_minismg",
    "weapon_raycarbine",
    "weapon_pumpshotgun",
    "weapon_pumpshotgun_mk2",
    "weapon_sawnoffshotgun",
    "weapon_assaultshotgun",
    "weapon_bullpupshotgun",
    "weapon_musket",
    "weapon_heavyshotgun",
    "weapon_dbshotgun",
    "weapon_autoshotgun",
    "weapon_assaultrifle",
    "weapon_assaultrifle_mk2",
    "weapon_carbinerifle",
    "weapon_carbinerifle_mk2",
    "weapon_advancedrifle",
    "weapon_specialcarbine",
    "weapon_specialcarbine_mk2",
    "weapon_bullpuprifle",
    "weapon_bullpuprifle_mk2",
    "weapon_compactrifle",
    "weapon_mg",
    "weapon_combatmg",
    "weapon_combatmg_mk2",
    "weapon_gusenberg",
    "weapon_sniperrifle",
    "weapon_heavysniper",
    "weapon_heavysniper_mk2",
    "weapon_marksmanrifle",
    "weapon_marksmanrifle_mk2",
    "weapon_rpg",
    "weapon_grenadelauncher",
    "weapon_grenadelauncher_smoke",
    "weapon_minigun",
    "weapon_hominglauncher",
    "weapon_compactlauncher",
    "weapon_rayminigun",
    "weapon_grenade",
    "weapon_bzgas",
    "weapon_molotov",
    "weapon_proxmine",
    "weapon_snowball",
    "weapon_pipebomb",
    "weapon_ball",
    "weapon_smokegrenade",
    "weapon_stickybomb",
    "weapon_petrolcan",
    "weapon_parachute",
    "weapon_fireextinguisher",
    "weapon_hazardcan",
}
 
-- CONFIG
local config = {
    count = 1,
    weaponslist = "WEAPON_CANDYCANE",
    "WEAPON_PISTOL",
    "WEAPON_CANDYCANE",
    "WEAPON_UNARMED",
    "WEAPON_STUNROD",
    "WEAPON_STONE_HATCHET",
    "WEAPON_BRIEFCASE",
    "WEAPON_BRIEFCASE_02",
    "WEAPON_DIGISCANNER",
    "WEAPON_RAYPISTOL",
    "WEAPON_FIREWORK",
    "WEAPON_STUNGUN",
    "WEAPON_SWITCHBLADE",
    "WEAPON_EMPLAUNCHER",
    "WEAPON_RAILGUN",
    "WEAPON_FLARE",
    "WEAPON_KNIFE",
    "WEAPON_NIGHTSTICK",
    "WEAPON_BOTTLE",
    "WEAPON_HAMMER",
    "WEAPON_BAT",
    "WEAPON_GOLFCLUB",
    "WEAPON_CROWBAR",
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_MICROSMG",
    "WEAPON_SMG",
    "WEAPON_ASSAULTSMG",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_HATCHET",
    "WEAPON_KNUCKLE",
    "WEAPON_MACHETE",
    "WEAPON_DAGGER",
    "WEAPON_WRENCH",
    "WEAPON_BATTLEAXE",
    "WEAPON_POOLCUE",
    "WEAPON_PISTOL_MK2",
    "WEAPON_SNSPISTOL",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_FLAREGUN",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_REVOLVER",
    "WEAPON_REVOLVER_MK2",
    "WEAPON_DOUBLEACTION",
    "WEAPON_CERAMICPISTOL",
    "WEAPON_NAVYREVOLVER",
    "WEAPON_SMG_MK2",
    "WEAPON_COMBATPDW",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_MINISMG",
    "WEAPON_RAYCARBINE",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_MUSKET",
    "WEAPON_HEAVYSHOTGUN",
    "WEAPON_DBSHOTGUN",
    "WEAPON_AUTOSHOTGUN",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_ASSAULTRIFLE_MK2",
    "WEAPON_CARBINERIFLE",
    "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_SPECIALCARBINE_MK2",
    "WEAPON_BULLPUPRIFLE",
    "WEAPON_BULLPUPRIFLE_MK2",
    "WEAPON_COMPACTRIFLE",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_COMBATMG_MK2",
    "WEAPON_GUSENBERG",
    "WEAPON_SNIPERRIFLE",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_HEAVYSNIPER_MK2",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_MARKSMANRIFLE_MK2",
    "WEAPON_RPG",
    "WEAPON_GRENADELAUNCHER",
    "WEAPON_GRENADELAUNCHER_SMOKE",
    "WEAPON_MINIGUN",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_COMPACTLAUNCHER",
    "WEAPON_RAYMINIGUN",
    "WEAPON_GRENADE",
    "WEAPON_BZGAS",
    "WEAPON_MOLOTOV",
    "WEAPON_PROXMINE",
    "WEAPON_SNOWBALL",
    "WEAPON_PIPEBOMB",
    "WEAPON_BALL",
    "WEAPON_SMOKEGRENADE",
    "WEAPON_STICKYBOMB",
    "WEAPON_PETROLCAN",
    "WEAPON_PARACHUTE",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_HAZARDCAN",
}

local AttackerPeds = addict.list(Trolling, "Attacker Peds", {}, "")

local British_Attack = addict.list(AttackerPeds, "Bri' 'ish Attack")


local hostile_group_ptr = memory.alloc(4)
PED.ADD_RELATIONSHIP_GROUP("UK_ATTACKERS", hostile_group_ptr)
local hostile_group_id = memory.read_int(hostile_group_ptr)

PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, hostile_group_id, util.joaat("PLAYER"))
PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("PLAYER"), hostile_group_id)

local function spawn_attacker(coords, weaponslist)
    local pedModel = util.joaat("IG_EnglishDave_02")
    local propModel = util.joaat("prop_flag_uk")

    STREAMING.REQUEST_MODEL(pedModel)
    STREAMING.REQUEST_MODEL(propModel)
    while not STREAMING.HAS_MODEL_LOADED(pedModel) or not STREAMING.HAS_MODEL_LOADED(propModel) do
        util.yield()
    end

    local ped = PED.CREATE_PED(26, pedModel, coords.x, coords.y, coords.z, 0.0, true, true)
    ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
    local flag = OBJECT.CREATE_OBJECT(propModel, coords.x, coords.y, coords.z, true, false, false)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(flag, ped, PED.GET_PED_BONE_INDEX(ped, 57005), 0.1, 0, 0, 0.0, 0.0, 180.0, true, true, false, false, 2, true)
    WEAPON.GIVE_WEAPON_TO_PED(ped, util.joaat(weaponslist), 9999, true, true)
    PED.SET_PED_RELATIONSHIP_GROUP_HASH(ped, hostile_group_id)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)
    PED.SET_PED_COMBAT_ABILITY(ped, 2)
    PED.SET_PED_COMBAT_RANGE(ped, 2)
    PED.SET_PED_FLEE_ATTRIBUTES(ped, 0, false)
    PED.SET_PED_CAN_RAGDOLL(ped, true)
    PED.SET_PED_AS_ENEMY(ped, true)
    PED.SET_PED_ACCURACY(ped, 75)
    TASK.TASK_COMBAT_PED(ped, PLAYER.PLAYER_PED_ID(), 0, 16)

    return ped
end

addict.divider(British_Attack, "Bri' 'ish Attackers")

addict.slider(British_Attack, "Number of Attackers", {"ukcount"}, "", 1, 48, config.count, 1, function(val)
    config.count = val
end)

local weapon_names = {}
for i = 2, #config do
    table.insert(weapon_names, config[i])
end

local function get_weapon_index(weaponslist)
    for i, w in ipairs(weapon_names) do
        if w == weaponslist then return i end
    end
    return 1
end

addict.list_select(British_Attack, "Select Weapon", {"ukweapon"}, "Choose a weapon from the list", weapon_names, get_weapon_index(config.weaponslist), function(index, value)
    config.weaponslist = value
end)

addict.action(British_Attack, "Spawn UK Attackers", {"ukattack"}, "Spawns hostile English Dave attackers with flags", function()
    local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local coords = ENTITY.GET_ENTITY_COORDS(p)
    --local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), true)
    for i = 1, config.count do
        local angle = (i - 1) * (360 / config.count)
        local rad = math.rad(angle)
        local spawn = {
            x = coords.x + math.cos(rad) * 5.0,
            y = coords.y + math.sin(rad) * 5.0,
            z = coords.z
        }
        spawn_attacker(spawn, config.weaponslist)
        util.yield(500)
    end
    util.yield(5000)
end)

-------------------------------------------------------------------------------------------------------------------------------

    local CloneEntities = addict.list(AttackerPeds, "Clone Attacker", {}, "")

    local pclpid = {}
    local selectedweapon = 1

    addict.action(CloneEntities, "Clone", {}, "Clone the player into a ped", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        PED.SET_PED_RELATIONSHIP_GROUP_HASH(p, util.joaat("PLAYER"))
        local modelHashes <const> = util.joaat(all_weapons_list[selectedweapon])
        local pclone = entities.create_ped(26, ENTITY.GET_ENTITY_MODEL(p), c, 0)
        pclpid [#pclpid + 1] = pclone 
        PED.CLONE_PED_TO_TARGET(p, pclone)
        PED.SET_PED_MAX_HEALTH(pclone, 100)
        ENTITY.SET_ENTITY_HEALTH(pclone, 100)
        ENTITY.SET_ENTITY_INVINCIBLE(pclone, true)
        PED.SET_PED_AS_ENEMY(pclone, true)
        PED.SET_PED_FLEE_ATTRIBUTES(pclone, 0, false)
        PED.SET_PED_COMBAT_ATTRIBUTES(pclone, 46, true)
        WEAPON.GIVE_WEAPON_TO_PED(pclone, modelHashes, 9999,  true)
        PED.SET_PED_COMBAT_ATTRIBUTES(pclone, ped, 0, 16)
        PED.SET_PED_RELATIONSHIP_GROUP_HASH(pclone,util.joaat("HATES_PLAYER"))
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.list_select(CloneEntities, 'Weapon Select', {}, "", all_weapons_list, 1, function (opt)
        selectedweapon = opt
    end)

local Nearby_Armys = addict.list(AttackerPeds, "Nearby Peds Attack")

local selweapon = 1
addict.toggle_loop(Nearby_Armys, "Nearby Peds Attack", {"pedsattack"}, "", function()
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
    pos.y = pos.y - 5
    pos.z = pos.z + 1
    local modelHash <const> = util.joaat(all_weapons_list[selweapon])
    for i, peds in ipairs(entities.get_all_peds_as_handles()) do
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(peds)
    if PED.IS_PED_IN_ANY_VEHICLE(peds) then
        WEAPON.GIVE_WEAPON_TO_PED(peds, modelHash, 9999, true, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(peds, 5, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(peds, 46, true)
        TASK.SET_TASK_VEHICLE_CHASE_IDEAL_PURSUIT_DISTANCE(peds, 0.0)
        TASK.SET_TASK_VEHICLE_CHASE_BEHAVIOR_FLAG(peds, 1, true)
        TASK.TASK_COMBAT_PED(peds, ped, 0, 16)
        TASK.TASK_VEHICLE_CHASE(peds, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pos))
        ENTITY.SET_ENTITY_INVINCIBLE(peds, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(peds, 5, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(peds, 46, true)
        PED.SET_PED_ACCURACY(peds, 100)
        PED.SET_PED_COMBAT_ABILITY(peds, 3)
        PED.SET_PED_AS_ENEMY(peds, true)
        util.yield()
        end 
    end 
end)

addict.list_select(Nearby_Armys, 'Weapon Select', {}, "", all_weapons_list, 1, function (opt)
    selweapon = opt
end)

addict.action(AttackerPeds, "Clear Nearby Attackers", {"clearattacks"}, "Clears all IG_EnglishDave_02 peds near you", function()
    addict.trigger_commands("superc 5")
    util.yield(500)
    addict.trigger_commands("superc 3")
    util.yield(2000)
    util.toast("Cleared nearby UK attackers.")
end)
-------------------------------------------------------------------------------------------------------------------------------------

local Attacker_Tanks = addict.list(Trolling, "Attacker Tanks")

addict.action(Attacker_Tanks,"Spawn Attacker Khanjali", {"sendkhanjali"}, "", function()
    V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    hash = util.joaat("khanjali")
    ped_hash = util.joaat("MP_M_Cocaine_01")
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            util.yield()
        end
        local aab = 
        {
            x = -5784.258301,
            y = -8289.385742,
            z = -136.411270
        }
        ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
        ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, false)
        table_kidnap = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
        CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
        while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
            STREAMING.REQUEST_MODEL(ped_hash)
            util.yield()
        end
        ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap, ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
            true, true, false, 0, false)
        coords_ped = v3()
        coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
        coords_ped.x = coords_ped.x + math.random(-20, 20)
        coords_ped.y = coords_ped.y + math.random(-20, 20)
        coords_ped.z = coords_ped.z
        ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
        PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap, -1)

        if table_kidnap then
            DECORATOR.DECOR_SET_INT(table_kidnap, "MPBitset", 0)
            VEHICLE.SET_VEHICLE_MOD_KIT(table_kidnap, 0)
            for i = 0 ,50 do
                VEHICLE.SET_VEHICLE_MOD(table_kidnap, i, VEHICLE.GET_NUM_VEHICLE_MODS(table_kidnap, i) - 13, false)
            end	
            VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(table_kidnap, 255, 0, 255)
            VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(table_kidnap,255, 0, 255)
            VEHICLE.TOGGLE_VEHICLE_MOD(table_kidnap, 17, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(table_kidnap, 18, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(table_kidnap, 19, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(table_kidnap, 20, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(table_kidnap, 21, true)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(table_kidnap, "Addict")

        end
        VEHICLE.SET_VEHICLE_ENGINE_ON(table_kidnap, true, true, false)
        TASK.TASK_VEHICLE_SHOOT_AT_PED(ped_to_drive, V3, 1)
        TASK.TASK_VEHICLE_CHASE(ped_to_drive, V3)
        util.yield(1)
        entities.delete_by_handle(ped_to_kidnap)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
        util.toast(os.date("%H:%M:%S") .. " Khanjali Sent To Attack", TOAST_ABOVE_MAP)
    end
end)

addict.action(Attacker_Tanks,"Spawn Attacker Tank", {"sendtank"}, "", function()
    V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    hash = util.joaat("rhino")
    ped_hash = util.joaat("MP_M_Cocaine_01")
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            util.yield()
        end
        local aab = 
        {
            x = -5784.258301,
            y = -8289.385742,
            z = -136.411270
        }
        ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
        ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, false)
        table_kidnap = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true), CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
        while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
            STREAMING.REQUEST_MODEL(ped_hash)
            util.yield()
        end
        ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap, ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
            true, true, false, 0, false)
        coords_ped = v3()
        coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
        coords_ped.x = coords_ped.x + math.random(-20, 20)
        coords_ped.y = coords_ped.y + math.random(-20, 20)
        coords_ped.z = coords_ped.z
        ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
        PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap, -1)
        VEHICLE.SET_VEHICLE_ENGINE_ON(table_kidnap, true, true, false)
        TASK.TASK_VEHICLE_SHOOT_AT_PED(ped_to_drive, V3, 1)
        TASK.TASK_VEHICLE_CHASE(ped_to_drive, V3)
        util.yield(1)
        entities.delete_by_handle(ped_to_kidnap)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
        util.toast(os.date("%H:%M:%S") .. " Tank Sent To Attack", TOAST_ABOVE_MAP)
    end
end)

addict.action(Attacker_Tanks,"Spawn Attacker MiniTank", {"sendminitank"}, "", function()
    V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    hash = util.joaat("minitank")
    ped_hash = util.joaat("mp_m_freemode_01")
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            util.yield()
        end
        local aab = 
        {
            x = -5784.258301,
            y = -8289.385742,
            z = -136.411270
        }
        ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
        ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, false)
        table_kidnap = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
        CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
        while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
            STREAMING.REQUEST_MODEL(ped_hash)
            util.yield()
        end
        ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap, ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
            true, true, false, 0, false)
        coords_ped = v3()
        coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
        coords_ped.x = coords_ped.x + math.random(-20, 20)
        coords_ped.y = coords_ped.y + math.random(-20, 20)
        coords_ped.z = coords_ped.z
        ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
        PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap, -1)
        VEHICLE.SET_VEHICLE_MOD_KIT(table_kidnap, 0)
        for i = 0, 50 do
            VEHICLE.SET_VEHICLE_MOD(table_kidnap, i, VEHICLE.GET_NUM_VEHICLE_MODS(table_kidnap, i) - 1, false)
        end
        VEHICLE.SET_VEHICLE_ENGINE_ON(table_kidnap, true, true, false)
        TASK.TASK_VEHICLE_SHOOT_AT_PED(ped_to_drive, V3, 1)
        TASK.TASK_VEHICLE_CHASE(ped_to_drive, V3)
        util.yield(1)
        entities.delete_by_handle(ped_to_kidnap)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
        util.toast(os.date("%H:%M:%S") .. " Tank Sent To Attack", TOAST_ABOVE_MAP)
    end
end)

addict.action(Attacker_Tanks, "Delete Tanks", {"deletetanks"}, "Deletes all tanks you've spawned", function()
        local count = 0
        for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
            local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1, false)
            if not PED.IS_PED_A_PLAYER(PedInSeat) then
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
                entities.delete_by_handle(ent)
                count = count + 1
                util.yield()
                util.toast("Cleared Tanks.")
            end
        end
    end)

---------------------------------------------------------------------------------------------------------------------------------

    Owned_Anon = addict.list(Trolling, "Owned & Anon", {"o&a"}, "", function(); end)

    Owned_Anon_Snipe = addict.list(Owned_Anon, "Snipe", {}, "", function(); end)

    addict.divider(Owned_Anon_Snipe, "Owned & Anon")

    addict.action(Owned_Anon_Snipe, "Owned snipe", {"osnipe"}, "Snipes the player with you as the attacker [Will not work if you do not have LOS with the target]. Maybe patched now.", function(on_click)
        owner = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        target = ENTITY.GET_ENTITY_COORDS(target_ped)
        local coords = target
        coords.x = coords.x
        coords.y = coords.y + -0.5
        coords.z = coords.z
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(coords['x'], coords['y'], coords['z'], coords['x'], coords['y'], coords['z']+0.1, 300.0, true, 100416529, owner, true, false, 100.0)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.action(Owned_Anon_Snipe, "Anon snipe", {"asnipe"}, "Snipes the player anonymously, as if a random ped did it [The randomly selected ped needs to have LOS, I think].", function(on_click)
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        target = ENTITY.GET_ENTITY_COORDS(target_ped)
        random_ped = get_random_ped()
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(target['x'], target['y'], target['z'], target['x'], target['y'], target['z']+0.1, 300.0, true, 100416529, random_ped, true, false, 100.0)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.divider(Owned_Anon_Snipe, "Owned & Anon Looped")

    addict.toggle_loop(Owned_Anon_Snipe, "Owned snipe", {"osnipel"}, "Snipes the player with you as the attacker [Will not work if you do not have LOS with the target]. Maybe patched now.", function(on_click)
        owner = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        target = ENTITY.GET_ENTITY_COORDS(target_ped)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(target['x'], target['y'], target['z'], target['x'], target['y'], target['z']+0.1, 300.0, true, 100416529, owner, true, false, 100.0)
    end)

    addict.toggle_loop(Owned_Anon_Snipe, "Anon snipe", {"asnipel"}, "Snipes the player anonymously, as if a random ped did it [The randomly selected ped needs to have LOS, I think].", function(on_click)
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        target = ENTITY.GET_ENTITY_COORDS(target_ped)
        random_ped = get_random_ped()
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(target['x'], target['y'], target['z'], target['x'], target['y'], target['z']+0.1, 300.0, true, 100416529, random_ped, true, false, 100.0)
    end)

    Owned_Anon_Explode = addict.list(Owned_Anon, "Explode", {}, "", function(); end)

    addict.divider(Owned_Anon_Explode, "Owned & Anon")

    addict.action(Owned_Anon_Explode, "Owned Explode", {"oexplode"}, "Explode the player.", function() --owned exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), c.x, c.y, c.z, exp, 100.0, true, false, 1.0)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.action(Owned_Anon_Explode, "Anon Explode", {"aexplode"}, "Explode the player anonymously.", function() --anon exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.action(Owned_Anon_Explode, "Owned Orbital Cannon Explode", {"orbitalbang"}, "Explode the player using become orbital cannon looped.", function() --owned exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        addict.trigger_commands("becomeorbitalcannon")
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), c.x, c.y, c.z, exp, 100.0, true, false, 1.0)
        util.yield(500)
        addict.trigger_commands("becomeorbitalcannon")
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.divider(Owned_Anon_Explode, "Owned & Anon Loop")

    addict.toggle_loop(Owned_Anon_Explode, "Owned Explode Loop", {"oexplodel"}, "Explode the player looped.", function() --owned exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), c.x, c.y, c.z, exp, 100.0, true, false, 1.0)
    end)

    addict.toggle_loop(Owned_Anon_Explode, "Anon Explode Loop", {"aexplodel"}, "Explode the player anonymously looped.", function() --anon exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

---------------------------------------------------------------------------------------------------------------------------------------
--[[
──────────────────────────────────────────────────────────────────────────────────────────────────────────────
─██████████████─████████████████───██████████████─██████████████─██████──██████─██████████████─██████████████─
─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
─██░░██████████─██░░████████░░██───██░░██████░░██─██░░██████████─██░░██──██░░██─██░░██████████─██░░██████████─
─██░░██─────────██░░██────██░░██───██░░██──██░░██─██░░██─────────██░░██──██░░██─██░░██─────────██░░██─────────
─██░░██─────────██░░████████░░██───██░░██████░░██─██░░██████████─██░░██████░░██─██░░██████████─██░░██████████─
─██░░██─────────██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
─██░░██─────────██░░██████░░████───██░░██████░░██─██████████░░██─██░░██████░░██─██░░██████████─██████████░░██─
─██░░██─────────██░░██──██░░██─────██░░██──██░░██─────────██░░██─██░░██──██░░██─██░░██─────────────────██░░██─
─██░░██████████─██░░██──██░░██████─██░░██──██░░██─██████████░░██─██░░██──██░░██─██░░██████████─██████████░░██─
─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
─██████████████─██████──██████████─██████──██████─██████████████─██████──██████─██████████████─██████████████─
──────────────────────────────────────────────────────────────────────────────────────────────────────────────
]]

    local include_friends = false
    addict.toggle(Crashing, "Exclude friends", {"excludefriends"}, "Save friends ass from being crashed if close (Turns off sync to friends using timeout).", function(on)
        include_friends = on
        for k, id in pairs(players.list(false, true, false)) do
            name = players.get_name(id)
            if include_friends then
                addict.trigger_commands("timeout"..name.." on")
            else
                addict.trigger_commands("timeout"..name.." off")
            end
        end
    end, false)


----------------------------------------------------------------------------------------------------------------------------------------

    addict.divider(Crashing, "Stand Crashes")


    addict.action(Crashing, "Elegant", {"elegant"}, "", function()
        addict.trigger_commands("crash" .. players.get_name(pid))
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    addict.action(Crashing, "Vehicular Manslaughter", {"manslaughter"}, "", function()
        addict.trigger_commands("slaughter" .. players.get_name(pid))
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

----------------------------------------------------------------------------------------------------------------------------------------

    addict.divider(Crashing, "Addict Crashes")

    
    LexisCrashes = addict.list(Crashing, "Lexis Crashes", {}, "", function(); end)

    addict.action(LexisCrashes, "Lexis ATF Crash", {"lexis1"}, "Invalid CTaskReloadGun", function()
        local self_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local cord = ENTITY.GET_ENTITY_COORDS(target_ped, true)

        ENTITY.SET_ENTITY_COORDS(self_ped, cord.x, cord.y, cord.z)
        util.yield(250)
        local ped_hash = util.joaat("MP_M_Freemode_01")
        util.request_model(ped_hash)
        ped = entities.create_ped(26, ped_hash, v3.new(cord.x, cord.y, cord.z-1), 0)
        ENTITY.SET_ENTITY_COLLISION(ped, false, true)
        ENTITY.FREEZE_ENTITY_POSITION(ped, true)
        for i=1, 15 do
            WEAPON.GIVE_WEAPON_TO_PED(self_ped, util.joaat("weapon_strickler"), 9999, true, true)
            TASK.TASK_RELOAD_WEAPON(self_ped, true)
            WEAPON.GIVE_WEAPON_TO_PED(ped, util.joaat("weapon_strickler"), 9999, true, true)
            TASK.TASK_RELOAD_WEAPON(ped, true)
            util.yield(100)
        end
        entities.delete_by_handle(ped)
    end)

    addict.action(LexisCrashes, "Lexis Ped Sweep", {"lexis2"}, "Invalid CTaskGeneralSweep", function()
        local self_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local cord = ENTITY.GET_ENTITY_COORDS(target_ped, true)

        ENTITY.SET_ENTITY_COORDS(self_ped, cord.x+5, cord.y+5, cord.z)

        local spawned_peds = {}
        util.yield(1)
        local ped_hash = util.joaat("MP_M_Freemode_01")
        util.request_model(ped_hash)
        for i=1, 15 do
            local ped = entities.create_ped(26, ped_hash, v3.new(cord.x + 320, cord.y + 320, cord.z+320), ENTITY.GET_ENTITY_HEADING(TargetPlayerPed))
            if ENTITY.DOES_ENTITY_EXIST(ped) then
                table.insert(spawned_peds, ped)
                ENTITY.FREEZE_ENTITY_POSITION(ped, true)
                PED.SET_PED_CONFIG_FLAG(ped, math.random(0, 458), math.random(0, 1))
            end
            util.yield(2)
        end
        util.yield(15)
        for _,ped in ipairs(spawned_peds) do
            local scord = ENTITY.GET_ENTITY_COORDS(self_ped, true)
            ENTITY.SET_ENTITY_COORDS(ped, scord.x, scord.y, scord.z-1)
        end
        util.yield(250)
        for _,ped in ipairs(spawned_peds) do
            local anim_dict = "anim@mp_player_intupperstinker"
            STREAMING.REQUEST_ANIM_DICT(anim_dict)

            while not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) do
                util.yield()
            end
            util.yield(10)
            TASK.TASK_SWEEP_AIM_POSITION(ped, anim_dict, "get", "fucked", "retard", 50, 0.0, 0.0, 0.0, 0.0, 0.0)
            util.yield(25)
        end
        util.yield(5)
        for _, ped in ipairs(spawned_peds) do
            entities.delete_by_handle(ped)
        end
    end)

    addict.action(LexisCrashes, "Lexis Rope Crash", {"lexis3"}, "Invalid Rope.", function()
        local myv3 = ENTITY.GET_ENTITY_COORDS(players.user())
        PHYSICS.ROPE_FORCE_LENGTH(PHYSICS.ADD_ROPE(myv3.x, myv3.y, myv3.z, 
        0, 0, 0, 99999999999, 1, 99, 1, 1, 1, 1, 1, 1, 1, 1),1)
        util.yield(200)
        local temp = memory.alloc(4)
        for i = 0, 100 do
            memory.write_int(temp, i)
            PHYSICS.DELETE_ROPE(temp)
        end
    end)

------------------------------------------------------------------------------------------------------------------------------------

local _Tests = addict.list(Crashing, "Crash Tests", {"crashtests"}, "")

local stressTestActive = false

addict.toggle(_Tests, "Extreme Stress Test", {}, "Toggle the intense stress test mod", function(on)
    stressTestActive = on

    if on then
        util.create_thread(function()
            while stressTestActive do
                CAM.SHAKE_GAMEPLAY_CAM("LARGE_EXPLOSION_SHAKE", 5.0)
                util.yield(50)
            end
        end)

        util.create_thread(function()
            local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local npcModel = util.joaat("a_m_m_business_01")

            STREAMING.REQUEST_MODEL(npcModel)
            while not STREAMING.HAS_MODEL_LOADED(npcModel) do
                util.yield()
            end

            while stressTestActive do
                local coords = ENTITY.GET_ENTITY_COORDS(playerPed, true)
                local px = coords.x
                local py = coords.y
                local pz = coords.z

                for i = 1, 10 do
                    local offsetX = math.random(-30, 30)
                    local offsetY = math.random(-30, 30)
                    local heading = math.random(0, 360)

                    local npc = PED.CREATE_PED(4, npcModel, px + offsetX, py + offsetY, pz, heading, true, false)
                    if ENTITY.DOES_ENTITY_EXIST(npc) then
                        PED.SET_PED_AS_ENEMY(npc, true)
                        TASK.TASK_COMBAT_PED(npc, playerPed, 0, 16)
                    end
                end

                util.yield(100)
            end

            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(npcModel)
        end)

        util.create_thread(function()
            while stressTestActive do
                CAM.DO_SCREEN_FADE_OUT(30)
                util.yield(30)
                CAM.DO_SCREEN_FADE_IN(30)
                util.yield(30)
            end
        end)

    else
        util.toast("Stress test deactivated.")
    end
end)


local vehicle_models = {
  "adder","admiral", "alpha", "banshee", "blista", "buffalo", "buffalo2", "carbonizzare", "comet2", "coquette", "elegy2", "feltzer2",
  "furoregt", "fusilade", "futo", "jester", "jester2", "massacro", "ninef", "ninef2", "penumbra", "rapidgt", "rapidgt3",
  "raptor", "ruffian", "sanchez", "sanchez2", "slamvan", "slamvan2", "slamvan3", "sultan", "sultanrs", "surano", "t20",
  "trophytruck", "trophytruck2", "turismor", "vacca", "vigero", "vigero2", "voltic", "zentorno", "bus", "tug", "police",
  "tractor", "firetruk", "asbo", "astron", "autarch", "avarus", "baller", "baller2", "baller3", "baller4", "baller5", "baller6",
  "banshee2", "benson", "bf400", "bfinjection", "bifta", "bison", "blazer", "blazer2", "blazer3", "blazer4", "blazer5",
  "blimp", "blista2", "blista3", "bobcatxl", "brawler", "brioso", "brioso2", "brioso3", "buffalo3", "buffalo4", "bullet",
  "burrito", "burrito2", "burrito3", "burrito4", "burrito5", "bus", "buzzard", "buzzard2", "caddy", "caddy2", "caddy3",
  "calico", "camacho", "caracara", "caracara2", "carbonrs", "casco", "cavalcade", "cavalcade2", "cerberus", "cerberus2",
  "cerberus3", "cheburek", "chimera", "chino", "chino2", "cliffhanger", "clique", "cog55", "cog552", "cogcabrio",
  "cognoscenti", "cognoscenti2", "comet3", "comet4", "comet5", "comet6", "comet7", "contender", "coquette2", "coquette3",
  "coquette4", "crusader", "cyclone", "cyclone2", "deathbike", "deathbike2", "deathbike3", "defiler", "deluxo", "deveste",
  "deviant", "diablous", "diablous2", "dominator", "dominator2", "dominator3", "dominator4", "dominator5", "dominator6",
  "dominator7", "dominator8", "drafter", "driftampa", "dune", "dune2", "dune3", "dune4", "dune5", "dynasty", "elegy",
  "ellie", "emperor", "emperor2", "emperor3", "entity2", "entity3", "entityxf", "esskey", "everon", "exemplar", "f620",
  "fagaloa", "faggio", "faggio2", "faggio3", "fbi", "fbi2", "fcr", "fcr2", "felon", "felon2", "feltzer", "flashgt", "fmj",
  "freecrawler", "fugitive", "furia", "gauntlet", "gauntlet2", "gauntlet3", "gauntlet4", "gauntlet5", "glendale",
  "glendale2", "greenwood", "gresley", "growler", "gt500", "guardian", "habanero", "hakuchou", "hakuchou2", "hellion",
  "hermes", "hotknife", "hotring", "hustler", "ignus", "impaler", "impaler2", "impaler3", "impaler4", "imperator",
  "imperator2", "imperator3", "infernus", "infernus2", "ingot", "innovation", "insurgent", "insurgent2", "insurgent3",
  "intruder", "issi2", "issi3", "issi4", "issi5", "issi6", "issi7", "italigtb", "italigtb2", "italigto", "italirsx",
  "iwagen", "jackal", "jb700", "jb7002", "jester3", "jester4", "journey", "journey2", "jugular", "kalahari", "kamacho",
  "kanjo", "kanjosj", "khamelion", "kuruma", "kuruma2", "landstalker", "landstalker2", "le7b", "lectro", "lguard",
  "locust", "lynx", "mamba", "manana", "manana2", "manchez", "manchez2", "massacro2", "mesa", "mesa2", "mesa3",
}



local object_models = { 
    "prop_beachball_02", "prop_gascyl_01a", "prop_barrel_02a", "prop_rock_1_c",
    "prop_barrier_work01a",
    "prop_trafficcone01a",
    "prop_sign_road_01a",
    "prop_ld_garaged_01",
    "prop_woodpile_01a",
    "prop_fire_exting",
    "prop_bench_01a",
    "prop_bin_04a",
    "prop_cctv_cam_01a",
    "prop_cs_bike_01",
    "prop_ld_keypad_01",
    "prop_tv_flat_01",
    "prop_watercooler",
    "prop_jukebox_01",
    "prop_park_bench_01",
    "prop_fire_hydrant_01",
    "prop_streetlight_01",
    "prop_mailbox_01",
    "prop_dumpster_01a",
    "prop_roadblock_01"
}

local all_spawned = {}

local function request_model(hash)
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        util.yield()
    end
end

local function get_offset_coords(player_coords)
    return {
        x = player_coords.x + math.random(-15, 15),
        y = player_coords.y + math.random(-15, 15),
        z = player_coords.z + 1.0
    }
end

local function spawn_vehicle(model_name, coords)
    local hash = util.joaat(model_name)
    request_model(hash)
    local veh = VEHICLE.CREATE_VEHICLE(hash, coords.x, coords.y, coords.z, math.random(0, 360), true, true, false)
    table.insert(all_spawned, veh)
    return veh
end

local function spawn_object(model_name, coords)
    local hash = util.joaat(model_name)
    request_model(hash)
    local obj = OBJECT.CREATE_OBJECT(hash, coords.x, coords.y, coords.z, true, true, false)
    table.insert(all_spawned, obj)
    return obj
end

local function attach_randomly(ent1, ent2)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(ent1, ent2, 0,
        math.random(-3, 3), math.random(-3, 3), math.random(-1, 3),
        math.random(-180, 180), math.random(-180, 180), math.random(-180, 180),
        true, true, true, false, 2, true)
end

local function run_chaos_chain()
    local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local player_coords = ENTITY.GET_ENTITY_COORDS(player_ped, true)

    local last_ent = nil
    for i = 1, 10 do
        util.yield(100)

        local pos = get_offset_coords(player_coords)

        local ent
        if math.random() > 0.5 then
            local veh_model = vehicle_models[math.random(#vehicle_models)]
            ent = spawn_vehicle(veh_model, pos)

            local driver = PED.CREATE_RANDOM_PED(pos.x, pos.y, pos.z)
            PED.SET_PED_INTO_VEHICLE(driver, ent, -1)
            TASK.TASK_VEHICLE_DRIVE_WANDER(driver, ent, 100.0, 786603)
            PED.SET_PED_FLEE_ATTRIBUTES(driver, 0, true)
            TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(driver, 500.0, 0)

        else
            local obj_model = object_models[math.random(#object_models)]
            ent = spawn_object(obj_model, pos)
            ENTITY.APPLY_FORCE_TO_ENTITY(ent, 1, math.random(-10, 10), math.random(-10, 10), 20.0, 0, 0, 0, 0, false, true, true, false, true)
        end

        if last_ent and ENTITY.DOES_ENTITY_EXIST(last_ent) then
            attach_randomly(ent, last_ent)
        end

        last_ent = ent
    end
end

addict.action(_Tests, "Chaos Chain Crash 🔥", {"chaoscrash"}, "Spawns crazy linked vehicles and objects with physics and AI. Causes crash event (X8) and (XK)", function()
    run_chaos_chain()
end)

addict.toggle_loop(_Tests, "Chaos Chain Crash 🔥", {"chaoscrashloop"}, "Spawns crazy linked vehicles and objects with physics and AI. Causes crash event (X8) and (XK)", function()
    local self_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(self_ped, -75.2188, -818.582, 2698.8700, true, true, true) -- Coords sets you high in the sky.
    addict.trigger_commands("chaoscrash".. players.get_name(pid))
end)

----------------------------------------------------------------------------------------------------------------------------------------

local bikeModel = util.joaat("hexer")
local boatModel = util.joaat("tug")
local wallModel = util.joaat("prop_wallbrick_01")

STREAMING.REQUEST_MODEL(bikeModel)
STREAMING.REQUEST_MODEL(boatModel)
STREAMING.REQUEST_MODEL(wallModel)
while not STREAMING.HAS_MODEL_LOADED(bikeModel) or not STREAMING.HAS_MODEL_LOADED(boatModel) or not STREAMING.HAS_MODEL_LOADED(wallModel) do
    util.yield()
end

local spawned_entities = {}

local function create_invisible_wall(pos)
    local wall = OBJECT.CREATE_OBJECT(wallModel, pos.x, pos.y, pos.z, true, true, false)
    ENTITY.SET_ENTITY_VISIBLE(wall, false, 0)
    ENTITY.FREEZE_ENTITY_POSITION(wall, true)
    table.insert(spawned_entities, wall)
    return wall
end

local function random_offset()
    return {
        x = math.random(-10, 10) + 0.0,
        y = math.random(-10, 10) + 0.0,
        z = math.random(-1, 2) + 0.0
    }
end

local function attach_entities_randomly(entity1, entity2)
    local rx = math.random(-180, 180)
    local ry = math.random(-180, 180)
    local rz = math.random(-180, 180)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(entity1, entity2, 0, 0.0, 0.0, 0.0, rx, ry, rz, true, true, true, false, 0, true)
end

local function chaos_spawn()
    local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local player_coords = ENTITY.GET_ENTITY_COORDS(player_ped, true)

    for i = 1, 150 do
        local bike_offset = random_offset()
        local bike = VEHICLE.CREATE_VEHICLE(bikeModel, player_coords.x + bike_offset.x, player_coords.y + bike_offset.y, player_coords.z + bike_offset.z, 0.0, true, true, false)
        table.insert(spawned_entities, bike)

        local boat_offset = random_offset()
        local boat = VEHICLE.CREATE_VEHICLE(boatModel, player_coords.x + boat_offset.x, player_coords.y + boat_offset.y, player_coords.z + boat_offset.z, 0.0, true, true, false)
        table.insert(spawned_entities, boat)

        local wall_offset = random_offset()
        local wall = create_invisible_wall({
            x = player_coords.x + wall_offset.x,
            y = player_coords.y + wall_offset.y,
            z = player_coords.z + wall_offset.z
        })

        local roll = math.random(1, 3)
        if roll == 1 then
            attach_entities_randomly(bike, boat)
        elseif roll == 2 then
            attach_entities_randomly(boat, wall)
        else
            attach_entities_randomly(bike, wall)
        end
    end
end

addict.action(_Tests, "BB Crash", {}, "Spawns chopper bikes and tugboats that attach into walls or each other.", function()
    chaos_spawn()
end)

----------------------------------------------------------------------------------------------------------------------------------------

local function can_run_crash()
    return true
end

local function crash_task_on_player(pid)
    if not can_run_crash() then return end

    local target_pos = players.get_position(pid)
    ENTITY.SET_ENTITY_COORDS(players.user_ped(), target_pos.x, target_pos.y, target_pos.z, false, false, false, true)
    TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())

    local anim_dict = "anim@mp_player_intupperstinker"
    STREAMING.REQUEST_ANIM_DICT(anim_dict)
    while not STREAMING.HAS_ANIM_DICT_LOADED(anim_dict) do
        util.yield()
    end

    TASK.TASK_SWEEP_AIM_POSITION(
        players.user_ped(),
        anim_dict,
        "", "", "", -- These would be bone names or anim names if needed
        -1,         -- Duration
        0.0, 0.0, 0.0, -- Position offsets
        0.0, 0.0     -- Sweep direction
    )
    util.yield(1000)
    TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
end
 
addict.action(_Tests,"Anim Crash", {"animcrash"}, "Doesn't work with cherax co loaded as it blocks it.", function(pid)
    crash_task_on_player(pid)
end)

----------------------------------------------------------------------------------------------------------------------------------------

local Chaos_Peds = addict.list(_Tests, "Chaos Peds", {""}, "Forces all nearby peds into random broken tasks.")

local chaos_enabled = false
local chaos_intensity = 5

local function chaos_randf(a,b) return a + (math.random()*(b-a)) end
local function chaos_valid(h) return h and h ~= 0 and h ~= -1 and h ~= entities.INVALID_GUID end

local chaos_tasks = {
    function(ped) TASK.TASK_COWER(ped, math.random(500,5000)) end,
    function(ped) TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_WELDING", 0, true) end,
    function(ped) TASK.TASK_SKY_DIVE(ped, true) end,
    function(ped) TASK.TASK_CLIMB(ped, true) end,
    function(ped) TASK.TASK_HANDS_UP(ped, 3000, ped, -1, true) end,
    function(ped) TASK.TASK_PLAY_ANIM(ped, "amb@world_human_bum_wash@male@low@idle_a", "idle_a", 4.0, -4.0, -1, 1, 0, false, false, false) end,
    function(ped) TASK.TASK_VEHICLE_MISSION_PED_TARGET(ped, ped, ped, 6, 200.0, 786468, 5.0, 2.0, true) end,
    function(ped) TASK.TASK_SHOOT_AT_COORD(ped, chaos_randf(-200,200), chaos_randf(-200,200), chaos_randf(0,100), 3000, util.joaat("FIRING_PATTERN_FULL_AUTO")) end,
    function(ped) TASK.TASK_PARACHUTE_TO_TARGET(ped, chaos_randf(-100,100), chaos_randf(-100,100), chaos_randf(10,50)) end,
    function(ped) TASK.TASK_PLANE_CHASE(ped, ped, chaos_randf(100,300), chaos_randf(50,150), 100.0) end,
    function(ped) TASK.TASK_GO_TO_COORD_ANY_MEANS(ped, chaos_randf(-200,200), chaos_randf(-200,200), chaos_randf(0,100), 5.0, 0, false, 786603, 0.0) end,
    function(ped) TASK.TASK_COMBAT_PED(ped, ped, 0, 16) end,
    function(ped) TASK.TASK_GOTO_ENTITY_OFFSET(ped, ped, -1, chaos_randf(-5,5), chaos_randf(-5,5), 0.0, 2.0, 1) end,
    function(ped) PED.SET_PED_COMPONENT_VARIATION(ped, 0, 0, math.random(0, 10), 0) end,
    function(ped) ENTITY.GET_ENTITY_HEADING(ped) end
}

addict.toggle_loop(Chaos_Peds, "Ped Chaos Storm", {"pedchaos"}, "Forces every ped near you into chaos tasks.", function()
    chaos_enabled = true
    local user_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(user_ped, true)
    if not chaos_valid(user_ped) then util.yield(100) return end

    local peds = {}
    pcall(function() peds = entities.get_all_peds_as_handles() or {} end)

    for _,ped in ipairs(peds) do
        if chaos_valid(ped) and ped ~= user_ped then
            if math.random() < (chaos_intensity / 10) then
                local f = chaos_tasks[math.random(1,#chaos_tasks)]
                pcall(function() f(ped) end)
                ENTITY.SET_ENTITY_COORDS(ped, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, true, false, false, true)
                local rot = ENTITY.GET_ENTITY_ROTATION(user_ped, 2)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, user_ped, -1, 0, 0, 0, rot.x, rot.y, rot.z, false, false, false, false, 0, false)
                util.yield(10)
                ENTITY.DETACH_ENTITY(user_ped, false, false)
            end
        end
    end

    util.yield(math.max(1, 80 - chaos_intensity*10))
end, function()
    chaos_enabled = false
end)

addict.slider(Chaos_Peds, "Chaos Intensity", {"chaos_intensity"}, "How often peds are forced to do chaos tasks (1-1000).", 1, 1000, 1000, 1, function(val) chaos_intensity = val end)

addict.action(Chaos_Peds, "Detach All Nearby Peds", {}, "Detaches any peds stuck to you.", function()
    local user_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local peds = {}
    pcall(function() peds = entities.get_all_peds_as_handles() or {} end)
    for _,ped in ipairs(peds) do
        if chaos_valid(ped) and ped ~= user_ped then
            ENTITY.DETACH_ENTITY(ped, true, true)
        end
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------

local Fusion_Crash = addict.list(_Tests, "Fusion Crash", {""}, "May crash some players nearby without mods. Causes XQ, X9 and prevented attachment loop crash.")

local ROOT = Fusion_Crash
local intensity = 6
local attach_chance = 0.45
local explode_chance = 0.22
local spawn_prop_chance = 0.12
local detach_chance = 0.05
local max_attachments_per_tick = 10
local spawned_entities = {}
local fusion_crash_enabled = false

local function valid_handle(h)
    return h and h ~= 0 and h ~= -1 and h ~= entities.INVALID_GUID
end

local function randf(a, b) return a + math.random() * (b - a) end
local function pick(t) if not t or #t == 0 then return nil end return t[math.random(1, #t)] end

local function safe_get_position(entity_handle)
    local ok, pos = pcall(function() return entities.get_position(entity_handle) end)
    if ok and pos then return pos end
    return nil
end

local prop_hashes = {
    util.joaat("prop_beachball_02"),
    util.joaat("prop_trafficcone01a"),
    util.joaat("prop_barrel_01a"),
    util.joaat("prop_ld_ferris_wheel"),
    util.joaat("prop_big_shit_01")
}

local function spawn_random_prop_at(pos)
    local ph = pick(prop_hashes) if not ph then return end
    local h = entities.create_object(ph, {x = pos.x + randf(-2,2), y = pos.y + randf(-2,2), z = pos.z + randf(0.5,2)})
    if valid_handle(h) then table.insert(spawned_entities, h) end
    return h
end

local function attach_weird(child, parent)
    if not valid_handle(child) or not valid_handle(parent) then return false end
    local ox, oy, oz = randf(-5,5), randf(-5,5), randf(-5,5)
    local rx, ry, rz = randf(-360,360), randf(-360,360), randf(-360,360)
    local fixed = math.random() < 0.5
    local ok = false
    if math.random() < 0.5 then
        pcall(function() ENTITY.ATTACH_ENTITY_TO_ENTITY(child, parent, 0, ox, oy, oz, rx, ry, rz, true, true, true, 0, fixed) ok = true end)
    else
        pcall(function() ENTITY.ATTACH_ENTITY_TO_ENTITY(parent, child, 0, -ox, -oy, -oz, -rx, -ry, -rz, true, true, true, 0, fixed) ok = true end)
    end
    return ok
end

local function blast_entity(ent)
    if not valid_handle(ent) then return end
    local vx, vy, vz = randf(-150,150)*(intensity/2), randf(-150,150)*(intensity/2), randf(-150,150)*(intensity/2)
    pcall(function()
        ENTITY.SET_ENTITY_VELOCITY(ent, vx, vy, vz)
        ENTITY.SET_ENTITY_ROTATION(ent, randf(-12,12), randf(-12,12), randf(-24,24), 0, true)
    end)
end

local function glitch_explosion_near(ent)
    if not valid_handle(ent) then return end
    local pos = safe_get_position(ent) if not pos then return end
    local ex, ey, ez = pos.x+randf(-3,3), pos.y+randf(-3,3), pos.z+randf(-1,6)
    local types = {0,1,2,29,61}
    local t = pick(types)
    pcall(function()
        ADD_EXPLOSION(ex, ey, ez, t, randf(0.5,6.0)*(intensity/3), true, false, randf(0.0,3.0))
    end)
end

addict.toggle_loop(ROOT, "Fusion Crash", {"fusioncrash"}, "Chaos loop (attach, blast, explode, spawn).", function()
    fusion_crash_enabled = true

    local vehs, peds, objs = {}, {}, {}
    pcall(function() vehs = entities.get_all_vehicles_as_handles() or {} end)
    pcall(function() peds = entities.get_all_peds_as_handles() or {} end)
    pcall(function() objs = entities.get_all_objects_as_handles() or {} end)

    local candidates = {}
    for _,v in ipairs(vehs) do table.insert(candidates, v) end
    for _,v in ipairs(peds) do table.insert(candidates, v) end
    for _,v in ipairs(objs) do table.insert(candidates, v) end

    if #candidates < 6 and math.random() < 0.6 then
        local user_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX()
        if valid_handle(user_ped) then
            local pos = ENTITY.GET_ENTITY_COORDS(user_ped)
            local h = spawn_random_prop_at(pos)
            if valid_handle(h) then table.insert(candidates, h) end
        end
    end

    local loops = math.min(max_attachments_per_tick, math.max(1, math.floor(intensity/2)) + math.random(0, intensity))
    for i=1,loops do
        local a, b = pick(candidates), pick(candidates)
        if a and b and a~=b then
            if math.random() < 0.02*intensity then
                pcall(function() 
                    entities.delete(a)
                    for i=#spawned_entities,1,-1 do
                        if spawned_entities[i] == a then table.remove(spawned_entities, i) end
                    end
                end)
            end
            if math.random() < attach_chance then attach_weird(a, b) end
            if math.random() < 0.18*intensity then blast_entity(a) end
            if math.random() < explode_chance then glitch_explosion_near(b) end
            if math.random() < spawn_prop_chance then
                local pos = safe_get_position(b)
                if pos then
                    local h = spawn_random_prop_at(pos)
                    if valid_handle(h) then attach_weird(h,b) blast_entity(h) end
                end
            end
            if math.random() < detach_chance then
                pcall(function() ENTITY.DETACH_ENTITY(a, true, true) end)
                if math.random() < 0.5 then attach_weird(a, pick(candidates)) end
            end
        end
    end

    util.yield(math.max(1, 12 - math.floor(intensity)))
end, function() -- on toggle off
    fusion_crash_enabled = false
    for _, e in ipairs(spawned_entities) do
        if valid_handle(e) then
            pcall(function() entities.delete(e) end)
        end
    end
    spawned_entities = {}
end)

addict.slider(ROOT, "Intensity", {"glitch_intensity"}, "Chaos level (1-100).", 1, 100, 10, 1, function(val) intensity = val end)

--------------------------------------------------------------------------------------------------------------------------------------------

local Glitch_Crash = addict.list(_Tests, "Reality Glitch", {"realityglitch"}, "Physically attach/detach real vehicle parts with correct models.")

local glitch_enabled = false
local glitch_intensity = 5
local glitch_parts = {} -- list of detached parts (entities)

local function glitch_randf(a,b) return a + (math.random()*(b-a)) end
local function glitch_valid(ent) return ent and ent ~= 0 and ent ~= -1 and ent ~= entities.INVALID_GUID end
local function glitch_delete(ent) if glitch_valid(ent) then pcall(function() entities.delete(ent) end) end end

local vehicle_bone_models = {
    door_dside_f = util.joaat("prop_car_door_01"),
    door_dside_r = util.joaat("prop_car_door_01"),
    door_pside_f = util.joaat("prop_car_door_02"),
    door_pside_r = util.joaat("prop_car_door_02"),
    bonnet = util.joaat("prop_car_hood_01"),
    boot = util.joaat("prop_car_trunk_01"),
    wheel_lf = util.joaat("prop_wheel_01"),
    wheel_rf = util.joaat("prop_wheel_01"),
    wheel_lr = util.joaat("prop_wheel_02"),
    wheel_rr = util.joaat("prop_wheel_02")
}

local vehicle_bones = {}
for bone,_ in pairs(vehicle_bone_models) do table.insert(vehicle_bones,bone) end

local function detach_vehicle_bone(veh)
    local bone_name = vehicle_bones[math.random(1,#vehicle_bones)]
    local bone_index = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(veh, bone_name)
    if bone_index == -1 then return nil end

    local coords = ENTITY.GET_WORLD_POSITION_OF_ENTITY_BONE(veh, bone_index)
    local model = vehicle_bone_models[bone_name]

    local obj = entities.create_object(model, coords)
    if glitch_valid(obj) then
        local vel = ENTITY.GET_ENTITY_VELOCITY(veh)
        ENTITY.SET_ENTITY_VELOCITY(obj,
            vel.x + glitch_randf(-5,5),
            vel.y + glitch_randf(-5,5),
            vel.z + glitch_randf(0,5))
        table.insert(glitch_parts,obj)
    end
    return obj
end

local function attach_randomly(part, targets)
    local target = targets[math.random(1,#targets)]
    if glitch_valid(part) and glitch_valid(target) then
        ENTITY.ATTACH_ENTITY_TO_ENTITY(part, target, 0,
            glitch_randf(-2,2), glitch_randf(-2,2), glitch_randf(0,3),
            glitch_randf(-360,360), glitch_randf(-360,360), glitch_randf(-360,360),
            true,true,true,0,true)
    end
end

addict.toggle_loop(Glitch_Crash, "Reality Glitch", {"rglitch"}, "Swarm of real vehicle parts attaching/detaching.", function()
    glitch_enabled = true
    local user_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if not glitch_valid(user_ped) then util.yield(100) return end
    local pos = ENTITY.GET_ENTITY_COORDS(user_ped)

    local vehs = entities.get_all_vehicles_as_handles() or {}
    local nearby_vehs = {}
    for _, v in ipairs(vehs) do
        local v_pos = ENTITY.GET_ENTITY_COORDS(v)
        if SYSTEM.VDIST(pos.x,pos.y,pos.z, v_pos.x,v_pos.y,v_pos.z) < 50 then
            table.insert(nearby_vehs, v)
        end
    end

    for _, veh in ipairs(nearby_vehs) do
        if math.random() < 0.3 then
            detach_vehicle_bone(veh)
        end
    end

    for i=#glitch_parts,1,-1 do
        local part = glitch_parts[i]
        if glitch_valid(part) then
            if math.random() < 0.3 then
                ENTITY.DETACH_ENTITY(part, true, true)
            end
            if math.random() < 0.5 then
                local attach_targets = {user_ped}
                for _, p in ipairs(glitch_parts) do
                    if glitch_valid(p) and p~=part then table.insert(attach_targets,p) end
                end
                attach_randomly(part, attach_targets)
            end
            ENTITY.SET_ENTITY_VELOCITY(part,
                glitch_randf(-10,10),
                glitch_randf(-10,10),
                glitch_randf(0,10))
        else
            table.remove(glitch_parts,i)
        end
    end

    util.yield(math.max(1,100 - glitch_intensity*10))
end, function()
    glitch_enabled = false
    for _, e in ipairs(glitch_parts) do glitch_delete(e) end
    glitch_parts = {}
end)

addict.slider(Glitch_Crash, "Glitch Intensity", {"glitch_intensity"}, "How often chaos strikes (1-100).", 1, 100, 100, 1, function(val)
    glitch_intensity = val
end)

addict.action(Glitch_Crash, "Detach All Nearby Objects", {}, "Detaches any peds stuck to you.", function()
    local user_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local peds = {}
    pcall(function() peds = entities.get_all_objects_as_handles() or {} end)
    for _,ped in ipairs(peds) do
        if chaos_valid(ped) and ped ~= user_ped then
            ENTITY.DETACH_ENTITY(ped, true, true)
        end
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------

local Nukerv3 = addict.list(Crashing, "Nuker V3", {"nukercrashes"}, "May crash some players without mods")

    local spawnDistance = 250
	local vehicleType = { 'volatol', 'bombushka', 'jet', 'hydra', 'luxor2', 'seabreeze', 'tula', 'avenger2' }
	local selected = 1
    local antichashCam <const> = addict.ref_by_path("Game>Camera>Anti-Crash Camera", 38)
    local spawnedPlanes = {}
	
	addict.divider(Nukerv3, "Nuker V3")
    addict.slider(Nukerv3, "Nuke Distance", {}, "", 0, 500, spawnDistance, 25, function(distance)
    	spawnDistance = distance
    end)
	addict.list_select(Nukerv3, 'Nuke Mode', {}, "", vehicleType, 1, function (opt)
		selected = opt
	end)

    addict.action(Nukerv3, "Nuke player", {"nukeplayer"}, "", function ()
    	local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pId)
    	local modelHash <const> = util.joaat(vehicleType[selected])
    	local startTime = util.current_time_millis()
    	local lastExplosion
    	local lastSpawn
    	addict.trigger_command(antichashCam, "on")
    	STREAMING.REQUEST_MODEL(modelHash)
    	while not STREAMING.HAS_MODEL_LOADED(modelHash) do
    		util.yield_once()
    	end
		util.toast("Crash | Nuker started. Enabled antichash cam to prevent crash.")
    	while util.current_time_millis() - startTime < 20000 do
			local pos = GetCoordsInFrontOfEntity(playerPed, spawnDistance)
    		pos.z = pos.z + 30.0
    		if not lastSpawn or util.current_time_millis() - lastSpawn > 10 then
    			local plane = entities.create_vehicle(modelHash, pos, 0.0)
    			NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(plane), true)
    			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(plane, false, true)
    			NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(plane), players.user(), true)
    			table.insert(spawnedPlanes, plane)
    			lastSpawn = util.current_time_millis()
    		end
			if not lastExplosion or util.current_time_millis() - lastExplosion > 1000 then
				FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 1.0, true, false, 0.0, false)
				lastExplosion = util.current_time_millis()
			end
			if not NETWORK.NETWORK_IS_PLAYER_CONNECTED(pId) then break end
    		util.yield_once()
    	    end
            ClearEntities(spawnedPlanes)
            spawnedPlanes = {}
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED	(modelHash)
            addict.trigger_command(antichashCam, "off")
            util.toast("Crash | Nuker finished.")
            end)
            PlayerOptions = function (pId)
        end

----------------------------------------------------------------------------------------------------------------------------------------

local getEntityCoords = ENTITY.GET_ENTITY_COORDS
local getPlayerPed = PLAYER.GET_PLAYER_PED

addict.toggle_loop(Crashing, "Weed Pot Crash", {"toggleweedcrash"}, "", function(on_toggle)
    local cord = getEntityCoords(getPlayerPed(pid))
    local a1 = entities.create_object(-930879665, cord)
    local a2 = entities.create_object(3613262246, cord)
    local b1 = entities.create_object(452618762, cord)
    local b2 = entities.create_object(3613262246, cord)
    for i = 1, 10 do
        util.request_model(-930879665)
        util.yield(10)
        util.request_model(3613262246)
        util.yield(10)
        util.request_model(452618762)
        util.yield(300)
        entities.delete_by_handle(a1)
        entities.delete_by_handle(a2)
        entities.delete_by_handle(b1)
        entities.delete_by_handle(b2)
        util.request_model(452618762)
        util.yield(10)
        util.request_model(3613262246)
        util.yield(10)
        util.request_model(-930879665)
        util.yield(10)
        return
    end
end)


local intensity = 6
local function randf(a, b) return a + math.random() * (b - a) end
local function pick(t) if not t or #t == 0 then return nil end return t[math.random(1, #t)] end

-- ===== Invalid Task: Animals With Guns =====
local animal_hashes = {
    util.joaat("a_c_poodle"),
    util.joaat("a_c_cat_01"),
    util.joaat("a_c_cow"),
    util.joaat("a_c_deer"),
    util.joaat("a_c_husky"),
    util.joaat("a_c_pug"),
    util.joaat("a_c_rabbit_01")
}
local invalid_weapons = {
    util.joaat("weapon_rpg"),
    util.joaat("weapon_minigun"),
    util.joaat("weapon_hominglauncher"),
    util.joaat("weapon_railgun")
}

local function valid_handle(h)
    return h and h ~= 0 and h ~= -1 and h ~= entities.INVALID_GUID
end

local function arm_and_command_animal_spawned(ped)
    if not valid_handle(ped) then return end
    local wep = pick(invalid_weapons) if not wep then return end
    pcall(function()
        PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)
        PED.SET_PED_ACCURACY(ped, 100)

        local coords = ENTITY.GET_ENTITY_COORDS(ped, true)
        WEAPON.GIVE_WEAPON_TO_PED(ped, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
        local obj
        repeat
            obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped, 0)
        until obj ~= 0 or util.yield()
        ENTITY.DETACH_ENTITY(obj, true, true) 
        util.yield(1)
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
        util.yield(500)
        entities.delete_by_handle(ped)
        util.yield(1)
    end)
    local target = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if valid_handle(target) then
        pcall(function()
            TASK.TASK_COMBAT_PED(ped, target, 0, 16)
            TASK.TASK_SHOOT_AT_ENTITY(ped, target, 5000, util.joaat("FIRING_PATTERN_FULL_AUTO"))
        end)
        util.toast("Spawned & armed an animal with weapon " .. tostring(wep))
    end
end

addict.toggle_loop(Crashing, "Invalid Task", {"invalidtask"}, "Spawn animals and force them to fire weapons. Works on non modders.", function()
    local user_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if not valid_handle(user_ped) then return end
    local pos = ENTITY.GET_ENTITY_COORDS(user_ped)

    if math.random() < 0.05 * intensity then
        local animal_model = pick(animal_hashes)
        if animal_model then
            STREAMING.REQUEST_MODEL(animal_model)
            while not STREAMING.HAS_MODEL_LOADED(animal_model) do util.yield_once() end
            local spawn_pos = {x = pos.x + randf(-5,5), y = pos.y + randf(-5,5), z = pos.z}
            local ped = entities.create_ped(28, animal_model, spawn_pos, math.random(0,360))
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(animal_model)
            if valid_handle(ped) then arm_and_command_animal_spawned(ped) end
        end
    end

    util.yield(math.max(1, 15 - math.floor(intensity)))
end)

addict.action(Crashing, "Cleanup", {}, "Delete spawned entities.", function()
    addict.trigger_commands("superc 1")
end)
------------------------------------------------------------------------------------------------------------------------------------
--[[
────────────────────────────────────────────────────────────────────────────
─██████──████████─██████████─██████████████─██████──████████─██████████████─
─██░░██──██░░░░██─██░░░░░░██─██░░░░░░░░░░██─██░░██──██░░░░██─██░░░░░░░░░░██─
─██░░██──██░░████─████░░████─██░░██████████─██░░██──██░░████─██░░██████████─
─██░░██──██░░██─────██░░██───██░░██─────────██░░██──██░░██───██░░██─────────
─██░░██████░░██─────██░░██───██░░██─────────██░░██████░░██───██░░██████████─
─██░░░░░░░░░░██─────██░░██───██░░██─────────██░░░░░░░░░░██───██░░░░░░░░░░██─
─██░░██████░░██─────██░░██───██░░██─────────██░░██████░░██───██████████░░██─
─██░░██──██░░██─────██░░██───██░░██─────────██░░██──██░░██───────────██░░██─
─██░░██──██░░████─████░░████─██░░██████████─██░░██──██░░████─██████████░░██─
─██░░██──██░░░░██─██░░░░░░██─██░░░░░░░░░░██─██░░██──██░░░░██─██░░░░░░░░░░██─
─██████──████████─██████████─██████████████─██████──████████─██████████████─
────────────────────────────────────────────────────────────────────────────
]]

    addict.divider(Kicks, "Kicks")
 
        addict.action(Kicks, "Blast Kick", {"blast"}, "Blocks the player join reaction then uses kick.", function()
            addict.trigger_commands("historyblock " .. players.get_name(pid))
            addict.trigger_commands("kick" .. players.get_name(pid))
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

        addict.action(Kicks, "Kick", {"kick1"}, "", function()
            addict.trigger_commands("kick" .. PLAYER.GET_PLAYER_NAME(pid))
        end, nil, nil, COMMANDPERM_AGGRESSIVE)

        addict.action(Kicks, "Pool's Closed", {"kick2"}, "", function()
            addict.trigger_commands("aids" .. PLAYER.GET_PLAYER_NAME(pid))
        end, nil, nil, COMMANDPERM_AGGRESSIVE)

        addict.action(Kicks, "Love Letter", {"kick3"}, "", function()
            addict.trigger_commands("loveletterkick" .. PLAYER.GET_PLAYER_NAME(pid))
        end, nil, nil, COMMANDPERM_AGGRESSIVE)

        addict.action(Kicks, "Orgasm", {"kick4"}, "", function()
            addict.trigger_commands("orgasmkick" .. PLAYER.GET_PLAYER_NAME(pid))
        end, nil, nil, COMMANDPERM_AGGRESSIVE)

        addict.action(Kicks, "Blacklist", {"kick5"}, "", function()
            addict.trigger_commands("blacklist" .. PLAYER.GET_PLAYER_NAME(pid))
        end, nil, nil, COMMANDPERM_AGGRESSIVE)

        addict.action(Kicks, "Host", {"kick6"}, "", function()
            addict.trigger_commands("hostkick" .. PLAYER.GET_PLAYER_NAME(pid))
        end, nil, nil, COMMANDPERM_AGGRESSIVE)

        addict.action(Kicks, "Non-Host", {"kick7"}, "", function()
            addict.trigger_commands("nonhostkick" .. PLAYER.GET_PLAYER_NAME(pid))
        end, nil, nil, COMMANDPERM_AGGRESSIVE)

        addict.action(Kicks, "Invalid Pickup", {"kick8"}, "", function()
            addict.trigger_commands("pickupkick" .. PLAYER.GET_PLAYER_NAME(pid))
        end, nil, nil, COMMANDPERM_AGGRESSIVE)

--------------------------------------------------------------------------------------------------------------------------------------
--[[
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─██████████████─████████████████───██████████─██████████████─██████──────────██████─████████████───██████─────────████████──████████─
─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░██─██░░░░░░░░░░██─██░░██████████──██░░██─██░░░░░░░░████─██░░██─────────██░░░░██──██░░░░██─
─██░░██████████─██░░████████░░██───████░░████─██░░██████████─██░░░░░░░░░░██──██░░██─██░░████░░░░██─██░░██─────────████░░██──██░░████─
─██░░██─────────██░░██────██░░██─────██░░██───██░░██─────────██░░██████░░██──██░░██─██░░██──██░░██─██░░██───────────██░░░░██░░░░██───
─██░░██████████─██░░████████░░██─────██░░██───██░░██████████─██░░██──██░░██──██░░██─██░░██──██░░██─██░░██───────────████░░░░░░████───
─██░░░░░░░░░░██─██░░░░░░░░░░░░██─────██░░██───██░░░░░░░░░░██─██░░██──██░░██──██░░██─██░░██──██░░██─██░░██─────────────████░░████─────
─██░░██████████─██░░██████░░████─────██░░██───██░░██████████─██░░██──██░░██──██░░██─██░░██──██░░██─██░░██───────────────██░░██───────
─██░░██─────────██░░██──██░░██───────██░░██───██░░██─────────██░░██──██░░██████░░██─██░░██──██░░██─██░░██───────────────██░░██───────
─██░░██─────────██░░██──██░░██████─████░░████─██░░██████████─██░░██──██░░░░░░░░░░██─██░░████░░░░██─██░░██████████───────██░░██───────
─██░░██─────────██░░██──██░░░░░░██─██░░░░░░██─██░░░░░░░░░░██─██░░██──██████████░░██─██░░░░░░░░████─██░░░░░░░░░░██───────██░░██───────
─██████─────────██████──██████████─██████████─██████████████─██████──────────██████─████████████───██████████████───────██████───────
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
]]

addict.divider(Friendly, "Friendly")

addict.action(Friendly, "Max Player", {"max"}, "Turns on Godmode, auto heal, ceopay, vehiclegodmode, vehicle boost, never wanted, gives all weapons, ammo/infinite and parachute all at once.", function ()
    addict.trigger_commands("arm".. players.get_name(pid) .. "all")
    addict.trigger_commands("bail".. players.get_name(pid))
    addict.trigger_commands("boost".. players.get_name(pid))
    addict.trigger_commands("givenolockon".. players.get_name(pid))
    addict.trigger_commands("ceopay".. players.get_name(pid))
    addict.trigger_commands("autoammo".. players.get_name(pid))
    addict.trigger_commands("autoheal".. players.get_name(pid))
    addict.trigger_commands("givevehgod".. players.get_name(pid))
    addict.trigger_commands("paragive".. players.get_name(pid))
    addict.trigger_commands("removestickys".. players.get_name(pid))
end, nil, nil, COMMANDPERM_FRIENDLY)


addict.action(Friendly, "Fix loading screen", {"fixme"}, "Try to fix player's infinite loading screen by giving him script host and teleporting to nearest apartment.", function()
    addict.trigger_commands("aptme" .. players.get_name(pid))
end, nil, nil, COMMANDPERM_FRIENDLY)

addict.action(Friendly, "Send Friend Request", {"sendfriend"}, "", function()
    addict.show_command_box("historynote " .. PLAYER.GET_PLAYER_NAME(pid) .. "Friends List")
    addict.show_command_box("befriend " .. PLAYER.GET_PLAYER_NAME(pid))
end, nil, nil, COMMANDPERM_FRIENDLY)


addict.toggle_loop(Friendly, "Infinity Ammo", {"autoammo"}, "Endless ammo for players", function(toggle)
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local weaphash = WEAPON.GET_SELECTED_PED_WEAPON(ped)
    local ammo = WEAPON.GET_AMMO_IN_PED_WEAPON(ped, weaphash)
    if ammo < 9999 then
    WEAPON.ADD_AMMO_TO_PED(ped, weaphash, 9999)
    end
end)

addict.toggle_loop(Friendly, "Remove Stickys From Car", {"removestickys"}, "", function(toggle)
    local car = PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    NETWORK.REMOVE_ALL_STICKY_BOMBS_FROM_ENTITY(car)
end)

local usingHug = false

addict.toggle(Friendly, "Hug Player", {"hugplayer"}, "Perform a hug animation near a selected player.", function(on)
    usingHug = on
    if pid == players.user() then
        return
    end
    if usingHug then
        local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local targetCoords = ENTITY.GET_ENTITY_COORDS(targetPed, true)
        local animDict = "mp_ped_interaction"
        local animName = "kisses_guy_a"
        STREAMING.REQUEST_ANIM_DICT(animDict)
        while not STREAMING.HAS_ANIM_DICT_LOADED(animDict) do
            util.yield()
        end
        local hugOffset = { x = 0.5, y = 0.0, z = 0.0 }
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(),
            targetCoords.x + hugOffset.x,
            targetCoords.y + hugOffset.y,
            targetCoords.z + hugOffset.z,
            false, false, false)
        TASK.TASK_PLAY_ANIM(players.user_ped(), animDict, animName, 8.0, -8.0, -1, 1, 0, false, false, false)

        while usingHug and is_player_active(pid, false, true) and not util.is_session_transition_active() do
            util.yield()
        end
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
    end
end)

---------------------------------------------------------------------------------------------------------------

players.on_join(PlayerOptions)
end)
players.dispatch_on_join()
util.keep_running()