--$$\        $$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$$\ 
--$$ |      $$  __$$\ $$$\  $$ |$$  __$$\ $$  _____|
--$$ |      $$ /  $$ |$$$$\ $$ |$$ /  \__|$$ |      
--$$ |      $$$$$$$$ |$$ $$\$$ |$$ |      $$$$$\    
--$$ |      $$  __$$ |$$ \$$$$ |$$ |      $$  __|   
--$$ |      $$ |  $$ |$$ |\$$$ |$$ |  $$\ $$ |      
--$$$$$$$$\ $$ |  $$ |$$ | \$$ |\$$$$$$  |$$$$$$$$\ 
--\________|\__|  \__|\__|  \__| \______/ \________|
-- coded by Lance/stonerchrist on Discord
util.require_natives("2944b", "g")
pluto_use "0.6.0"
local car_hdl = INVALID_GUID

function say(text) 
    util.toast('[DASHMASTER] ' .. text)
end

util.create_tick_handler(function()
    car_hdl = entities.get_user_vehicle_as_handle(false)
end) 


resources_dir = filesystem.resources_dir() .. '\\dashmaster\\'
-- filesystem handling and logo 
if not filesystem.is_dir(resources_dir) then
    say("Resources dir is missing. The script will now exit.")
    util.stop_script()
end

local gauge_bg = directx.create_texture(resources_dir .. '/dial.png')
local gear_ring = directx.create_texture(resources_dir .. '/gear_ring.png')
local redline = directx.create_texture(resources_dir .. '/redline.png')
local needle = directx.create_texture(resources_dir .. '/needle.png')
local wrench = directx.create_texture(resources_dir .. '/wrench.png')

local gears = {}
for i=0, 9 do 
    gears[i] = directx.create_texture(resources_dir .. '/gear_' .. tostring(i) .. '.png')
end

local speed_nums = {}
for i=0, 9 do 
    speed_nums[i] = directx.create_texture(resources_dir .. '/mph_' .. tostring(i) .. '.png')
end

local mph_label = directx.create_texture(resources_dir .. '/mph_label.png')
local kph_label = directx.create_texture(resources_dir .. '/kph_label.png')
local ms_label = directx.create_texture(resources_dir .. '/ms_label.png')
local knots_label =  directx.create_texture(resources_dir .. '/knots_label.png')

local speed_setting = 'MPH'
local speed_settings = {{1, 'MPH', {}}, {2,'KPH'}, {3, 'M/S'}, {4, 'Knots'}}
menu.my_root():list_select("Speed unit", {'dashmasterunits'}, "", speed_settings, 1, function(unit)
    speed_setting = speed_settings[unit][2]
end)

local dm_x_off = 0.00 
local dm_y_off = 0.00
local gauge_scale = 0.08
local speed_scale = 0.06
local trail_color = {r = 1, g = 1, b = 1, a = 0.6}
local hud_list = menu.my_root():list('HUD', {}, '')
local color_list = menu.my_root():list('Colors', {}, '')
local trails_list = menu.my_root():list('Trails', {}, '')

local trail_scale = 1.0
local trail_interval = 300 

function request_ptfx_asset(asset)
    local request_time = os.time()
    REQUEST_NAMED_PTFX_ASSET(asset)
    while not HAS_NAMED_PTFX_ASSET_LOADED(asset) do
        if os.time() - request_time >= 10 then
            util.toast("Fail")
            break
        end
        util.yield()
    end
end

local ptfxs = {}

