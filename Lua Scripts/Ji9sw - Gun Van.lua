----------------------- FUNCTIONS ------------------------ 

function SetGlobalInt(address, value)
    memory.write_int(memory.script_global(address), value)
end

function GetGlobalInt(address)
    return memory.read_int(memory.script_global(address))
end

function GetWeaponHash(HashOrString)

    util.toast("in: " .. HashOrString)
    for Index, WeaponInfo in ipairs(util.get_weapons()) do
        if WeaponInfo.hash == HashOrString then
            return WeaponInfo.hash
        elseif util.joaat(HashOrString) == WeaponInfo.hash then
            return WeaponInfo.hash
        end
    end

    return 0
end

----------------------- VARIABLES ------------------------ 

util.require_natives("3274a")

local Globals = 
{
    Position = 2652568 + 2706, -- Line 3962 (int func_14())
    WeaponSlots = 262145 + 33273, -- Line 33556
    WeaponDiscount = 262145 + 33284, -- Line 34648
    ThrowableSlots = 262145 + 33295, -- Line 34662
    ThrowableDiscount = 262145 + 33299, -- Line 18117
    ArmourDiscount = 262145 + 33303 -- Line 34676
}

local SelectedSlot = 1
local SelectedSlot_Throwables = 1
local CurrentPosition = GetGlobalInt(Globals.Position) + 1
local DefaultGuns = { GetGlobalInt(Globals.WeaponSlots + 1), GetGlobalInt(Globals.WeaponSlots + 2), GetGlobalInt(Globals.WeaponSlots + 3), GetGlobalInt(Globals.WeaponSlots + 4), GetGlobalInt(Globals.WeaponSlots + 5), GetGlobalInt(Globals.WeaponSlots + 6), GetGlobalInt(Globals.WeaponSlots + 7), GetGlobalInt(Globals.WeaponSlots + 8), GetGlobalInt(Globals.WeaponSlots + 9), GetGlobalInt(Globals.WeaponSlots + 10)  }
local DefaultThrowables = { GetGlobalInt(Globals.ThrowableSlots + 1), GetGlobalInt(Globals.ThrowableSlots + 2) }
local GunVanCoords = { {-29.532, 6435.136, 31.162}, {1705.214, 4819.167, 41.75}, {1795.522, 3899.753, 33.869}, {1335.536, 2758.746, 51.099}, {795.583, 1210.78, 338.962}, {-3192.67, 1077.205, 20.594}, {-789.719, 5400.921, 33.915}, {-24.384, 3048.167, 40.703}, {2666.786, 1469.324, 24.237}, {-1454.966, 2667.503, 3.2}, {2340.418, 3054.188, 47.888}, {1509.183, -2146.795, 76.853}, {1137.404, -1358.654, 34.322}, {-57.208, -2658.793, 5.737}, {1905.017, 565.222, 175.558}, {974.484, -1718.798, 30.296}, {779.077, -3266.297, 5.719}, {-587.728, -1637.208, 19.611}, {733.99, -736.803, 26.165}, {-1694.632, -454.082, 40.712}, {-1330.726, -1163.948, 4.313}, {-496.618, 40.231, 52.316}, {275.527, 66.509, 94.108}, {260.928, -763.35, 30.559}, {-478.025, -741.45, 30.299}, {894.94, 3603.911, 32.56}, {-2166.511, 4289.503, 48.733}, {1465.633, 6553.67, 13.771}, {1101.032, -335.172, 66.944}, {149.683, -1655.674, 29.028} }

 --------------------- GUN VAN OPTIONS --------------------- 

 menu.my_root():click_slider("1. Choose Gun Van Slot", {}, "Choose the gun van slot to modify from 1-10", 1, 10, 1, 1, function(SlotID) -- The slot ID needs to have an extra 1, the array is actually 0-9 but GTA is dumb
    SelectedSlot = SlotID
    util.toast("Slot #" .. SelectedSlot .. " selected, proceed to step 2.")
 end)

 menu.my_root():text_input("2. Modify Gun Van Slot", {'SetGVSlot '}, "Set the gunvan slot to the weapon ID\nFound at: https://wiki.rage.mp/index.php?title=Weapons", function(Input)   
    Input = GetWeaponHash(Input)

    util.toast(Input)
    
    SetGlobalInt(Globals.WeaponSlots + SelectedSlot, Input)
    util.toast("This weapon is now in the gun van in slot #" .. SelectedSlot .. ".")
end)

menu.my_root():action("Gun Van Discount", {}, "Adds a nice 10% discount to all items in the gun van", function() -- 10% is the limit, from my testing it can't go backwards i think
    SetGlobalInt(Globals.WeaponDiscount, 10) -- Weapons
    SetGlobalInt(Globals.ThrowableDiscount, 10) -- Throwables 
    SetGlobalInt(Globals.ArmourDiscount, 10) -- Armour
end)

