local deg2rad = math.pi/180--made by Tonk
local rad2deg = 180/math.pi
local abs   = math.abs
local sqrt  = math.sqrt
local exp   = math.exp
local log   = math.log
local sin   = math.sin
local cos   = math.cos
local min   = math.min
local max   = math.max
local acos  = math.acos
local discard_mem = memory.alloc()

local minimum = memory.alloc()
local maximum = memory.alloc()
local function get_entiy_bounds(entity)
    GET_MODEL_DIMENSIONS(GET_ENTITY_MODEL(entity), minimum, maximum)
    local minimum_vec = v3.new(minimum)
    local maximum_vec = v3.new(maximum)
    local max_copy = v3.new(maximum_vec)
    max_copy:sub(minimum_vec)
    return {min = minimum_vec, max = maximum_vec, dimensions = max_copy}

end

local arrow_vertices <const> = {v3.new(0.2, 0.2, -2.0),v3.new(0.2, -0.2, -2.0),v3.new(0.2, 0.2, 0.0),v3.new(0.2, -0.2, 0.0),v3.new(-0.2, 0.2, -2.0),v3.new(-0.2, -0.2, -2.0),v3.new(-0.2, 0.2, 0.0),v3.new(-0.2, -0.2, 0.0),v3.new(0.32, -0.32, -2.0),v3.new(-0.32, -0.32, -2.0),v3.new(0.32, 0.32, -2.0),v3.new(-0.32, 0.32, -2.0),v3.new(0.0, -0.0, -2.5)}
local arrow_faces <const> = {{5 ,3, 1},{3 ,8, 4},{7 ,6, 8},{2 ,8, 6},{1 ,4, 2},{5 ,10, 6},{10, 12 ,13},{6 ,9, 2},{1 ,12, 5},{2 ,11, 1},{9 ,13 ,11},{11, 13 ,12},{13, 9 ,10},{5 ,7, 3},{3 ,7, 8},{7 ,5, 6},{2 ,4, 8},{1 ,3, 4},{5 ,12 ,10},{6 ,10, 9},{1 ,11 ,12},{2 ,9 ,11}}
local vert_1 = v3.new()
local vert_2 = v3.new()
local vert_3 = v3.new()
function draw_gizmo(pos, rot, scale, colour)
    for i = 1, #arrow_faces, 1 do
        local face = arrow_faces[i]
        for y = 1, 3, 1 do
            vert_1:set(arrow_vertices[face[1]]:get())
            vert_2:set(arrow_vertices[face[2]]:get())
            vert_3:set(arrow_vertices[face[3]]:get())
            rot:mul_v3_non_alloc(vert_1)
            rot:mul_v3_non_alloc(vert_2)
            rot:mul_v3_non_alloc(vert_3)
            vert_1:mul(scale)   vert_2:mul(scale)   vert_3:mul(scale)
            vert_1:add(pos)     vert_2:add(pos)     vert_3:add(pos)
            DRAW_POLY(
                vert_1.x, vert_1.y, vert_1.z, 
                vert_2.x, vert_2.y, vert_2.z, 
                vert_3.x, vert_3.y, vert_3.z,
                colour.r, colour.g, colour.b, colour.a 
            )
        end
    end
end

local gizmo_bounds = {
    min = v3.new(-0.32, -0.32, -2.5),
    max = v3.new(0.32, 0.32, 0),
    dimensions = v3.new(0.64, 0.64, 2.5)
}
function get_gizmos(entity)
    local bounds = get_entiy_bounds(entity)
    local rot = quaternion.from_entity(entity)
    local pos = GET_ENTITY_COORDS(entity)
    local cam_dir = GET_FINAL_RENDERED_CAM_ROT(2):toDir()

    local gizmos = {
        {rot = quaternion.from_euler(-90, 0, 0):mul(rot),     offset = rot:mul_v3(v3.new(bounds.max.x - bounds.dimensions.x * 0.5, bounds.max.y, bounds.max.z - bounds.dimensions.z * 0.5))},
        {rot = quaternion.from_euler(90, 0, 0):mul(rot),    offset = rot:mul_v3(v3.new(bounds.max.x - bounds.dimensions.x * 0.5, bounds.min.y, bounds.max.z - bounds.dimensions.z * 0.5))},
        {rot = quaternion.from_euler(90, 0, -90):mul(rot),     offset = rot:mul_v3(v3.new(bounds.max.x, bounds.max.y - bounds.dimensions.y * 0.5, bounds.max.z - bounds.dimensions.z * 0.5))},
        {rot = quaternion.from_euler(90, 0, 90):mul(rot),    offset = rot:mul_v3(v3.new(bounds.min.x, bounds.max.y - bounds.dimensions.y * 0.5, bounds.max.z - bounds.dimensions.z * 0.5))},
        {rot = quaternion.from_euler(0, 0, 0):mul(rot),     offset = rot:mul_v3(v3.new(bounds.max.x - bounds.dimensions.x * 0.5, bounds.max.y - bounds.dimensions.y * 0.5, bounds.max.z))},
        {rot = quaternion.from_euler(180, 0, 0):mul(rot),   offset = rot:mul_v3(v3.new(bounds.max.x - bounds.dimensions.x * 0.5, bounds.max.y - bounds.dimensions.y * 0.5, bounds.min.z))}
    }

    for _, g in pairs(gizmos) do
        local g_pos = v3.new(g.offset)
        g_pos:add(pos)
        g.pos = g_pos
    end
    return gizmos
