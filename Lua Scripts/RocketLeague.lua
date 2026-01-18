-- RocketLeague
-- by Hexarobi
-- credit to WiriScript's Vehicle Acrobatics

local SCRIPT_VERSION = "0.5"

---
--- Auto Updater
---

local auto_update_config = {
    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-rocketleague/main/RocketLeague.lua",
    script_relpath=SCRIPT_RELPATH,
}

util.ensure_package_is_installed('lua/auto-updater')
local auto_updater = require('auto-updater')
if auto_updater == true then
    auto_updater.run_auto_update(auto_update_config)
end

---
--- Dependencies
---

util.require_natives("3095a")

---
--- Config
---

local default_force = 6
local front_force = 4.8
--local default_force = 10.71

local config = {
    commands ={
        {
            name="Jump",
            control_input=21,
            apply_forces={
                {
                    vector={x=0, y=0, z=default_force},
                    offset={x=0, y=0, z=0},
                }
            },
        },
        {
            name="Left Flip",
            control_input=234,
            apply_forces={
                {
                    vector={x=0, y=0, z=default_force},
                    offset={x=5.0, y=0, z=0},
                }
            },
        },
        {
            name="Right Flip",
            control_input=235,
            apply_forces={
                {
                    vector={x=0, y=0, z=default_force},
                    offset={x=-5.0, y=0, z=0},
                }
            },
        },
        {
            name="Front Flip",
            control_input=232,
            apply_forces={
                {
                    vector={x=0, y=0, z=front_force},
                    offset={x=0, y=-5.0, z=0},
                },
                --{
                --    vector={x=0, y=0, z=-front_force},
                --    offset={x=0, y=5.0, z=0},
                --},
            },
        },
        {
            name="Back Flip",
            control_input=233,
            apply_forces={
                {
                    vector={x=0, y=0, z=front_force},
                    offset={x=0, y=5.0, z=0},
                }
            },
        },
    }
}

---
--- Variables
---

local rl = {}
local menus = {}
local active_commands = {}

---
--- Main Tick Function
---

local function rocket_league_tick()
    local vehicle = rl.get_vehicle_player_is_in(players.user())
    if vehicle then
        if (not menu.is_open())
            and ENTITY.DOES_ENTITY_EXIST(vehicle)
            and VEHICLE.IS_VEHICLE_ON_ALL_WHEELS(vehicle)
        then
            rl.disable_controls()
            local command = rl.get_triggered_command()
            if command and entities.request_control(vehicle) then
                table.insert(active_commands, {
                    vehicle=vehicle,
                    command=command,
                    lasts_until=util.current_time_millis() + (command.time_held or 0)
                })
            end
        end
        for command_index, active_command in active_commands do
            rl.apply_command_forces(active_command.vehicle, active_command.command)
            if util.current_time_millis() > active_command.lasts_until then
                table.remove(active_commands, command_index)
            end
        end
    end
end

---
--- Functions
---

rl.default_command = function(command)
    if command.enabled == nil then command.enabled = true end
    if command.apply_forces == nil then command.apply_forces = {} end
    --if force.time_held == nil then force.time_held = 100 end
    for _, apply_force in command.apply_forces do
        rl.default_force(apply_force)
    end
end

rl.default_force = function(force)
    if type(force) ~= "table" then error("Invalid force") end
    if force.vector == nil then force.vector = { x=0, y=0, z=0} end
    if force.offset == nil then force.offset = { x=0, y=0, z=0} end
    if force.force_type == nil then force.force_type = 1 end
    if force.bone_index == nil then force.bone_index = 0 end
    if force.is_local == nil then force.is_local = false end
    if force.ignore_up_vec == nil then force.ignore_up_vec = true end
    if force.is_mass_relative == nil then force.is_mass_relative = true end
end

rl.get_triggered_command = function()
    for _, command in config.commands do
        if command.enabled and PAD.IS_DISABLED_CONTROL_JUST_PRESSED(2, command.control_input) then
            return command
        end
    end
end

rl.apply_command_forces = function(vehicle, command)
    for _, force in command.apply_forces do
        util.toast("applying force "..command.name)
        ENTITY.APPLY_FORCE_TO_ENTITY(
            vehicle, force.force_type,
            force.vector.x, force.vector.y, force.vector.z,
            force.offset.x, force.offset.y, force.offset.z,
            force.bone_index, force.is_local,
            force.ignore_up_vec, force.is_mass_relative,
            true, true
        )
    end
end

rl.disable_controls = function()
    for _, command in config.commands do
        if command.control_input then
            PAD.DISABLE_CONTROL_ACTION(2, command.control_input, true) -- Up
        end
    end
    --PAD.DISABLE_CONTROL_ACTION(2, config.controls.flip, false)
    --PAD.DISABLE_CONTROL_ACTION(2, 27, true) -- Up
    --PAD.DISABLE_CONTROL_ACTION(2, 20, true) -- Down
    --PAD.DISABLE_CONTROL_ACTION(2, 85, true) -- Left
    --PAD.DISABLE_CONTROL_ACTION(2, 74, true) -- Right
