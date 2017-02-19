dofile(minetest.get_modpath("halftest").."/bullets.lua")
dofile(minetest.get_modpath("halftest").."/guns.lua")
dofile(minetest.get_modpath("halftest").."/hud.lua")
minetest.register_tool("halftest:crowbar", {
	description = "Crowbar",
	inventory_image = "halftest_crowbar.png",
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level = 1,
		damage_groups = {fleshy = 7}
	}
})
minetest.register_craft({
	output = "halftest:crowbar 1",
	recipe = {
			{"default:steel_ingot", "dye:red", ""},
			{"dye:red", "default:steel_ingot", ""},
			{"", "", "default:steel_ingot"}
		}
})
