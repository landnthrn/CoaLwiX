--[[THEME VARIABLES]]

local theme_name = "Cherax V4"
local theme_folder = "/Themes/Cherax/"
local textures_name = "Cherax_"
local img_format = ".gif"
local theme_frames = 400
local font = directx.create_font(filesystem.scripts_dir()..theme_folder.."Nasalization.spritefont")

--[[COLOURS]]

local colours = {
    command_box = {r = 13/255, g = 3/255, b = 21/255, a = 230/255},
    background = {r = 13/255, g = 3/255, b = 21/255, a = 240/255},
    highlight = {r = 87/255, g = 64/255, b = 251/255, a = 255/255},
    tabs_text = {r = 255/255, g = 255/255, b = 255/255, a = 255/255},
}

--===================================================[DO NOT TOUCH ANYTHING BELOW]=====================================================================================

local mroot = menu.my_root()

--[[COMMANDS]]

mroot:divider(theme_name.." Theme")

-----
local screen_x, screen_y = directx.get_client_size()
local aspect_ratio = screen_x / screen_y
local header_fix = mroot:slider_float("Fix Header Position (for non 16:9 resolutions)", {}, "", 0, 200, 123, 1, function() end) header_fix.visible = false

if tostring(aspect_ratio) != "1.7777777777778" then
    util.log($"Resolution: {screen_x} x {screen_y} Aspect Ratio: {aspect_ratio}")
    header_fix.visible = true
