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
minetest.register_tool("halftest:chestplate_hev", {
	description = "Hev torso",
	inventory_image = "halftest_inv_chestplate_hev.png",
	groups = {armor_torso=17.4,physics_jump=0.10,physics_speed=0.10, armor_heal=9, armor_use=50, radiation=100},
	wear = 0,
})
minetest.register_tool("halftest:leggings_hev", {
	description = "Hev Leggings",
	inventory_image = "halftest_inv_leggings_hev.png",
	groups = {armor_legs=17.4,physics_jump=0.10,physics_speed=0.10, armor_heal=9, armor_use=50, radiation=100},
	wear = 0,
})
minetest.register_tool("halftest:boots_hev", {
	description = "Hev Boots",
	inventory_image = "halftest_inv_boots_hev.png",
	groups = {armor_feet=13.4,physics_jump=0.10,physics_speed=0.10, armor_heal=9, armor_use=50, radiation=100},
	wear = 0,
})
