util.keep_running()
pluto_use try, catch

local root = menu.my_root()
local fearless_peds

local get_all_peds_as_handles = entities.get_all_peds_as_handles
local ped = {}
local task = {}

ped.is_ped_a_player = function(--[[Ped (int)]] ped)native_invoker.begin_call()native_invoker.push_arg_int(ped)native_invoker.end_call_2(0x12534C348C6CB68B)return native_invoker.get_return_value_bool()end
ped.get_ped_config_flag = function(--[[Ped (int)]] ped,--[[int]] flagId,--[[BOOL (bool)]] p2)native_invoker.begin_call()native_invoker.push_arg_int(ped)native_invoker.push_arg_int(flagId)native_invoker.push_arg_bool(p2)native_invoker.end_call_2(0x7EE53118C892B513)return native_invoker.get_return_value_bool()end
ped.set_blocking_of_non_temporary_events = function(--[[Ped (int)]] ped,--[[BOOL (bool)]] toggle)native_invoker.begin_call()native_invoker.push_arg_int(ped)native_invoker.push_arg_bool(toggle)native_invoker.end_call_2(0x9F8AA94D6D97DBF4)end
task.task_set_blocking_of_non_temporary_events = function(--[[Ped (int)]] ped,--[[BOOL (bool)]] toggle)native_invoker.begin_call()native_invoker.push_arg_int(ped)native_invoker.push_arg_bool(toggle)native_invoker.end_call_2(0x90D2156198831D69)end

local function make_peds_fearless(state)
    try
        for get_all_peds_as_handles() as p do do
                if not ped.is_ped_a_player(p) and not ped.get_ped_config_flag(p, 17, true) then
                    ped.set_blocking_of_non_temporary_events(p, state)
                    task.task_set_blocking_of_non_temporary_events(p, state)
                end
            end
        end
    catch e then
        print($'Error: {e}')
    end
end

fearless_peds = root:toggle_loop('Fearless Peds', {}, '', function()
    make_peds_fearless(true)
end, function()
    make_peds_fearless(false)
end)

fearless_peds.value = true