end
-----
fps = mroot:slider("Frames per Second", {"themefps"}, "Game FPS must be equivalent or higher.", 30, 120, 60, 5, function() end)
-----
alpha = mroot:slider("Header Opacity", {"headerop"}, "", 169, 255, 255, 1, function() end)
-----
mroot:slider("Background Opacity", {"bgop"}, "", 69, 255, 235, 1, function(v) colours.background.a = v/255 end)
-----
mroot:colour("Command Box Colour", {"cmbcolour"}, "", colours.command_box, true, function(c) colours.command_box = c end)
-----
loading_progress = mroot:toggle("Show Loading frames progress", {}, "", function() end)
-----
custom_tabs = mroot:toggle("Custom Tabs Text", {"customtabs"}, "", function() end)
-----
mroot:action("Reload Theme", {"reloadtheme"}, "", function()
    util.restart_script()
end)
-----
local tabs_name_ref = menu.ref_by_path("Stand>Settings>Appearance>Tabs>Show Name")
local frames, loaded_frames, frame_id = {}, 1, -1
util.create_thread(function() --[[FRAMES LOADER]]
    for i = 1, theme_frames do
        local texture = directx.create_texture(filesystem.scripts_dir()..theme_folder..textures_name..loaded_frames..img_format)
        frames[#frames + 1] = texture
        loaded_frames += 1
        if loaded_frames > 5 and loaded_frames < 10 then frame_id = 1 end
        util.yield()
    end
    util.toast($"{theme_name} Theme has been fully loaded.")
end)
-----
util.create_tick_handler(function() --[[FRAMES HANDLER]]
    if frame_id > 0 then
        if frame_id <= theme_frames -1 then
            frame_id += 1
        elseif frame_id == theme_frames then
            frame_id = 201
        end
    end
    util.yield(1000/fps.value)
end)
-----
while true do

    --[[GET MENU DIMENSIONS]]

    local menu_x, menu_y, menu_width, menu_height = menu.get_main_view_position_and_size() 
    local box_x, box_y, box_width, box_height = menu.command_box_get_dimensions()

    --[[DRAW TEXTURES LOADING PROGRESS]]

    if loading_progress.value and loaded_frames <= theme_frames then
        local title = ($"{theme_name} Theme")
        local title_w, title_h = directx.get_text_size(title, 0.8)
        local title_pos_x = (0.5 - title_w/2)
        local title_pos_y = 0.10
        local text = ($"Loading Frames... [{loaded_frames}/{theme_frames}]")
        local text_w, text_h = directx.get_text_size(text, 0.75)
        local text_pos_x = (0.5 - text_w/2)
        local text_pos_y = (title_pos_y + title_h + 0.005)
        if title_w > text_w then width = title_w pos_x = title_pos_x else width = text_w pos_x = text_pos_x end
        directx.draw_rect(pos_x-0.005, title_pos_y- 0.005, width + 0.01, title_h + text_h + 0.015, colours.command_box)
        directx.draw_rect(pos_x-0.005, title_pos_y + title_h + 0.0015, width + 0.01, 0.002, colours.highlight )
        directx.draw_text(title_pos_x, title_pos_y, title, 0, 0.8, colours.highlight, false, font)
        directx.draw_text(text_pos_x, text_pos_y, text, 0, 0.75, colours.highlight, false, font)
    end
    --[[DRAW COMMAND BOX BG]]

    if menu.command_box_is_open() then
        directx.draw_rect(box_x, box_y, box_width, box_height + 0.01, colours.command_box)
    end

    --[[DRAW MENU]]

    if menu.is_open() and loaded_frames > 5  then
        menu_x2 = menu_x - 0.0022

        directx.draw_texture(frames[frame_id] ,0.03545,0.0,0.0,0.0,menu_x-(header_fix.value*0.001),menu_y-0.0075,0.0000,{r = 1, g = 1, b = 1, a = alpha.value/255})--HEADER
    
        directx.draw_rect(menu_x2 -0.049, menu_y - 0.0055, menu_width + 0.055, 0.4509, colours.background)--[[MENU BACKGROUND]]
        
        directx.draw_rect(menu_x2 -0.0485, menu_y - 0.001, 0.046, 0.44, {r = 0, g = 0, b = 0, a = 1})--[[TABS BACKGROUND]]
    
        directx.draw_rect(menu_x2 -0.002, menu_y - 0.0075, 0.001, 0.452, colours.highlight)--[[MIDDEL BORDER]]
    
        directx.draw_rect(menu_x2 -0.04999, menu_y - 0.0075, menu_width + 0.056, 0.002, colours.highlight)--[[TOP BORDER]]
    
        directx.draw_rect(menu_x2 -0.04999, menu_y - 0.0075, 0.001, 0.452, colours.highlight)--[[LEFT BORDER]]
    
        directx.draw_rect(menu_x2 -0.04999, menu_y + 0.4436, menu_width + 0.056, 0.0015, colours.highlight)--[[BOTTOM BORDER]]
    
        directx.draw_rect(menu_x2 + menu_width + 0.005, menu_y - 0.0075, 0.001, 0.452, colours.highlight)--[[RIGHT BORDER]]

        --[[DRAW TABS NAME]]

        if custom_tabs.value then
            
            directx.draw_text(menu_x2 - 0.035, menu_y + 0.008, "Self", 0, 0.45, colours.tabs_text, false, font)

            directx.draw_text(menu_x2 - 0.041, menu_y + 0.0375, "Vehicle", 0, 0.45, colours.tabs_text, false, font)

            directx.draw_text(menu_x2 - 0.04, menu_y + 0.067, "Online", 0, 0.45, colours.tabs_text, false, font)

            directx.draw_text(menu_x2 - 0.043, menu_y + 0.0965, "Players", 0, 0.45, colours.tabs_text, false, font)

            directx.draw_text(menu_x2 - 0.04, menu_y + 0.126, "World", 0, 0.45, colours.tabs_text, false, font)

            directx.draw_text(menu_x2 - 0.0385, menu_y + 0.1555, "Game", 0, 0.45, colours.tabs_text, false, font)

            directx.draw_text(menu_x2 - 0.0365, menu_y + 0.185, "Misc", 0, 0.45, colours.tabs_text, false, font)

            if tabs_name_ref.value then tabs_name_ref.value = false end
        else
            if not tabs_name_ref.value then tabs_name_ref.value = true end
        end
    else
        frame_id = 1
    end
    util.yield()
end