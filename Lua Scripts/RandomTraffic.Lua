util.require_natives(1676318796)

Wait = util.yield
joaat = util.joaat
Print = util.toast

local NULL <const> = 0

local StreetVehModels = {
	"airbus",
	"airtug",
	"alpha",
	"ambulance",
	"asea",
	"asterope",
	"akuma",
	"bagger",
	"baller",
	"baller2",
	"banshee",
	"barracks",
	"barracks2",
	"bati",
	"bati2",
	"bfinjection",
	"bison",
	"bison2",
	"bison3",
	"biff",
	"bjxl",
	"blazer",
	"blista",
	"blista2",
	"boxville",
	"boxville2",
	"boxville3",
	"boxville4",
	"bullet",
	"burrito",
	"burrito2",
	"burrito3",
	"burrito4",
	"bmx",
	"buccaneer",
	"buffalo",
	"buffalo2",
	"bulldozer",
	"bus",
	"bodhi",
	"bobcatxl",
	"caddy",
	"caddy2",
	"caddy3",
	"camper",
	"carbonizzare",
	"carbonrs",
	"cargobob",
	"cavalcade",
	"cavalcade2",
	"crusader",
	"coach",
	"comet2",
	"coquette",
	"daemon",
	"dilettante",
	"dilettante2",
	"dinghy",
	"dinghy2",
	"docktug",
	"double",
	"dominator",
	"dloader",
	"dubsta",
	"dubsta2",
	"dune",
	"dump",
	"emperor",
	"exemplar",
	"gauntlet",
	"gburrito",
	"hauler",
	"huntley",
	"issi2",
	"f620",
	"faggio",
	"faggio2",
	"fbi",
	"fbi2",
	"felon",
	"felon2",
	"feltzer2",
	"firetruk",
	"flatbed",
	"frogger",
	"frogger2",
	"fusilade",
	"fugitive",
	"futo",
	"fq2",
	"granger",
	"gresley",
	"habanero",
	"ingot",
	"intruder",
	"jackal",
	"journey",
	"jester",
	"jetmax",
	"landstalker",
	"nemesis",
	"ninef",
	"ninef2",
	"massacro",
	"marquis",
	"manana",
	"maverick",
	"mesa",
	"minivan",
	"mixer",
	"mixer2",
	"mule",
	"mower",
	"panto",
	"packer",
	"patriot",
	"pcj",
	"penumbra",
	"peyote",
	"phantom",
	"phoenix",
	"picador",
	"pigalle",
	"prairie",
	"predator",
	"premier",
	"primo",
	"police3",
	"polmav",
	"pony",
	"pony2",
	"pounder",
	"radi",
	"rancherxl",
	"rapidgt",
	"rapidgt2",
	"ratloader",
	"rebel",
	"rebel2",
	"regina",
	"rentalbus",
	"rhino",
	"riot",
	"ripley",
	"rubble",
	"ruffian",
	"ruiner",
	"rumpo",
	"rumpo2",
	"rocoto",
	"romero",
	"oracle",
	"oracle2",
	"utillitruck",
	"utillitruck2",
	"utillitruck3",
	"schwarzer",
	"sandking",
	"sandking2",
	"seminole",
	"sadler",
	"sanchez",
	"sanchez2",
	"schafter2",
	"scrap",
	"seashark",
	"seashark2",
	"sentinel",
	"serrano",
	"sheriff",
	"sheriff2",
	"speeder",
	"speedo",
	"squalo",
	"sultan",
	"suntrap",
	"superd",
	"surano",
	"surfer",
	"surfer2",
	"surge",
	"stanier",
	"stratum",
	"stretch",
	"taco",
	"tailgater",
	"tiptruck",
	"tiptruck2",
	"tractor2",
	"trash",
	"tropic",
	"tornado",
	"tornado2",
	"tornado3",
	"tornado4",
	"tourbus",
	"towtruck",
	"towtruck2",
	"youga",
	"vader",
	"vigero",
	"voodoo2",
	"voltic",
	"washington",
	"zion",
	"zion2"
}
VehicleStreet = {}
for i = 1, #StreetVehModels do
	VehicleStreet[StreetVehModels[i]] = {}
end

local DisabledVehicles = {
	"avisa",
	"kosatka",
	"armytanker",
	"armytrailer",
	"armytrailer2",
	"baletrailer",
	"boattrailer",
	"cablecar",
	"docktrailer",
	"freighttrailer",
	"graintrailer",
	"proptrailer",
	"raketrailer",
	"tr2",
	"tr3",
	"tr4",
	"trflat",
	"tvtrailer",
	"tanker",
	"tanker2",
	"trailerlarge",
	"trailerlogs",
	"trailersmall",
	"trailers",
	"trailers2",
	"trailers3",
	"trailers4",
	"freight",
	"freightcar",
	"freightcont1",
	"freightcont2",
	"freightgrain",
	"metrotrain",
	"tankercar",
	"freightcar2"
}

