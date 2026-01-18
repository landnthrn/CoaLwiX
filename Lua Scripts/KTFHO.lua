util.require_natives("natives-3095a.g")

menu.my_root():toggle_loop("Force Headlights On", { "ktfho" }, "Forces the vehicle's headlights to stay on.", function()
    if entities.get_user_vehicle_as_handle(false) ~= -1 then
        SET_VEHICLE_LIGHTS(entities.get_user_vehicle_as_handle(false), 3)
    end
end)