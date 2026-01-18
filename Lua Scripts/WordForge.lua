--$$\        $$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$$\ 
--$$ |      $$  __$$\ $$$\  $$ |$$  __$$\ $$  _____|
--$$ |      $$ /  $$ |$$$$\ $$ |$$ /  \__|$$ |      
--$$ |      $$$$$$$$ |$$ $$\$$ |$$ |      $$$$$\    
--$$ |      $$  __$$ |$$ \$$$$ |$$ |      $$  __|   
--$$ |      $$ |  $$ |$$ |\$$$ |$$ |  $$\ $$ |      
--$$$$$$$$\ $$ |  $$ |$$ | \$$ |\$$$$$$  |$$$$$$$$\ 
--\________|\__|  \__|\__|  \__| \______/ \________|
-- coded by Lance/stonerchrist on Discord

util.require_natives("2944a", "g")


local root = menu.my_root()
local a_main_prop = util.joaat('sum_prop_barrier_ac_bend_45d')
local short = util.joaat('sum_prop_race_barrier_01_sec')
local long = util.joaat('sum_prop_race_barrier_02_sec')
local sharp_bend = util.joaat('sum_prop_barrier_ac_bend_30d')
local c_main_prop = util.joaat('sum_prop_barrier_ac_bend_90d')
local semi_sharp_bend = util.joaat('sum_prop_barrier_ac_bend_45d')

local all_props = {} 

function request_model_load(hash)
    util.request_model(hash, 2000)
end

function freeze(ent) 
    FREEZE_ENTITY_POSITION(ent, true)
    SET_ENTITY_INVINCIBLE(ent, true)
    all_props[#all_props+1] = ent
end

menu.my_root():action("Clean words", {}, '', function()
    for _, prop in pairs(all_props) do 
        entities.delete_by_handle(prop)
        all_props[prop] = nil 
    end
end)

local wf_dist = 30
local wf_ht = 30 

menu.my_root():slider("Distance from me", {"wfdist"}, '', 0, 300, 50, 1, function(val)
    wf_dist = val
end)

menu.my_root():slider("Height from me", {"wfheight"}, '', 0, 300, 50, 1, function(val)
    wf_ht = val
end)


function get_offset(entity, x, y, z)
    return GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entity, x, y, z)
end

local dist = 200.0
local altitude = 20
local cur_sentence_width = 0