local AllGameVehs = {}

local GameVehicles = util.get_vehicles()

local AllowedVehicles = {}

for index, vehmodels in pairs(GameVehicles) do
	if type(vehmodels.name) == "string" then
		if not util.is_this_model_a_submarine(joaat(vehmodels.name))
		and not util.is_this_model_a_trailer(joaat(vehmodels.name)) then
			local FoundDisabledModel = false
			for i = 1, #DisabledVehicles do
				if vehmodels.name == DisabledVehicles[i] then
					FoundDisabledModel = true
				end
			end
			if not FoundDisabledModel then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.name
				AllowedVehicles[1 + #AllowedVehicles] = {Name = vehmodels.name, Allowed = true}
			end
		end
	end
end

local VehModelsOnly = menu.list(menu.my_root(), "Set Allowed Vehicle Models", {}, "")

--[[
menu.action(VehModelsOnly, "Allow Everything", {}, "", function(toggle)
	for i = 1, #AllGameVehs do
		AllGameVehs[i] = nil
	end
	for index, vehmodels in pairs(GameVehicles) do
		if type(vehmodels.name) == "string" then
			AllGameVehs[1 + #AllGameVehs] = vehmodels.name
		end
	end
end)
]]

local AllowCars = true
menu.toggle(VehModelsOnly, "Allow Cars", {}, "", function(toggle)
	AllowCars = toggle
	if AllowCars then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_CAR(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if not AllowCars then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_CAR(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowCars)

local AllowBikes = true
menu.toggle(VehModelsOnly, "Allow Bikes", {}, "", function(toggle)
	AllowBikes = toggle
	if AllowBikes then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_BIKE(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if not AllowBikes then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_BIKE(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowBikes)

local AllowBicycles = true
menu.toggle(VehModelsOnly, "Allow Bicycles", {}, "", function(toggle)
	AllowBicycles = toggle
	if AllowBicycles then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_BICYCLE(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if not AllowBicycles then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_BICYCLE(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowBicycles)

local AllowPlanes = true
menu.toggle(VehModelsOnly, "Allow Planes", {}, "", function(toggle)
	AllowPlanes = toggle
	if AllowPlanes then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_PLANE(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if not AllowPlanes then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_PLANE(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowPlanes)

local AllowHelis = true
menu.toggle(VehModelsOnly, "Allow Helicopters", {}, "", function(toggle)
	AllowHelis = toggle
	if AllowHelis then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_HELI(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if not AllowHelis then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_HELI(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowHelis)

local AllowBlimps = true
menu.toggle(VehModelsOnly, "Allow Blimps", {}, "", function(toggle)
	AllowBlimps = toggle
	if AllowBlimps then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if util.is_this_model_a_blimp(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if not AllowBlimps then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if util.is_this_model_a_blimp(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowBlimps)


local AllowBoats = true
menu.toggle(VehModelsOnly, "Allow Boats", {}, "", function(toggle)
	AllowBoats = toggle
	if AllowBoats then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_BOAT(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if not AllowBoats then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_BOAT(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowBoats)

local AllowJetskies = true
menu.toggle(VehModelsOnly, "Allow Jetskies", {}, "", function(toggle)
	AllowJetskies = toggle
	if not AllowJetskies then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_JETSKI(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if AllowJetskies then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_JETSKI(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowJetskies)

local AllowTrains = true
menu.toggle(VehModelsOnly, "Allow Trains", {}, "", function(toggle)
	AllowTrains = toggle
	if not AllowTrains then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_TRAIN(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if AllowTrains then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_TRAIN(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowTrains)

local AllowQuadbikes = true
menu.toggle(VehModelsOnly, "Allow Quadbikes", {}, "", function(toggle)
	AllowQuadbikes = toggle
	if not AllowQuadbikes then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_QUADBIKE(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if AllowQuadbikes then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_A_QUADBIKE(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowQuadbikes)

local AllowAmphibiousCars = true
menu.toggle(VehModelsOnly, "Allow Amphibious Cars", {}, "", function(toggle)
	AllowAmphibiousCars = toggle
	if not AllowAmphibiousCars then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_AN_AMPHIBIOUS_CAR(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if AllowAmphibiousCars then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_AN_AMPHIBIOUS_CAR(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowAmphibiousCars)

local AllowAmphibiousQuadbikes = true
menu.toggle(VehModelsOnly, "Allow Amphibious Quadbikes", {}, "", function(toggle)
	AllowAmphibiousQuadbikes = toggle
	if not AllowAmphibiousQuadbikes then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_AN_AMPHIBIOUS_QUADBIKE(joaat(vehmodels.Name)) then
				vehmodels.Allowed = true
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
	if AllowAmphibiousQuadbikes then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		for index, vehmodels in pairs(AllowedVehicles) do
			if VEHICLE.IS_THIS_MODEL_AN_AMPHIBIOUS_QUADBIKE(joaat(vehmodels.Name)) then
				vehmodels.Allowed = false
			end
			if vehmodels.Allowed then
				AllGameVehs[1 + #AllGameVehs] = vehmodels.Name
			end
		end
	end
end, AllowAmphibiousQuadbikes)

menu.text_input(VehModelsOnly, "Input a Only Vehicle Model", {"inputonlyvehmodel"}, "Only models of this type will be used to replace vehicles.", function(on_change)
	if STREAMING.IS_MODEL_VALID(joaat(on_change)) then
		for i = 1, #AllGameVehs do
			AllGameVehs[i] = nil
		end
		AllGameVehs[1 + #AllGameVehs] = on_change
	end
end)

local OptionsMenu = menu.list(menu.my_root(), "Options", {}, "To handle with vehicle replacer.")

local ReplaceOnlyWithDrivers = true
menu.toggle(OptionsMenu, "Only Replace with Drivers", {}, "", function(toggle)
	ReplaceOnlyWithDrivers = toggle
end, ReplaceOnlyWithDrivers)

local ReplaceOnlyIfCloser = true
menu.toggle(OptionsMenu, "Only Replace Closer Vehicles", {}, "", function(toggle)
	ReplaceOnlyIfCloser = toggle
end, ReplaceOnlyIfCloser)

local DeleteOnTurningOff = false
menu.toggle(OptionsMenu, "Delete if turned off", {}, "Delete all generated vehicles if Set Random Traffic if untoggled.", function(toggle)
	DeleteOnTurningOff = toggle
end)

local CreatedVehs = {}
local ReplacedVehs = {}
local RandomVehsOn = false
local LastRequestedModel = 0
local MaxVehs = 200
local MaxReplacedVehs = 100
menu.toggle(menu.my_root(), "Set Random Traffic", {}, "", function(toggle)
	RandomVehsOn = toggle
	if not RandomVehsOn then
		if DeleteOnTurningOff then
			for index, vehs in pairs(entities.get_all_vehicles_as_handles()) do
				if DECORATOR.DECOR_GET_INT(vehs, "Casino_Game_Info_Decorator") > 0 then
					util.create_thread(function()
						while not NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehs) do
							Wait()
						end
						entities.delete_by_handle(vehs)
					end)
				end
			end
		end
		for index, vehs in pairs(ReplacedVehs) do
			ReplacedVehs[index] = nil
		end
	end
	if RandomVehsOn then
		while RandomVehsOn do
			local PlayerPed = PLAYER.PLAYER_PED_ID()
			for index, vehs in pairs(entities.get_all_vehicles_as_handles()) do
				if ReplacedVehs[vehs] == nil then
					if not ENTITY.IS_ENTITY_DEAD(vehs) then
						if not ENTITY.IS_ENTITY_A_MISSION_ENTITY(vehs) then
							local CanEdit = true
							if ReplaceOnlyWithDrivers then
								CanEdit = VEHICLE.GET_VEHICLE_NUMBER_OF_PASSENGERS(vehs, true, true) > 0
							end
							if ReplaceOnlyIfCloser then
								if not ENTITY.IS_ENTITY_AT_ENTITY(vehs, PlayerPed, 300.0, 300.0, 900.0, false, true, 0) then
									CanEdit = false
								end
							end
							local Ped = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehs, -1, false)
							if Ped ~= 0 then
								if PED.IS_PED_A_PLAYER(Ped) then
									CanEdit = false
								end
							end
							if CanEdit then
								ReplacedVehs[vehs] = {}
								ReplacedVehs[vehs].ModelToRequest = joaat(AllGameVehs[math.random(#AllGameVehs)])
								ReplacedVehs[vehs].WasReplaced = 0
							end
						end
					end
				end
				if ReplacedVehs[vehs] ~= nil then
					if ENTITY.DOES_ENTITY_EXIST(vehs) then
						if ReplacedVehs[vehs].WasReplaced == 1 then
							if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehs) then
								ReplacedVehs[vehs].WasReplaced = 2
								SetEntityAsNoLongerNeeded(vehs)
							end
						end
						if ReplacedVehs[vehs].WasReplaced == 0 then
							if not STREAMING.HAS_MODEL_LOADED(ReplacedVehs[vehs].ModelToRequest) then
								STREAMING.REQUEST_MODEL(ReplacedVehs[vehs].ModelToRequest)
							end
							if STREAMING.HAS_MODEL_LOADED(ReplacedVehs[vehs].ModelToRequest) then
								if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehs) then
									local Peds = {}
									local Coords = ENTITY.GET_ENTITY_COORDS(vehs)
									local Rot = ENTITY.GET_ENTITY_ROTATION(vehs)
									local Velocity = ENTITY.GET_ENTITY_VELOCITY(vehs)
									for i = -1, 9 do
										local Ped = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehs, i, false)
										if Ped ~= 0 then
											Peds[#Peds+1] = {Handle = Ped, Seat = i}
											if NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(Ped) then
												ENTITY.SET_ENTITY_COORDS(Ped, Coords.x, Coords.y, Coords.z + 10.0)
											else
												break
											end
										end
									end
									local NewVeh = VEHICLE.CREATE_VEHICLE(ReplacedVehs[vehs].ModelToRequest, Coords.x, Coords.y, Coords.z, Rot.z, true, false, false)
									if NewVeh ~= 0 then
										ENTITY.SET_ENTITY_ROTATION(NewVeh, Rot.x, Rot.y, Rot.z, 2)
										ENTITY.SET_ENTITY_VELOCITY(NewVeh, Velocity.x, Velocity.y, Velocity.z)
										DECORATOR.DECOR_SET_INT(NewVeh, "Casino_Game_Info_Decorator", 31)
										local SeatIndex = -1
										for i = 1, #Peds do
											if VEHICLE.IS_VEHICLE_SEAT_FREE(NewVeh, SeatIndex, false) then
												PED.SET_PED_INTO_VEHICLE(Peds[i].Handle, NewVeh, SeatIndex)
											end
											SeatIndex = SeatIndex + 1
										end
										ReplacedVehs[NewVeh] = {}
										ReplacedVehs[NewVeh].ModelToRequest = 0
										ReplacedVehs[NewVeh].WasReplaced = 1
										STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ReplacedVehs[vehs].ModelToRequest)
										ReplacedVehs[vehs] = nil
										UpgradeCar(NewVeh)
										ENTITY.SET_ENTITY_AS_MISSION_ENTITY(NewVeh, false, true)
									else
										STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ReplacedVehs[vehs].ModelToRequest)
										ReplacedVehs[vehs] = nil
									end
								end
							end
						end
						if ReplacedVehs[vehs] ~= nil then
							if ReplacedVehs[vehs].WasReplaced == 2 then
								if DECORATOR.DECOR_GET_INT(vehs, "Casino_Game_Info_Decorator") == 0 or ENTITY.IS_ENTITY_DEAD(vehs) then
									ReplacedVehs[vehs] = nil
								end
							end
						end
					else
						ReplacedVehs[vehs] = nil
					end
				end
			end
			Wait()
		end
	end
end)

local MiscMenu = menu.list(menu.my_root(), "Misc Features", {}, "")

local InfiniteCopsOn = false
menu.toggle(MiscMenu, "More Cops", {}, "", function(toggle)
	InfiniteCopsOn = toggle
	if not InfiniteCopsOn then
		for index, peds in pairs(entities.get_all_peds_as_handles()) do
			if peds ~= PLAYER.PLAYER_PED_ID() then
				if ENTITY.IS_ENTITY_A_MISSION_ENTITY(peds) then
					local DecorInt = DECORATOR.DECOR_GET_INT(peds, "Casino_Game_Info_Decorator")
					if DecorInt == 31 or DecorInt == 32 then
						NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(peds)
						entities.delete_by_handle(peds)
					end
				end
			end
		end
	end
	local DeadPeds = {}
	while InfiniteCopsOn do
		Wait()
		local PlayerPed = PLAYER.PLAYER_PED_ID()
		local PlayerID = PLAYER.PLAYER_ID()
		local MissionCopCount = 0
		for index, peds in pairs(entities.get_all_peds_as_handles()) do
			if peds ~= PlayerPed then
				if ENTITY.IS_ENTITY_A_MISSION_ENTITY(peds) then
					if not DoesValueExistInTable3(DeadPeds, peds) then
						if ENTITY.IS_ENTITY_DEAD(peds) then
							util.create_thread(function()
								DeadPeds[peds] = {}
								Wait(10000)
								NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(peds)
								DECORATOR.DECOR_SET_INT(peds, "Casino_Game_Info_Decorator", 32) 
								entities.delete_by_handle(peds)
								DeadPeds[peds] = nil
							end)
						end
					end
					if DECORATOR.DECOR_GET_INT(peds, "Casino_Game_Info_Decorator") == 32 then
						NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(peds)
						entities.delete_by_handle(peds)
					end
				end
				if not ENTITY.IS_ENTITY_A_MISSION_ENTITY(peds) then
					local RelHash = PED.GET_PED_RELATIONSHIP_GROUP_HASH(peds)
					if RelHash == joaat("COP") or RelHash == joaat("ARMY") then
						if DECORATOR.DECOR_GET_INT(peds, "Casino_Game_Info_Decorator") ~= 31 then
							NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(peds)
							DECORATOR.DECOR_SET_INT(peds, "Casino_Game_Info_Decorator", 31)
							ENTITY.SET_ENTITY_AS_MISSION_ENTITY(peds, false, true)
						end
					end
				end
			end
		end
	end
end)

local GokuAntiAim = false
menu.toggle(MiscMenu, "Goku Anti Aim", {"gokutp"}, "Goku Teleport Behind enemy", function(toggle)
	GokuAntiAim = toggle
	while GokuAntiAim do
		Wait()
		local PlayerPed = PLAYER.PLAYER_PED_ID()
		for k, peds in pairs(entities.get_all_peds_as_handles()) do
			if peds ~= PlayerPed then
				if not ENTITY.IS_ENTITY_DEAD(peds) then
					if not PED.IS_PED_IN_ANY_VEHICLE(peds, false) then
						if PED.IS_PED_FACING_PED(peds, PlayerPed, 1.0) and
						ENTITY.IS_ENTITY_AT_ENTITY(peds, PlayerPed, 500.0, 500.0, 1000.0, false, true, false) then
							local forwardheadingped = ENTITY.GET_ENTITY_HEADING(peds)
							local forwardy = ENTITY.GET_ENTITY_FORWARD_VECTOR(peds)
							local pedpos = ENTITY.GET_ENTITY_COORDS(peds)
							forwardy.x = forwardy.x - forwardy.x * 2
							forwardy.y = forwardy.y - forwardy.y * 2
							forwardy.z = forwardy.z
							
							ENTITY.SET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), pedpos.x + forwardy.x, pedpos.y + forwardy.y, pedpos.z - 1, false, false, false, false)
							ENTITY.SET_ENTITY_HEADING(PLAYER.PLAYER_PED_ID(), forwardheadingped)
							--Wait(1000)
						end
					end
				end
			end
		end
	end
end)

menu.toggle_loop(MiscMenu, "Goku Anti Aim 2", {"gokutp2"}, "Goku Teleport Behind enemy when shoots", function(toggle)
	for k, peds in pairs(entities.get_all_peds_as_handles()) do
		if PED.IS_PED_SHOOTING(peds) and not PED.IS_PED_IN_ANY_VEHICLE(peds, false)
			and ENTITY.IS_ENTITY_AT_ENTITY(peds, PLAYER.PLAYER_PED_ID(), 1000.0, 1000.0, 1000.0, false, true, false)
			and peds ~= PLAYER.PLAYER_PED_ID() then
			local forwardheadingped = ENTITY.GET_ENTITY_HEADING(peds)
			local forwardy = ENTITY.GET_ENTITY_FORWARD_VECTOR(peds)
			local pedpos = ENTITY.GET_ENTITY_COORDS(peds)
			forwardy.x = forwardy.x - forwardy.x * 2
			forwardy.y = forwardy.y - forwardy.y * 2
			forwardy.z = forwardy.z
			ENTITY.SET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), pedpos.x + forwardy.x, pedpos.y + forwardy.y, pedpos.z - 1, false, false, false, false)
			ENTITY.SET_ENTITY_HEADING(PLAYER.PLAYER_PED_ID(), forwardheadingped)
		end
	end
end)

local requestedIpl = {
	"h4_islandairstrip",
"h4_islandairstrip_props",
"h4_islandx_mansion",
"h4_islandx_mansion_props",
"h4_islandx_props",
"h4_islandxdock",
"h4_islandxdock_props",
"h4_islandxdock_props_2",
"h4_islandxtower", 
"h4_islandx_maindock", 
"h4_islandx_maindock_props", 
"h4_islandx_maindock_props_2", 
"h4_IslandX_Mansion_Vault", 
"h4_islandairstrip_propsb", 
"h4_beach", 
"h4_beach_props", 
"h4_beach_bar_props", 
"h4_islandx_barrack_props", 
"h4_islandx_checkpoint", 
"h4_islandx_checkpoint_props", 
"h4_islandx_Mansion_Office", 
"h4_islandx_Mansion_LockUp_01", 
"h4_islandx_Mansion_LockUp_02", 
"h4_islandx_Mansion_LockUp_03", 
"h4_islandairstrip_hangar_props", 
"h4_IslandX_Mansion_B", 
"h4_islandairstrip_doorsclosed", 
"h4_Underwater_Gate_Closed", 
"h4_mansion_gate_closed", 
"h4_aa_guns", 
"h4_IslandX_Mansion_GuardFence", 
"h4_IslandX_Mansion_Entrance_Fence", 
"h4_IslandX_Mansion_B_Side_Fence", 
"h4_IslandX_Mansion_Lights", 
"h4_islandxcanal_props", 
"h4_beach_props_party", 
"h4_islandX_Terrain_props_06_a", 
"h4_islandX_Terrain_props_06_b", 
"h4_islandX_Terrain_props_06_c", 
"h4_islandX_Terrain_props_05_a", 
"h4_islandX_Terrain_props_05_b", 
"h4_islandX_Terrain_props_05_c", 
"h4_islandX_Terrain_props_05_d", 
"h4_islandX_Terrain_props_05_e", 
"h4_islandX_Terrain_props_05_f", 
"H4_islandx_terrain_01",
 "H4_islandx_terrain_02", 
 "H4_islandx_terrain_03", 
 "H4_islandx_terrain_04", 
 "H4_islandx_terrain_05", 
 "H4_islandx_terrain_06", 
 "h4_ne_ipl_00", 
 "h4_ne_ipl_01", 
 "h4_ne_ipl_02", 
 "h4_ne_ipl_03", 
 "h4_ne_ipl_04", 
 "h4_ne_ipl_05", 
 "h4_ne_ipl_06", 
 "h4_ne_ipl_07", 
 "h4_ne_ipl_08", 
 "h4_ne_ipl_09", 
 "h4_nw_ipl_00", 
 "h4_nw_ipl_01", 
 "h4_nw_ipl_02", 
 "h4_nw_ipl_03", 
 "h4_nw_ipl_04", 
 "h4_nw_ipl_05", 
 "h4_nw_ipl_06", 
 "h4_nw_ipl_07", 
 "h4_nw_ipl_08", 
 "h4_nw_ipl_09", 
 "h4_se_ipl_00", 
 "h4_se_ipl_01", 
 "h4_se_ipl_02", 
 "h4_se_ipl_03", 
 "h4_se_ipl_04", 
 "h4_se_ipl_05", 
 "h4_se_ipl_06", 
 "h4_se_ipl_07", 
 "h4_se_ipl_08", 
 "h4_se_ipl_09", 
 "h4_sw_ipl_00", 
 "h4_sw_ipl_01", 
 "h4_sw_ipl_02", 
 "h4_sw_ipl_03", 
 "h4_sw_ipl_04", 
 "h4_sw_ipl_05", 
 "h4_sw_ipl_06", 
 "h4_sw_ipl_07", 
 "h4_sw_ipl_08", 
 "h4_sw_ipl_09", 
 "h4_islandx_mansion", 
 "h4_islandxtower_veg",
  "h4_islandx_sea_mines", 
  "h4_islandx", 
  "h4_islandx_barrack_hatch", 
  "h4_islandxdock_water_hatch", 
  "h4_beach_party"}

local SpawnCayo = false
menu.toggle(MiscMenu, "Spawn Cayo Perico", {}, "", function(toggle)
	SpawnCayo = toggle
	local islandCoords = {x = 4840.571, y = -5174.425, z = 2.0}
	if not SpawnCayo then
		for i = 1, #requestedIpl do
			if STREAMING.IS_IPL_ACTIVE(requestedIpl[i]) then
				STREAMING.REMOVE_IPL(requestedIpl[i])
			end
		end
		PATHFIND.SET_ALLOW_STREAM_HEIST_ISLAND_NODES(0)
	end
	if SpawnCayo then
		for i = 1, #requestedIpl do
			if not STREAMING.IS_IPL_ACTIVE(requestedIpl[i]) then
				STREAMING.REQUEST_IPL(requestedIpl[i])
			end
		end
		PATHFIND.SET_ALLOW_STREAM_HEIST_ISLAND_NODES(1)
		while SpawnCayo do
			Wait()
			HUD.SET_RADAR_AS_EXTERIOR_THIS_FRAME()
			HUD.SET_RADAR_AS_INTERIOR_THIS_FRAME(joaat("h4_fake_islandx"), 4700.0, -5145.0, 0, 0)
		end
	end
end)

local PopulateVehicles = false
menu.toggle(menu.my_root(), "Fill Vehicle Population", {}, "", function(toggle)
	PopulateVehicles = toggle
	while PopulateVehicles do
		VEHICLE.INSTANTLY_FILL_VEHICLE_POPULATION()
		Wait(10000)
	end
end)

menu.toggle_loop(MiscMenu, "Always Enter Passenger Seat", {}, "", function()
	PAD.DISABLE_CONTROL_ACTION(1, 23, true)
	if PAD.IS_DISABLED_CONTROL_JUST_PRESSED(1, 23) then
		for index, vehs in pairs(entities.get_all_vehicles_as_handles()) do
			local Ped = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehs, -1, false)
			if Ped ~= PLAYER.PLAYER_PED_ID() then
				PED.SET_PED_CONFIG_FLAG(Ped, 251, true)
				PED.SET_PED_CONFIG_FLAG(Ped, 255, true)
			end
			if not PED.IS_PED_IN_ANY_VEHICLE(PLAYER.PLAYER_PED_ID(), true) then
				if ENTITY.IS_ENTITY_AT_ENTITY(PLAYER.PLAYER_PED_ID(), vehs, 5.0, 5.0, 5.0, false, true, false) then
					local VehModel = ENTITY.GET_ENTITY_MODEL(vehs)
					local Seats = VEHICLE.GET_VEHICLE_MODEL_NUMBER_OF_SEATS(VehModel)
					local SeatToEnter = 0
					if Seats >= 2 then
						SeatToEnter = 0
					end
					if Seats >= 3 then
						SeatToEnter = 1
					end
					TASK.TASK_ENTER_VEHICLE(PLAYER.PLAYER_PED_ID(), vehs, 3000, SeatToEnter, 1.0, 1, 0)
				end
			end	
		end
	end
end)

menu.toggle_loop(MiscMenu, "Ped Drivers Let Passengers", {}, "", function()
	PAD.DISABLE_CONTROL_ACTION(1, 23, true)
	if PAD.IS_DISABLED_CONTROL_JUST_PRESSED(1, 23) then
		for index, vehs in pairs(entities.get_all_vehicles_as_handles()) do
			local Ped = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehs, -1, false)
			if Ped ~= PLAYER.PLAYER_PED_ID() then
				PED.SET_PED_CONFIG_FLAG(Ped, 251, true)
				PED.SET_PED_CONFIG_FLAG(Ped, 255, true)
			end
		end
	end
end)

local UtilsMenu = menu.list(menu.my_root(), "Utils", {}, "")

menu.action(UtilsMenu, "Delete All Peds", {}, "", function()
	for index, peds in pairs(entities.get_all_peds_as_handles()) do
		if peds ~= PLAYER.PLAYER_PED_ID() then
			entities.delete_by_handle(peds)
		end
	end
end)

menu.action(UtilsMenu, "Delete All Mission Peds", {}, "", function()
	for index, peds in pairs(entities.get_all_peds_as_handles()) do
		if peds ~= PLAYER.PLAYER_PED_ID() then
			if ENTITY.IS_ENTITY_A_MISSION_ENTITY(peds) then
				entities.delete_by_handle(peds)
			end
		end
	end
end)

menu.action(UtilsMenu, "Delete All Vehicles", {}, "", function()
	for index, vehs in pairs(entities.get_all_vehicles_as_handles()) do
		entities.delete_by_handle(vehs)
	end
end)

menu.action(UtilsMenu, "Delete All Vehicles Blips", {}, "", function()
	for index, vehs in pairs(entities.get_all_vehicles_as_handles()) do
		local Blip = HUD.GET_BLIP_FROM_ENTITY(vehs)
		if Blip ~= 0 then
			local BlipSprite = HUD.GET_BLIP_SPRITE(Blip)
			local BlipColour = HUD.GET_BLIP_COLOUR(Blip)
			if BlipSprite == 225 and BlipColour == 3 then
				util.remove_blip(Blip)
			end
		end
	end
end)

menu.action(UtilsMenu, "Delete Empty Vehicles", {}, "", function()
	for index, vehs in pairs(entities.get_all_vehicles_as_handles()) do
		local Count = 0
		for i = -1, 9 do
			local Ped = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehs, i, false)
			if Ped ~= 0 then
				Count = Count + 1
			end
			if Count <= 0 then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehs)
				entities.delete_by_handle(vehs)
			end
		end
	end
end)

function UpgradeCar(Veh)
	VEHICLE.SET_VEHICLE_WHEEL_TYPE(Veh, math.random(0, 12))
	VEHICLE.SET_VEHICLE_MOD_KIT(Veh, 0)
	for k = 0, 48 do
		local NumMods = entities.get_upgrade_max_value(Veh, k)
		if NumMods > 0 then
			local Rand = math.random(0, NumMods)
			if Rand <= -1 then
				Rand = 0
			end
			entities.set_upgrade_value(Veh, k, Rand, false)
		else
			if math.random(0, 1) == 1 then
				entities.set_upgrade_value(Veh, k, NumMods, false)
			end
		end
	end
	if math.random(0, 1) == 1 then
		VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(Veh, false)
	end
	VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(Veh, math.random(0, 255), math.random(0, 255), math.random(0, 255))
	VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(Veh, math.random(0, 255), math.random(0, 255), math.random(0, 255))
	VEHICLE.SET_VEHICLE_COLOURS(Veh, math.random(0, 160), math.random(0, 160))
end


local DEVTools = menu.list(menu.my_root(), "DEV Tools", {}, "")

menu.action(DEVTools, "Get Table Size", {}, "", function()
	Print(#ReplacedVehs)
end)

menu.action(DEVTools, "Get Does Exist", {}, "", function()
	for i = 1, #ReplacedVehs do
		if ReplacedVehs[i] ~= nil then
			if ENTITY.DOES_ENTITY_EXIST(ReplacedVehs[i].Handle) then
				Print("Handle ".. ReplacedVehs[i].Handle .. " Exists")
			else
				Print("Handle ".. ReplacedVehs[i].Handle .. " Doesn't Exists")
			end
		end
	end
end)

menu.action(DEVTools, "Get Duplicate Count", {}, "", function()
	local Count = 0
	for i = 1, #ReplacedVehs do
		if ReplacedVehs[i] ~= nil then
			for k = 1, #ReplacedVehs do
				if ReplacedVehs[k] ~= nil then
					if i ~= k then
						if ReplacedVehs[k].Handle == ReplacedVehs[i].Handle then
							Count = Count + 1
						end
					end
				end
			end
		end
	end
	Print(Count)
end)

menu.action(DEVTools, "Handle 0 Count", {}, "", function()
	local Count = 0
	for i = 1, #CreatedVehs do
		if CreatedVehs[i] ~= nil then
			if CreatedVehs[i].Handle == 0 then
				Count = Count + 1
			end
		end
	end
	Print(Count)
end)

menu.action(DEVTools, "Table Index Value", {}, "", function()
	Print(VehicleStreet["tornado"] ~= nil)
end)

menu.toggle_loop(DEVTools, "Get All Vehicles Count", {}, "", function()
	local Count = 0
	for index, vehs in pairs(entities.get_all_vehicles_as_handles()) do
		Count = Count + 1
	end
	Print(Count)
end)

menu.toggle_loop(DEVTools, "Get All Cops Count", {}, "", function()
	local Count = 0
	for index, peds in pairs(entities.get_all_peds_as_handles()) do
		if peds ~= PLAYER.PLAYER_PED_ID() then
			local Rel = PED.GET_PED_RELATIONSHIP_GROUP_HASH(peds)
			if Rel == joaat("COP") then
				Count = Count + 1
			end
		end
	end
	Print(Count)
end)

menu.toggle_loop(DEVTools, "Get All Cops Mission Count", {}, "", function()
	local Count = 0
	for index, peds in pairs(entities.get_all_peds_as_handles()) do
		if peds ~= PLAYER.PLAYER_PED_ID() then
			local Rel = PED.GET_PED_RELATIONSHIP_GROUP_HASH(peds)
			if Rel == joaat("COP") and ENTITY.IS_ENTITY_A_MISSION_ENTITY(peds) then
				Count = Count + 1
			end
		end
	end
	Print(Count)
end)

menu.toggle_loop(DEVTools, "Get All Peds Count", {}, "", function()
	local Count = 0
	for index, peds in pairs(entities.get_all_peds_as_handles()) do
		if not PED.IS_PED_A_PLAYER(peds) then
			Count = Count + 1
		end
	end
	Print(Count)
end)

function NetworkEntityVeh(Entity)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(Entity, false, true)
    --local EntNetID = NETWORK.VEH_TO_NET(Entity)
    --NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(EntNetID, true)
    --NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(EntNetID, PLAYER.PLAYER_ID(), true)
	--return EntNetID
end

function DoesValueExistInTable(T, Value)
	for index, values in pairs(T) do
		if Value == values.Handle then return true end
	end
	return false
end

function DoesValueExistInTable2(T, Value)
	for index, values in pairs(T) do
		if Value == values.OldVehicle then return true end
	end
	return false
end

function DoesValueExistInTable3(T, Value)
	for index, values in pairs(T) do
		if index == Value then return true end
	end
	return false
end

function SetEntityAsNoLongerNeeded(Entity)
	local pHandle = memory.alloc_int()
	memory.write_int(pHandle, Entity)
	ENTITY.SET_ENTITY_AS_NO_LONGER_NEEDED(pHandle)
end

util.create_tick_handler(function()
	return true
end)