local trails = {
    { asset = "scr_powerplay", effect = "sp_powerplay_beast_appear_trails"},
    { asset = 'scr_rcpaparazzo1', effect = 'scr_mich4_firework_sparkle_spawn'},
    { asset = 'core', effect = 'ent_brk_banknotes'},
    { asset = 'core', effect = 'bul_gravel_heli' },
    { asset = 'core', effect = 'ent_dst_concrete_large' },
    { asset = 'core', effect = 'bul_wood_splinter' },
    { asset = 'core', effect = 'fire_wrecked_plane_cockpit' },
    { asset = 'core', effect = 'wheel_fric_water' },
    { asset = 'core', effect = 'proj_flare_trail' },
    { asset = 'core', effect = 'exp_grd_grenade_lod' },
    -- ... (other entries)
    { asset = 'core', effect = 'ent_amb_fbi_smoulder_lg' },
    { asset = 'core', effect = 'ent_amb_fbi_fire_beam' },
    { asset = 'core', effect = 'ent_sht_bush_foliage' },
    { asset = 'core', effect = 'ped_foot_woodchips' },
    { asset = 'core', effect = 'ent_dst_sweet_boxes' },
    { asset = 'core', effect = 'ped_foot_sand_deep' },
    { asset = 'core', effect = 'ped_foot_gravel' },
    { asset = 'core', effect = 'ent_dst_cig_packets' },
    { asset = 'core', effect = 'ent_amb_wind_litter_dust_dir' },
    { asset = 'core', effect = 'ent_dst_wood_splinter' },
    { asset = 'core', effect = 'bul_gravel' },
    -- ... (other entries)
    { asset = 'core', effect = 'exp_air_rpg_plane' },
    { asset = 'core', effect = 'water_jetski_bow1' },
    { asset = 'core', effect = 'proj_missile_trail' },
    { asset = 'core', effect = 'fire_petroltank_heli' },
    { asset = 'core', effect = 'exp_grd_plane' },
    { asset = 'core', effect = 'ent_amb_water_drips_lg' },
    { asset = 'core', effect = 'ent_amb_smoke_gaswork' },
    { asset = 'core', effect = 'proj_flare_fuse_fp' },
    { asset = 'core', effect = 'ent_amb_smoke_chicken' },
    { asset = 'core', effect = 'water_jetski_entry2' },
    { asset = 'core', effect = 'bang_mud' },
    { asset = 'core', effect = 'exp_air_rpg_plane_sp' },
    { asset = 'core', effect = 'water_boat_entry' },
    { asset = 'core', effect = 'fire_petrol_one' },
    { asset = 'core', effect = 'ent_amb_cold_air_floor' },
    { asset = 'core', effect = 'ent_col_tree_oranges' },
    { asset = 'core', effect = 'ent_amb_fbi_smoke_land_lt' },
    { asset = 'core', effect = 'ent_anim_cig_smoke' },
    { asset = 'core', effect = 'ent_amb_fbi_fire_door' }
}


local trails_for_selector = {}
for id, trail in pairs(trails) do 
    trails_for_selector[id] = {id, trail.effect, {}}
end

local cur_trail = 1
local cur_trail_bones = {}

function kill_ptfxs()
    for _, ptfx in pairs(ptfxs) do 
        STOP_PARTICLE_FX_LOOPED(ptfx, false)
		REMOVE_PARTICLE_FX(ptfx, false)
    end
end

local vehicle_bones = {
    'wheel_lf', 'wheel_rf', 'wheel_lm1', 'wheel_rm1', 'wheel_lm2', 'wheel_rm2', 'wheel_lm3', 'wheel_rm3', 'wheel_lr', 'wheel_rr',
    'wheel_f', 'wheel_r', 'wing_rf', 'wing_lf', 'chassis', 'boot', 'exhaust', 'engine', 'headlight_l', 'headlight_r', 'taillight_l', 'taillight_r', 'indicator_lf', 'indicator_rf', 'indicator_lr', 'indicator_rr', 'brakelight_l', 'brakelight_r', 'brakelight_m',
    'reversinglight_l', 'reversinglight_r', 'numberplate', 'roof', 'roof2', 'mast', 'carriage', 'frame_1', 'frame_2', 'frame_3', 'extra_1', 'extra_2', 'extra_3', 'extra_4', 'extra_5', 'extra_6', 'extra_7', 'extra_8', 'extra_9', 'extra_ten', 'extra_11', 'extra_12',
    'handlebars', 'pedal_r', 'pedal_l', 'rudder', 'rudder2', 'barracks', 'pontoon_l', 'pontoon_r', 'light_cover', 'neon_l', 'neon_r', 'neon_f', 'neon_b', 'dashglow', 'engineblock', 'bobble_head'
}


