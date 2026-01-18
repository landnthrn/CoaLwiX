-- [FSLMoney v1.0]
-- Made by gaymer :3

util.keep_running()
util.require_natives("natives-3095a")

util.toast("Don't use this without FSL loaded!")
util.toast("Going above ~5 Quintillion can cause you to be unable to purchase anything.\n\nYou have been Warned")

root = menu.my_root()

root:action("Give $1 Quintillion", {}, "", function()
	STATS.STAT_INCREMENT(util.joaat("BANK_BALANCE"), 1000000000000000000)
end)

root:action("Remove $1 Quintillion", {}, "", function()
	local currentBank = util.stat_get_int64(util.joaat("BANK_BALANCE"))
	STATS.STAT_SET_INT(util.joaat("BANK_BALANCE"), 0)
	STATS.STAT_INCREMENT(util.joaat("BANK_BALANCE"), currentBank - 1000000000000000000)
end)

root:action("Reset Bank Balance", {}, "", function()
	STATS.STAT_SET_INT(util.joaat("BANK_BALANCE"), 0)
end)