menu.my_root():action("Optimal Gun Van Slots", {}, "Adds a few cool weapons like the navy revolver automatically", function()
    SetGlobalInt(Globals.WeaponSlots + 1, util.joaat("weapon_navyrevolver"))
    SetGlobalInt(Globals.WeaponSlots + 2, util.joaat("weapon_gadgetpistol"))
    SetGlobalInt(Globals.WeaponSlots + 3, util.joaat("weapon_stungun_mp"))
    SetGlobalInt(Globals.WeaponSlots + 4, util.joaat("weapon_doubleaction"))
    SetGlobalInt(Globals.WeaponSlots + 5, util.joaat("weapon_railgunxm3"))
    SetGlobalInt(Globals.WeaponSlots + 6, util.joaat("weapon_minigun"))
    SetGlobalInt(Globals.WeaponSlots + 7, util.joaat("weapon_heavysniper_mk2"))
    SetGlobalInt(Globals.WeaponSlots + 8, util.joaat("weapon_combatmg_mk2"))
    SetGlobalInt(Globals.WeaponSlots + 9, util.joaat("weapon_tacticalrifle"))
    SetGlobalInt(Globals.WeaponSlots + 10, util.joaat("weapon_specialcarbine_mk2"))

    SetGlobalInt(Globals.ThrowableSlots + 1, util.joaat("weapon_stickybomb"))
    SetGlobalInt(Globals.ThrowableSlots + 2, util.joaat("weapon_molotov"))
    SetGlobalInt(Globals.ThrowableSlots + 3, util.joaat("weapon_pipebomb"))

    util.toast("Better weapons are now in the gun van")
end)

menu.my_root():action("Teleport To Gun Van", {}, "Teleports you to the gun van", function()
    util.toast(CurrentPosition)
    if not GunVanCoords[CurrentPosition] then
        util.toast("This event is currently innactive")
    else 
        Coord = GunVanCoords[CurrentPosition]
        players.teleport_3d(players.user(), Coord[1], Coord[2], Coord[3])
    end
end)

menu.my_root():click_slider("Set Gun Van Position", {}, "Choose the gun van position", 1, 30, CurrentPosition, 1, function(PositionID)
    CurrentPosition = PositionID
    SetGlobalInt(Globals.Position, CurrentPosition - 1)
    util.toast("The Gun Van has been moved.")
 end)

 menu.my_root():action("Reset Gun Van Slots", {}, "Returns the weapons inside the gun van to the originals (when the script was started)", function()
    for SlotID = 1, 10 do
        SetGlobalInt(Globals.WeaponSlots + SlotID, DefaultGuns[SlotID])
    end

    for SlotID = 1, 2 do
        SetGlobalInt(Globals.ThrowableSlots + SlotID, DefaultThrowables[SlotID])
    end

    util.toast("The Gun Van has been restored.")
 end)

 menu.my_root():action("Get Current Weapon", {}, "", function()
    local WeaponHash = memory.alloc_int()
    local HasWeapon = WEAPON.GET_CURRENT_PED_WEAPON(players.user_ped(), WeaponHash, true)

    if not HasWeapon then
        util.toast("No Current Weapon.")
        return
    end

    util.toast("Hash: " .. memory.read_int(WeaponHash) .. "\nModel: " .. util.reverse_joaat(memory.read_int(WeaponHash)))
 end)

 menu.my_root():action("Set To Current Weapon", {}, "", function()
    local WeaponHash = memory.alloc_int()
    local HasWeapon = WEAPON.GET_CURRENT_PED_WEAPON(players.user_ped(), WeaponHash, true)

    if not HasWeapon then
        util.toast("No Current Weapon.")
        return
    end

    SetGlobalInt(Globals.WeaponSlots + SelectedSlot, memory.read_int(WeaponHash))
    util.toast("Applied current weapon to slot #" .. SelectedSlot)
 end)

 menu.my_root():action("Read Me", {}, "Please note that lots of weapons cant be bought from the Gun Van, such as the candy cane or other limited time collectables, also note that the Weapons tab can only contain weapons and not things like grenades. If you experience issues try restarting the script.", function()
    util.toast("Please note that lots of weapons cant be bought from the Gun Van, such as the candy cane or other limited time collectables, also note that the Weapons tab can only contain weapons and not things like grenades. If you experience issues try restarting the script.")
end)

 local ThrowableMenu = menu.my_root():list("Throwables", {}, "Manage the throwables slots instead of weapons")

 ThrowableMenu:click_slider("1. Choose Gun Van Slot", {}, "Choose the gun van slot to modify from 1-3", 1, 3, 1, 1, function(SlotID) -- The slot ID needs to have an extra 1, the array is actually 0-9 but GTA is dumb
    SelectedSlot_Throwables = SlotID
    util.toast("Slot #" .. SelectedSlot_Throwables .. " selected, proceed to step 2.")
 end)

ThrowableMenu:text_input("2. Modify Gun Van Slot", {'SetGVSlot2 '}, "Set the gunvan slot to the weapon ID \nFound at: https://wiki.rage.mp/index.php?title=Weapons", function(Input)
    SetGlobalInt(Globals.ThrowableSlots + SelectedSlot_Throwables, util.joaat(Input))

    util.toast("This weapon is now in the gun van in slot #" .. SelectedSlot_Throwables .. ".")
end)

ThrowableMenu:action("Read Me", {}, "Please note that the Throwables tab can only contain throwables like grenades.", function()
    util.toast("Please note that the Throwables tab can only contain throwables like grenades.")
end)

--[[ Commits / Credits : 

ji9sw: Original Author, Various Language Translations ( FIND IN STAND DISCORD )
Global Source: gunclub_shop.c [https://github.com/root-cause/v-decompiled-scripts/blob/master/gunclub_shop.c]
parci0_0: Updated for game version 1.69-3258
frog_e123: Original Korean Translation

-- Commits / Credits ]]