function apply_ptfxs()
    local bone_indexes = {}
    for _, name in pairs(cur_trail_bones) do 
        if name ~= nil then 
            local bone = GET_ENTITY_BONE_INDEX_BY_NAME(car_hdl, name)
            if bone ~= -1 then 
                bone_indexes[#bone_indexes+1] = bone
            end
        end
    end 

    local fx = trails[cur_trail]
    for _, b in pairs(bone_indexes) do 
        request_ptfx_asset(fx.asset)
        USE_PARTICLE_FX_ASSET(fx.asset)
        local ptfx = START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE(fx.effect, car_hdl, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, b, trail_scale, true, true, true, trail_color.r, trail_color.g, trail_color.b, trail_color.a)
        --START_PARTICLE_FX_LOOPED_ON_ENTITY_BONE(const char* effectName, Entity entity, float xOffset, float yOffset, float zOffset, float xRot, float yRot, float zRot, int boneIndex, float scale, BOOL xAxis, BOOL yAxis, BOOL zAxis)
        ptfxs[#ptfxs+1] = ptfx
    end
end


local last_car_hdl = 0
local car_trails = false
util.create_tick_handler(function()
    if car_hdl ~= last_car_hdl then
        kill_ptfxs()
        last_car_hdl = car_hdl 
        if car_trails then 
            apply_ptfxs()
        end
    end
end)

util.create_tick_handler(function()
    if car_trails then 
        util.yield(trail_interval)
        kill_ptfxs()
        apply_ptfxs()
    end
end)

trails_list:toggle('Trails', {'dmtrails'}, '', function(on)
    if not car_hdl then 
        menu.trigger_commands('dmtrails off')
        car_trails = false
    end
    if on then 
        car_trails = true 
        last_car_hdl = 0 
    else 
        kill_ptfxs()
        car_trails = false 
        last_car_hdl = 0
    end
end)

trails_list:colour('Trail color', {'dmtrailcolor'}, '', trail_color, true, function(color)
    trail_color = color
end)

trails_list:slider_float('Trail scale', {'dmtrailscale'}, '', 10, 1000, 100, 1, function(val)
    trail_scale = val * 0.01
end)

trails_list:slider('Trail interval (ms)', {'dmtrailinterval'}, '', 10, 3000, 300, 1, function(val)
    trail_interval = val
end)

local supertrail_segments = {}

function new_supertrail_segment(ent)
    local c = GET_ENTITY_COORDS(ent) 
    local trail = {
        pos = c, 
        rot = {x = 0, y = 0, z = 0},
        dimensions = {x = 1, y = 1, z = 1}
    }
    return trail 
end

function kill_segment_after_time(segment, time)
    util.create_thread(function()
        util.yield(time)
        supertrail_segments[segment] = nil
    end)
end

trails_list:toggle_loop('Supertrail', {}, '', function()
    local c = players.get_position(players.user())
    for index, segment in pairs(supertrail_segments) do 
        if segment ~= nil then 
            util.draw_box(segment.pos, segment.rot, segment.dimensions, 255, 255, 255, 100)
        end
    end
    local new_segment = new_supertrail_segment(players.user_ped())
    supertrail_segments[#supertrail_segments+1] = new_segment
    kill_segment_after_time(#supertrail_segments, 300)
end)


trails_list:list_select('Trail', {'dmtrail'}, '', trails_for_selector, 1, function(index, value)
    cur_trail = index
    kill_ptfxs()
    apply_ptfxs()
end)

local trail_bones_sel = trails_list:list('Bones', {'dmtrailbones'}, 'Shiver me timbers!')
for _, bone in pairs(vehicle_bones) do 
    local desc = 'Enable/Disable trail off this bone. If it doesn\'t appear, it\'s possible that your vehicle doesn\'t have this bone. '
    if bone == 'mast' then 
        desc = 'ahoy lookin ah'
    end
    trail_bones_sel:toggle(bone, {}, desc, function(on)
        if on then 
            cur_trail_bones[bone] = bone
            kill_ptfxs()
            apply_ptfxs()
        else
            cur_trail_bones[bone] = nil
            kill_ptfxs()
            apply_ptfxs()
        end
    end)
end

local gear_color = {r = 0, g = 1, b = 0.5, a = 1}
color_list:colour("Gear color", {"dmgearcolor"}, "", gear_color, false, function(color)
    gear_color = color
end) 

local gauge_color = {r = 0, g = 0, b = 0, a = 1}
color_list:colour("Gauge color", {"dmgaugecolor"}, "", gauge_color, false, function(color)
    gauge_color = color
end) 

local needle_color = {r = 1, g = 1, b = 1, a = 0.4}
color_list:colour("Needle color", {"dmneedlecolor"}, "", gear_color, false, function(color)
    needle_color = color
end) 

local redline_color = {r = 0.8, g = 0.03, b = 0.3, a = 1}
color_list:colour("Redline color", {"dmredlinecolor"}, "", redline_color, false, function(color)
    redline_color = color
end)

local speed_color = {r = 1, g = 1, b = 1, a = 1}
color_list:colour("Speed color", {"dmspeedcolor"}, "", speed_color, false, function(color)
    speed_color = color
end)

local cam_root = menu.my_root():list('Cameras', {}, '')

hud_list:slider_float('X offset', {'dmxoff'}, '', -2000, 2000, 0, 1, function(val)
    dm_x_off = val * 0.01 
end)

hud_list:slider_float('Y offset', {'dmyoff'}, '', -2000, 2000, 0, 1, function(val)
    dm_y_off = val * 0.01 
end)

hud_list:slider_float('Gauge scale', {'dmgaugescale'}, '', 0, 2000, 8, 1, function(val)
    gauge_scale = val * 0.01 
end)

hud_list:slider_float('Speed scale', {'dmspeedscale'}, '', 0, 2000, 6, 1, function(val)
    speed_scale = val * 0.01 
end)

local draw_tach = true 
hud_list:toggle('Draw tachometer', {'dmdrawtach'}, '', function(on)
    draw_tach = on
end, true)


local draw_speed = true 
hud_list:toggle('Draw speed', {'dmdrawspeed'}, '', function(on)
    draw_speed = on
end, true)


menu.my_root():toggle_loop('Power steering', {'powersteering'}, "Applies rotational force to assist steering, regardless of grip. Great for drifting!", function()
    local steering = GET_CONTROL_NORMAL(30, 30)
    if steering ~= 0.0 and car_hdl ~= INVALID_GUID then 
        APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(car_hdl, 5, 0.0, 0.0, -(steering * 0.1), true, true, true, true)
    end
end)

local drift_key_root = menu.my_root():list('Drift key')

local drift_control_id = 21
drift_key_root:slider('Control ID', {'driftkeyset'}, 'Set a control ID to hold to drift. The default is 21 which is the sprint key or shift.', 0, 360, 21, 1, function(val)
    drift_control_id = val
end)
drift_key_root:hyperlink('Control ID\'s list', 'https://docs.fivem.net/docs/game-references/controls/')


drift_key_root:toggle_loop('Drift key', {'driftkey'}, "", function()
    if IS_CONTROL_PRESSED(drift_control_id, drift_control_id) then
        SET_VEHICLE_REDUCE_GRIP(car_hdl, true)
        SET_VEHICLE_REDUCE_GRIP_LEVEL(car_hdl, 0.0)
    else
        SET_VEHICLE_REDUCE_GRIP(car_hdl, false)
    end
end)


hud_list:toggle_loop("Draw control values", {""}, "", function()
    if car_hdl ~= INVALID_GUID then
        local center_x = 0.8
        local center_y = 0.8
        -- main underlay
        directx.draw_rect(center_x - 0.062, center_y - 0.125, 0.12, 0.13, {r = 0, g = 0, b = 0, a = 0.2})
        -- throttle
        directx.draw_rect(center_x, center_y, 0.005, -GET_CONTROL_NORMAL(87, 87)/10, {r = 0, g = 1, b = 0, a =1})
        -- brake 
        directx.draw_rect(center_x - 0.01, center_y, 0.005, -GET_CONTROL_NORMAL(72, 72)/10, {r = 1, g = 0, b = 0, a =1 })
        -- steering
        directx.draw_rect(center_x - 0.0025, center_y - 0.115, math.max(GET_CONTROL_NORMAL(146, 146)/20), 0.01, {r = 0, g = 0.5, b = 1, a =1 })
    end
end)

local af_downforce = 0.0

util.create_tick_handler(function()
    if car_hdl ~= INVALID_GUID and af_downforce ~= 0.0 then  
        local vel = GET_ENTITY_VELOCITY(car_hdl)
        vel['z'] = -vel['z']
        APPLY_FORCE_TO_ENTITY(car_hdl, 2, 0, 0, -af_downforce -vel['z'], 0, 0, 0, 0, true, false, true, false, true)
    end
end)

menu.my_root():slider_float("Artificial downforce", {'afdownforce'}, '', 0, 10000, 0, 10  , function(v)
    af_downforce = v * 0.01
end)

menu.my_root():action('Compress car', {}, '', function()
    for i = 1, 1000 do
        SET_VEHICLE_DAMAGE(car_hdl, math.random(-10, 10), math.random(-10, 10), math.random(-10, 10), 10000.0, 1850.0, true)
    end
end)

local cur_engine_sound_override = 'off' --placeholder value, will be changed automatically
local last_car = 0
local last_esound_override = -1

function update_engine_sound(car, sound) 
    FORCE_USE_AUDIO_GAME_OBJECT(car, sound)
end

util.create_tick_handler(function() 
    if car_hdl ~= INVALID_GUID then 
        local ct = true 
        if (last_car ~= car_hdl and cur_engine_sound_override == 'Off') then 
            ct = false
        end

        if ct then 
            if (last_esound_override ~= cur_engine_sound_override) or (last_car ~= car_hdl)  then 
                update_engine_sound(car_hdl, cur_engine_sound_override)
                last_esound_override = cur_engine_sound_override
                last_car = car_hdl
            end
        end
    end
end)

local engine_sound_overrides = {{1, 'Off'}, {2, 'Adder'}, {3, 'Zentorno'}, {4, 'Openwheel1'}, {5, 'Openwheel2'}, {6, 'Formula'}, {7, 'Formula2'}, {8, 'Tractor'}, {9, 'Buffalo4'}, {10, 'XA21'}, {11, 'Drafter'}, {12, 'Jugular'}, {13, 'TurismoR'}, {14, 'Voltic2'}, {15, 'Neon'}}
menu.my_root():list_select("Engine swap", {}, 'Make your car\'s engine sound like another engine.\nOnly you can hear this.', engine_sound_overrides, 1, function(index, val)
    if index == 1 then
        local model_name = util.reverse_joaat(GET_ENTITY_MODEL(car_hdl))
        update_engine_sound(car_hdl, model_name)
        return
    end
    cur_engine_sound_override = val
end)

local top_cam = 0
local top_cam_ht = 20
local top_down_mode = false
local top_were_we_in_a_car = false

util.create_thread(function()
    if top_down_mode then 
        SET_CAM_ROT(top_cam, GET_ENTITY_HEADING(players.user_ped()), 0.0, 0.0, 0)
        local v = GET_VEHICLE_PED_IS_IN(players.user_ped(), true)
        if v ~= 0 then 
            if not top_were_we_in_a_car then 
                DETACH_CAM(top_cam)
                top_were_we_in_a_car = true 
                ATTACH_CAM_TO_ENTITY(top_cam, v, 0.0, 0.0, top_cam_ht, true)
            end
        else
            if top_were_we_in_a_car then 
                DETACH_CAM(top_cam)
                ATTACH_CAM_TO_ENTITY(top_cam, players.user_ped(), 0.0, 0.0, top_cam_ht, true)
            end

        end
    end
end)


cam_root:toggle("Top-down camera", {''}, '', function(on)
    if on then
        local c = players.get_position(players.user())
        local camera = CREATE_CAM_WITH_PARAMS('DEFAULT_SCRIPTED_CAMERA', c.x, c.y, c.z + top_cam_ht, -90.0, 0.0, 0.0, 120, true, 0) 
        top_cam = camera
        RENDER_SCRIPT_CAMS(true, false, 0, true, true, 0)
        ATTACH_CAM_TO_ENTITY(camera, players.user_ped(), 0.0, 0.0, top_cam_ht, true)
        top_down_mode = true
        --HARD_ATTACH_CAM_TO_ENTITY(camera, players.user_ped(), -90.0, 0.0, 0.0, 0.0, 0.0, top_cam_ht, true)
    else
        RENDER_SCRIPT_CAMS(false, false, 0, true, true, 0)
        DESTROY_CAM(top_cam, false) 
        top_cam = 0
        top_down_mode = false
    end
end)

local cam2_root = cam_root:list('Camera 2.0', {}, '')
local cam_2_mode = false
local cam2 = 0 
local cam2_pitch = 0
local cam2_yaw = 0.01
local incr_mult = 2
local cam2_x_off = 0 
local cam2_y_off = -5
local cam2_z_off = 3
local cam2_tar_ang = 30
local cam2_rot_speed = 0.40
local have_cam2_vals_changed = true 

cam2_root:slider_float('X offset', {'cam2xoff'}, '', -2000, 2000, 0, 1, function(val)
    cam2_x_off = val * 0.01 
    have_cam2_vals_changed = true
end)

cam2_root:slider_float('Y offset', {'cam2yoff'}, '', -2000, 2000, -500, 1, function(val)
    cam2_y_off = val * 0.01 
    have_cam2_vals_changed = true
end)

cam2_root:slider_float('Z offset', {'cam2zoff'}, '', -2000, 2000, 300, 1, function(val)
    cam2_z_off = val * 0.01 
    have_cam2_vals_changed = true
end)

cam2_root:slider('Target angle', {'cam2tar'}, '', -360, 360, 30, 1, function(val)
    cam2_tar_ang = val
end)


cam2_root:slider_float('Rotation speed', {'cam2rotspeed'}, '', 10, 1000, 40, 1, function(val)
    cam2_rot_speed = val * 0.01
end)

local m_shift_up_this_frame = false 
local m_shift_down_this_frame = false 

local manual_transmission_list = menu.my_root():list("Manual Transmission simulation", {'dmmt'}, '')
local manual_mode = false 
manual_transmission_list:toggle('Simulate Manual Transmission', {}, '', function(on)
    manual_mode = on
    while true do 
        if player_cur_car ~= 0 then 
            local addr = entities.get_user_vehicle_as_pointer()
            local cur_gear = entities.get_current_gear(addr)
            local next_gear = entities.get_next_gear(addr)
            if not manual_mode then 
                entities.set_next_gear(addr, next_gear)
                break 
            end
            if m_shift_up_this_frame then
                if cur_gear ~= 9 then
                    entities.set_next_gear(addr, cur_gear + 1)
                end
                m_shift_up_this_frame = false 
            elseif m_shift_down_this_frame then 
                if cur_gear > 1 then 
                    entities.set_next_gear(addr, cur_gear - 1)
                end
                m_shift_down_this_frame = false 
            else
                entities.set_next_gear(addr, cur_gear)
            end
        end
        util.yield()
    end
end)

manual_transmission_list:action("Shift up", {'dmshiftup'}, '', function()
    if car_hdl ~= INVALID_GUID then 
        m_shift_up_this_frame = true 
    end
end)

manual_transmission_list:action("Shift down", {'dmshiftdown'}, '', function()
    if car_hdl ~= INVALID_GUID then 
        m_shift_down_this_frame = true 
    end
end)



util.create_tick_handler(function()
    if cam_2_mode then 
        if car_hdl == INVALID_GUID then 
            v = players.user_ped()
        end

        if have_cam2_vals_changed then 
            ATTACH_CAM_TO_ENTITY(cam2, v, cam2_x_off, cam2_y_off, cam2_z_off, true)
            have_cam2_vals_changed = false 
        end

        local pitch_mul = GET_CONTROL_NORMAL(2, 2)
        local yaw_mul = GET_CONTROL_NORMAL(1, 1)
        if pitch_mul ~= 0 then 
            cam2_pitch = cam2_pitch + (pitch_mul * incr_mult)
        end

        if yaw_mul ~= 0 then 
            cam2_yaw = cam2_yaw + (yaw_mul * incr_mult)
        end

        if cam2_yaw >= 360 then 
            cam2_yaw = 0 
        end

        if cam2_yaw <= -360 then 
            cam2_yaw = 0 
        end

        if cam2_pitch >= 360 then 
            cam2_pitch = 0 
        end

        if cam2_pitch <= -360 then 
            cam2_pitch = 0 
        end
        
        local diff = GET_ENTITY_ROTATION(v, 0)['z'] - GET_CAM_ROT(cam2, 0)['z']
        if diff > cam2_tar_ang then 
            diff = diff - 1
            if diff < 200 then 
                cam2_yaw = cam2_yaw - cam2_rot_speed
            else
                cam2_yaw = cam2_yaw + cam2_rot_speed
            end
        end

        if diff < -cam2_tar_ang then 
            diff = diff + 1
            if diff < -200 then 
                cam2_yaw = cam2_yaw - cam2_rot_speed
            else
                cam2_yaw = cam2_yaw + cam2_rot_speed
            end
        end


        SET_CAM_ROT(cam2, -cam2_pitch, 0.0, -cam2_yaw, 0)
        local c = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(v, cam2_x_off, cam2_y_off, cam2_z_off)
        SET_CAM_COORD(cam2, c.x, c.y, c.z)
    end
end)

cam2_root:toggle("Camera 2.0", {''}, '', function(on)
    if on then
        local c = players.get_position(players.user())

        local camera = CREATE_CAM_WITH_PARAMS('DEFAULT_SCRIPTED_CAMERA', c.x, c.y, c.z, 0.0, 0.0, 0.0, 100, true, 0) 
        cam2 = camera
        RENDER_SCRIPT_CAMS(true, false, 0, true, true, 0)
        cam_2_mode = true

        local v = GET_VEHICLE_PED_IS_IN(players.user_ped(), false) 
        if v == -1 then 
            v = players.user_ped()
        end
        ATTACH_CAM_TO_ENTITY(cam2, v, cam2_x_off, cam2_y_off, cam2_z_off, true)

    else
        RENDER_SCRIPT_CAMS(false, false, 0, true, true, 0)
        DESTROY_CAM(cam2, false) 
        cam2 = 0
        cam_2_mode = false
    end
end)

cam2_root:action("Debug: Destroy current rendering cam", {}, "", function()
    DESTROY_CAM(GET_RENDERING_CAM())
end)



-- draw tachometer tick handler
util.create_tick_handler(function()
    local rpm = 0
    local car_ptr = entities.get_user_vehicle_as_pointer(false)
    if car_ptr ~= 0 then 
        rpm = entities.get_rpm(car_ptr)
        local car = entities.pointer_to_handle(car_ptr) 
        local texture_width = 0.08
        local texture_height = 0.08
        local posX = 0.8
        local posY = 0.7

        local max_rotation = math.rad(0.501 * 180) -- Maximum rotation angle the needle can reach in radians

        -- Calculate the needle rotation based on the car's speed and maximum speed
        local needle_rotation = (rpm / 1)/1.485  - 0.170
        local gear_pos_x = posX - 0.0001
        local gear_pos_y = posY - 0.005
        local gear = entities.get_current_gear(car_ptr)
        if draw_tach then 
            directx.draw_texture(gauge_bg, gauge_scale , gauge_scale , 0.5, 0.5, posX + dm_x_off, (posY - 0.004) + dm_y_off, 0, gauge_color)
            directx.draw_texture(gear_ring, gauge_scale , gauge_scale , 0.5, 0.5, posX + dm_x_off, (posY - 0.004) + dm_y_off, 0, gear_color)
            directx.draw_texture(redline, gauge_scale , gauge_scale , 0.5, 0.5, posX + dm_x_off, (posY - 0.004) + dm_y_off, 0, redline_color)
            directx.draw_texture(needle, gauge_scale , gauge_scale, 0.5, 0.5, posX + dm_x_off, posY + dm_y_off, needle_rotation, needle_color)
            directx.draw_texture(gears[gear], gauge_scale , gauge_scale , 0.5, 0.5, gear_pos_x + dm_x_off, gear_pos_y + dm_y_off, 0, gear_color)
        end

        local speed = math.ceil(GET_ENTITY_SPEED(car_hdl))
        local unit_text = ms_label
        pluto_switch speed_setting do 
            case "MPH":
                unit_text = mph_label
                speed = math.ceil(speed * 2.236936)
                break 
            case "KPH":
                speed = math.ceil(speed * 3.6)
                unit_text = kph_label 
                break
            case 'M/S': 
                speed = math.ceil(speed) 
                unit_text = ms_label
                break
            case 'Knots':
                speed = math.ceil(speed * 1.94384)
                unit_text = knots_label
                break
        end

        local cur_speed_num_offset = 0
        local speed_str = tostring(speed)
        if draw_speed then 
            for i=1, #speed_str do
                directx.draw_texture(speed_nums[tonumber(speed_str:sub(i,i))], speed_scale , speed_scale , 0.5, 0.5, ((posX) + cur_speed_num_offset) + dm_x_off, (posY + 0.1) + dm_y_off, 0, speed_color)
                cur_speed_num_offset += speed_scale / 2
            end

            cur_speed_num_offset += speed_scale / 5
            directx.draw_texture(unit_text, speed_scale , speed_scale , 0.5, 0.5, ((posX) + cur_speed_num_offset) + dm_x_off, ((posY + (speed_scale)) + dm_y_off) * 1.10, 0, speed_color)
        end

    end
end)

menu.my_root():hyperlink('Join Discord', 'https://discord.gg/zZ2eEjj88v', '')
-- cleanup for you :)
function on_stop()
    DESTROY_CAM(top_cam, true)
    DESTROY_CAM(cam2, true)
end