end

local upVector_pointer = memory.alloc()
local rightVector_pointer = memory.alloc()
local forwardVector_pointer = memory.alloc()
local position_pointer = memory.alloc()
local indices <const> = {{1, 2},{1, 4},{1, 8},{3, 4},{3, 2},{3, 5},{6, 5},{6, 8},{6, 2},{7, 4},{7, 5},{7, 8}}
function draw_bounding_box(entity, colour)

    local rot = quaternion.from_entity(entity)
    local pos = GET_ENTITY_COORDS(entity)

    local bounds = get_entiy_bounds(entity)

    local minimum_vec = bounds.min
    local maximum_vec = bounds.max

    local vertices = {
        v3.new(minimum_vec.x, maximum_vec.y, maximum_vec.z),    --local top_left
        v3.new(minimum_vec.x, minimum_vec.y, maximum_vec.z),    --local bottom_left
        v3.new(maximum_vec.x, minimum_vec.y, maximum_vec.z),    --local bottom_right
        v3.new(maximum_vec),                                    --local top_right
        v3.new(maximum_vec.x, minimum_vec.y, minimum_vec.z),    --local bottom_right_back
        v3.new(minimum_vec),                                    --local bottom_left_back
        v3.new(maximum_vec.x, maximum_vec.y, minimum_vec.z),    --local top_right_back
        v3.new(minimum_vec.x, maximum_vec.y, minimum_vec.z)     --local top_left_back
    }

    for i = 1, #vertices, 1 do
        local vert = vertices[i]
        vert = rot:mul_v3(vert)
        vert:add(pos)
        vertices[i] = vert
    end

    for i = 1, #indices, 1 do
        local vert_a = vertices[indices[i][1]]
        local vert_b = vertices[indices[i][2]]

        DRAW_LINE(
            vert_a.x, vert_a.y, vert_a.z,
            vert_b.x, vert_b.y, vert_b.z,
           colour.r, colour.g, colour.b, colour.a
        )
    end
end

-- reimplementation of the native to make it easier to work with
function get_closest_point_on_line(p1, p2, point, clamp)
    local line = p2:sub(p1)
    local len = line:magnitude()
    line = line:div(len)
    local t = line:dot(point:sub(p1))

    if clamp then
        if t < 0 then
            t = 0
        elseif t > len then
            t = len
        end
    end

    return p1:add(line:mul(t))
end

local origin_a_copy = v3.new()
local origin_b_copy = v3.new()
function closest_point_on_lines(A, B, origin_a, origin_b)

    origin_a_copy:set(origin_a:get())
    origin_b_copy:set(origin_b:get())

    A:normalise()
    B:normalise()
    local magA = A:magnitude()
    local magB = B:magnitude()
    
    local _A = v3.new(A) 
    _A:div(magA)
    local _B = v3.new(B)
    _B:div(magB)
    
    local cross = _A:crossProduct(_B)
    local denom = cross:dot(cross)
    
    local t = v3.new(origin_b_copy)
    t:sub(origin_a_copy)
    
    if denom == 0 then
        local d0 = _A:dot(t)

        -- Segments overlap, return distance between parallel segments
        _A:mul(d0)
        t:mul(-1)
        t:add(_A)
        return nil, nil, (_A):magnitude()
    end
    
    -- Lines criss-cross: Calculate the projected closest points
    local detA = t:dot(_B:crossProduct(cross))
    local detB = t:dot(_A:crossProduct(cross))

    local t0 = detA / denom
    local t1 = detB / denom
    _A:mul(t0)
    _B:mul(t1)
    origin_a_copy:add(_A)
    origin_b_copy:add(_B)
    return origin_a_copy, origin_b_copy, v3.distance(origin_a_copy, origin_b_copy)
end


local function min_vec(a, b)
    return v3.new(min(a.x, b.x), min(a.y, b.y), min(a.z, b.z))
end
local function max_vec(a, b)
    return v3.new(max(a.x, b.x), max(a.y, b.y), max(a.z, b.z))