end

rl.get_vehicle_player_is_in = function(player)
    local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player)
    if PED.IS_PED_IN_ANY_VEHICLE(targetPed, false) then
        return PED.GET_VEHICLE_PED_IS_IN(targetPed, false)
    end
    return 0
end

local force_types = {
    {1, "Internal Force"},
    {2, "Internal Impulse"},
    {3, "External Force"},
    {4, "External Impulse"},
    {5, "Rotational Velocity"},
}

---
--- Menu
---

menu.my_root():toggle_loop("Rocket Controls Enabled", {}, "", function()
    rocket_league_tick()
end)

menu.my_root():action("Spawn Soccer Ball", {}, "", function()
    local model_hash = util.joaat("stt_prop_stunt_soccer_sball")
    util.request_model(model_hash)
    local offset = {x=0, y=5.5, z=0}
    local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), offset.x, offset.y, offset.z)
    local ball = OBJECT.CREATE_OBJECT_NO_OFFSET(
        model_hash,
        pos.x, pos.y, pos.z,
        true, false, false
    )
    util.toast("Spawned soccer ball "..ball)
end)

menus.commands = menu:my_root():list("Commands", {}, "")

for _, command in config.commands do
    rl.default_command(command)

    command.menu = menus.commands:list(command.name)

    command.menu:toggle("Enabled", {}, "", function(value)
        command.enabled = value
    end, command.enabled)
    command.menu:slider("Control Input", { "rlcontrolinput".. command.name}, "", 1, 360, command.control_input, 1, function(value)
        command.control_input = value
    end)

    command.menu:divider("Forces")
    for force_index, force in command.apply_forces do
        force.menu = command.menu:list("Force #"..force_index)

        force.menu:list_select("Force Type", { "rlforcetype".. command.name}, "", force_types, force.force_type + 1, function(value)
            force.force_type = value - 1
        end)
        force.menu:toggle("Local Vector Coords", {}, "", function(value)
            force.is_local = value
        end, force.is_local)
        force.menu:toggle("Ignore Up Vector", {}, "", function(value)
            force.ignore_up_vec = value
        end, force.ignore_up_vec)
        force.menu:toggle("Is Mass Relative", {}, "", function(value)
            force.is_mass_relative = value
        end, force.is_mass_relative)

        force.menu:divider("Force Vector")
        force.menu:slider_float("X", { "rlforcevectorx".. command.name}, "", -2500, 2500, math.floor(force.vector.x * 100), 1, function(value)
            force.vector.x = value / 100
        end)
        force.menu:slider_float("Y", { "rlforcevectory".. command.name}, "", -2500, 2500, math.floor(force.vector.y * 100), 1, function(value)
            force.vector.y = value / 100
        end)
        force.menu:slider_float("Z", { "rlforcevectorz".. command.name}, "", -2500, 2500, math.floor(force.vector.z * 100), 1, function(value)
            force.vector.z = value / 100
        end)

        force.menu:divider("Force Offset")
        force.menu:slider_float("X", { "rlforceoffsetx".. command.name}, "", -2500, 2500, math.floor(force.offset.x * 100), 1, function(value)
            force.offset.x = value / 100
        end)
        force.menu:slider_float("Y", { "rlforceoffsety".. command.name}, "", -2500, 2500, math.floor(force.offset.y * 100), 1, function(value)
            force.offset.y = value / 100
        end)
        force.menu:slider_float("Z", { "rlforceoffsetz".. command.name}, "", -2500, 2500, math.floor(force.offset.z * 100), 1, function(value)
            force.offset.z = value / 100
        end)

    end

end


--- Settings Menu
---r

--menus.settings = menu.my_root():list("Settings", {}, "Configuration options for this script.")

---
--- About Menu
---

local script_meta_menu = menu.my_root():list("About RocketLeague", {}, "Information about the script itself")
script_meta_menu:divider("RocketLeague")
script_meta_menu:readonly("Version", SCRIPT_VERSION)
if auto_update_config and auto_updater then
    script_meta_menu:action("Check for Update", {}, "The script will automatically check for updates at most daily, but you can manually check using this option anytime.", function()
        auto_update_config.check_interval = 0
        if auto_updater.run_auto_update(auto_update_config) then
            util.toast("No updates found")
        end
    end)
end
script_meta_menu:hyperlink("Github Source", "https://github.com/hexarobi/stand-lua-rocketleague", "View source files on Github")
script_meta_menu:hyperlink("Discord", "https://discord.gg/RF4N7cKz", "Open Discord Server")