function spawn_a(pos)
    cur_sentence_width += 5
    pos.z -= 4
    request_model_load(a_main_prop)
    request_model_load(short)
    local a = entities.create_object(a_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, 90.0, 110.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 1.0, 0.1, 0.0)
    a = entities.create_object(short, pos)
    SET_ENTITY_ROTATION(a, 90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    freeze(a)
end

function spawn_b(pos)
    cur_sentence_width += 13
    request_model_load(sharp_bend)
    request_model_load(long)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, 0.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 2.0, 0.0, 4.0)
    a = entities.create_object(sharp_bend, pos)
    SET_ENTITY_ROTATION(a, 90.0, 200.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    freeze(a)
    pos = get_offset(a, 2.0, -4.2, 0.0)
    a = entities.create_object(sharp_bend, pos)
    SET_ENTITY_ROTATION(a, 90.0, 200.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    freeze(a)
end

function spawn_c(pos)
    cur_sentence_width += 5
    request_model_load(c_main_prop)
    local a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, 90.0, 45.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_d(pos)
    cur_sentence_width += 8
    request_model_load(c_main_prop)
    request_model_load(long)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0.0, -0.5, 0.0)
    a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 134.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_e(pos)
    cur_sentence_width += 11
    request_model_load(short)
    request_model_load(long)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -5.0, -2.0, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0.0, 5.0, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0.0, 5.0, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_f(pos)
    cur_sentence_width += 10
    request_model_load(short)
    request_model_load(long)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -5.0, -2.0, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0.0, 5.0, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_g(pos)
    cur_sentence_width += 10
    request_model_load(c_main_prop)
    request_model_load(short)
    --request_model_load(short)
    local a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -45.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0, 2.5, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -45.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0.5, -2.0, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_h(pos)
    cur_sentence_width += 5
    request_model_load(long)
    request_model_load(short)
    --request_model_load(short)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0, 5, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0.5, -2.4, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_i(pos)
    cur_sentence_width += 10
    request_model_load(long)
    request_model_load(short)
    --request_model_load(short)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 5, 0, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0, -10, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_j(pos)
    cur_sentence_width += 10
    request_model_load(long)
    request_model_load(semi_sharp_bend)
    --request_model_load(short)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 2, 1.3, 0.0)
    a = entities.create_object(semi_sharp_bend, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -130.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    --pos = get_offset(a, 0, -10, 0.0)
    --a = entities.create_object(short, pos)
    --freeze(a)
    --SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_k(pos)
    cur_sentence_width += 10
    request_model_load(long)
    request_model_load(short)
    --request_model_load(short)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -2, -2, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -45.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -3, 3, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 45.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_l(pos)
    cur_sentence_width += 10
    request_model_load(long)
    request_model_load(short)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 5, -2, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_m(pos)
    cur_sentence_width += 9
    request_model_load(long)
    --request_model_load(short)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0.0, 9, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0, -2.5, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 1.8, -3.7, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_n(pos)
    cur_sentence_width += 5
    request_model_load(long)
    --request_model_load(short)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0.0, 5, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0, -2.5, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_o(pos)
    cur_sentence_width += 7
    request_model_load(c_main_prop)
    --request_model_load(short)
    local a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -0.1, 0, 0.0)
    a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_p(pos)
    cur_sentence_width += 10
    request_model_load(c_main_prop)
    request_model_load(long)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -2.0, -3, 0.0)
    a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -0.1, 0, 0.0)
    a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_q(pos)
    cur_sentence_width += 10
    request_model_load(c_main_prop)
    request_model_load(short)
    local a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -0.1, 0, 0.0)
    a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -2, 2, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 45.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_r(pos)
    cur_sentence_width += 14
    request_model_load(c_main_prop)
    request_model_load(long)
    request_model_load(short)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -2.0, -3, 0.0)
    a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -0.1, 0, 0.0)
    a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -5, 3, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_s(pos)
    cur_sentence_width += 10
    pos.z += 2
    request_model_load(c_main_prop)
    --request_model_load(short)
    local a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -0.1, 5, 0.0)
    a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -270.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -0.1, 0, 0.0)
    a = entities.create_object(c_main_prop, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 180.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_t(pos)
    cur_sentence_width += 10
    pos.y += 2
    pos.x -= 1.2
    pos.z += 4
    request_model_load(long)
    --request_model_load(short)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0, 5, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_u(pos)
    cur_sentence_width += 6
    request_model_load(long)
    request_model_load(short)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0, 4.8, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 4.2, -2.4, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end


function spawn_v(pos)
    cur_sentence_width += 10
    request_model_load(long)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 2.6, -4.6, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_w(pos)
    pos = get_offset(players.user_ped(), cur_sentence_width + 15, 50.0, 30.0)
    cur_sentence_width += 20
    request_model_load(long)
    --request_model_load(short)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0.0, 9, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0, -2.5, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 1.8, 4, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end


function spawn_x(pos)
    cur_sentence_width += 10
    request_model_load(long)
    local a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0, 0.0, 0.0)
    a = entities.create_object(long, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

function spawn_y(pos)
    cur_sentence_width += 10
    request_model_load(short)
    local a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 90.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -4, -1.2, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, -2, -1.5, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 60.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end


function spawn_z(pos)
    cur_sentence_width += 10
    request_model_load(short)
    local a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0, -4, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, 0.0, GET_ENTITY_HEADING(players.user_ped()), 0)
    pos = get_offset(a, 0, 2, 0.0)
    a = entities.create_object(short, pos)
    freeze(a)
    SET_ENTITY_ROTATION(a, -90.0, -45.0, GET_ENTITY_HEADING(players.user_ped()), 0)
end

menu.my_root():text_input("Spell", {'proteinspell'}, '', function(input)
    local cur_pos
    for i = 1, #input do
        cur_pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), cur_sentence_width, wf_dist, wf_ht)
        local c = input:sub(i,i)
        c = string.lower(c)
        pluto_switch c do 
            case 'a': 
                spawn_a(cur_pos)
                break
            case 'b':
                spawn_b(cur_pos)
                break
            case 'c':
                spawn_c(cur_pos)
                break
            case 'd':
                spawn_d(cur_pos)
                break
            case 'e':
                spawn_e(cur_pos)
                break
            case 'f':
                spawn_f(cur_pos)
                break
            case 'g':
                spawn_g(cur_pos)
                break
            case 'h':
                spawn_h(cur_pos)
                break
            case 'i':
                spawn_i(cur_pos)
                break
            case 'j':
                spawn_j(cur_pos)
                break
            case 'k':
                spawn_k(cur_pos)
                break
            case 'l':
                spawn_l(cur_pos)
                break
            case 'm':
                spawn_m(cur_pos)
                break
            case 'n':
                spawn_n(cur_pos)
                break
            case 'o':
                spawn_o(cur_pos)
                break
            case 'p':
                spawn_p(cur_pos)
                break
            case 'q':
                spawn_q(cur_pos)
                break
            case 'r':
                spawn_r(cur_pos)
                break
            case 's':
                spawn_s(cur_pos)
                break
            case 't':
                spawn_t(cur_pos)
                break
            case 'u':
                spawn_u(cur_pos)
                break
            case 'v':
                spawn_v(cur_pos)
                break
            case 'w':
                spawn_w(cur_pos)
                break
            case 'x':
                spawn_x(cur_pos)
                break
            case 'y':
                spawn_y(cur_pos)
                break
            case 'z':
                spawn_z(cur_pos)
                break
            case ' ':
                cur_sentence_width += 8
                break
            default:
                util.toast("Letter " .. input[i] .. ' is not a character that can be written')
                break
        end
    end
    cur_sentence_width = 0
end, "")