end
local function div_vec(a, b)
    return v3.new(a.x / b.x, a.y / b.y, a.z / b.z)
end
function ray_aabb_intersection(ray_origin, ray_dir, box_min, box_max)
    box_min:sub(ray_origin)
    box_max:sub(ray_origin)

    tMin = div_vec(box_min, ray_dir)
    tMax = div_vec(box_max, ray_dir)
    
    t1 = min_vec(tMin, tMax);
    t2 = max_vec(tMin, tMax);

    tNear = max(max(t1.x, t1.y), t1.z);
    tFar = min(min(t2.x, t2.y), t2.z);
    return tNear, tFar
end

local offset_min_copy = v3.new()
local offset_max_copy = v3.new()
local ray_origin_copy = v3.new()
function ray_box_intersection(ray_origin, ray_dir, pos, rot, offset_min, offset_max)
    ray_origin_copy:set(ray_origin:get())
    offset_min_copy:set(offset_min:get())
    offset_max_copy:set(offset_max:get())

    local inverse_rot = rot:inverse()

    ray_origin_copy:sub(pos)
    ray_origin = inverse_rot:mul_v3(ray_origin_copy)
    ray_dir = inverse_rot:mul_v3(ray_dir)
    
    return ray_aabb_intersection(ray_origin, ray_dir, offset_min_copy, offset_max_copy)
end

enum LOSFlags begin
    SCRIPT_INCLUDE_MOVER        = 1,
    SCRIPT_INCLUDE_VEHICLE      = 2,
    SCRIPT_INCLUDE_PED          = 4,
    SCRIPT_INCLUDE_RAGDOLL      = 8,
    SCRIPT_INCLUDE_OBJECT       = 16,
    SCRIPT_INCLUDE_PICKUP       = 32,
    SCRIPT_INCLUDE_GLASS        = 64,
    SCRIPT_INCLUDE_RIVER        = 128,
    SCRIPT_INCLUDE_FOLIAGE      = 256,
    SCRIPT_INCLUDE_ALL          = 511
end


local SCRIPT_SHAPETEST_OPTION_IGNORE_NO_COLLISION       = 4,

local probe_start_pos_out = memory.alloc()
local probe_end_pos_out = memory.alloc()
function get_mouse_cursor_dir()
    START_SHAPE_TEST_MOUSE_CURSOR_LOS_PROBE(probe_start_pos_out, probe_end_pos_out, 0, nil, 0)
    local probe_dir = v3.new(probe_end_pos_out)
    probe_dir:sub(v3.new(probe_start_pos_out))
    return probe_dir
end

function get_ent_clicked_on(dir)
    local cam_coord = GET_FINAL_RENDERED_CAM_COORD()
    local shapetest_index = START_EXPENSIVE_SYNCHRONOUS_SHAPE_TEST_LOS_PROBE(cam_coord.x, cam_coord.y, cam_coord.z, cam_coord.x + dir.x, cam_coord.y + dir.y,cam_coord.z + dir.z, SCRIPT_INCLUDE_VEHICLE | SCRIPT_INCLUDE_OBJECT | SCRIPT_INCLUDE_PED, nil, SCRIPT_SHAPETEST_OPTION_IGNORE_NO_COLLISION)
    local hit_pointer = memory.alloc_int()
    local hit_entity_pointer = memory.alloc_int()
    
    GET_SHAPE_TEST_RESULT(shapetest_index, hit_pointer, discard_mem, discard_mem, hit_entity_pointer)

    if memory.read_int(hit_pointer) ~= 1 then return -1 end

    return memory.read_int(hit_entity_pointer)
end

function get_gizmo_hovered(gizmos, gizmo_scale)
    local cam_coord = GET_FINAL_RENDERED_CAM_COORD()
    local closest = {dist = 9999, index = -1}

    for i, g in ipairs(gizmos) do
        local scale = g.pos:distance(cam_coord) * gizmo_scale

        local gizmo_bounds_min = v3.new(gizmo_bounds.min) 
        gizmo_bounds_min:mul(scale)
        local gizmo_bounds_max = v3.new(gizmo_bounds.max) 
        gizmo_bounds_max:mul(scale)

        local near, far = ray_box_intersection(cam_coord, get_mouse_cursor_dir(), g.pos, g.rot, gizmo_bounds_min, gizmo_bounds_max)
        if near < far and near < closest.dist then
            util.draw_debug_text(near - far)
            closest.dist = near
            closest.index = i
        end
    end

    return closest
end

function draw_all_gimos(gizmos, gizmo_scale)
    local cam_coord = GET_FINAL_RENDERED_CAM_COORD()
    for i, g in ipairs(gizmos) do
        local scale = g.pos:distance(cam_coord) * gizmo_scale
        draw_gizmo(g.pos, g.rot, scale, g.colour)
    end
end