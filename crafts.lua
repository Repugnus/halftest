minetest.register_craft({
	output = 'halftest:bullet 16',
	recipe = {
		{'default:steel_ingot', 'tnt:gun_powder'},
	}
})
minetest.register_craft({
	output = 'halftest:smg1_bullet 16',
	recipe = {
		{'default:steel_ingot', 'tnt:gun_powder', 'default:steel_ingot'},
	}
})
minetest.register_craft({
	output = "halftest:spas12_shell 16",
	recipe = {
		{"dye:red", "tnt:gun_powder", "dye:red"},
		{"dye:red", "tnt:gun_powder", "dye:red"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})
minetest.register_craft({
	output = 'halftest:9mm_clip 1',
	recipe = {
		{"default:steel_ingot", "halftest:bullet", "default:steel_ingot"},
		{"default:steel_ingot", "halftest:bullet", "default:steel_ingot"},
		{"default:steel_ingot", "halftest:bullet", "default:steel_ingot"}
	}
})
minetest.register_craft({
	output = 'halftest:smg1_clip 1',
	recipe = {
		{"default:steel_ingot", "halftest:smg1_bullet", "default:steel_ingot"},
		{"default:steel_ingot", "halftest:smg1_bullet", "default:steel_ingot"},
		{"default:steel_ingot", "halftest:smg1_bullet", "default:steel_ingot"}
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
minetest.register_craft({
	output = "halftest:gun_barrel",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})
minetest.register_craft({
	output = "halftest:gun_grip",
	recipe = {
		{"default:steel_ingot", "", ""},
		{"", "default:steel_ingot", ""},
		{"", "", "default:steel_ingot"}
	}
})
minetest.register_craft({
	output = "halftest:gun_handle",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "", "default:steel_ingot"},
		{"", "", "default:steel_ingot"}
	}
})
minetest.register_craft({
	output = "halftest:9mm 1",
	recipe = {
		{"", "halftest:gun_barrel", "default:steel_ingot"},
		{"", "", "halftest:gun_handle"}
	}
})
minetest.register_craft({
	output = "halftest:smg1 1",
	recipe = {
		{"halftest:gun_barrel", "halftest:gun_barrel", "default:steel_ingot"},
		{"halftest:gun_grip", "", "halftest:gun_handle"}
	}
})

minetest.register_craft({
	output = "halftest:spas12 1",
	recipe = {
		{"halftest:gun_barrel", "halftest:gun_barrel", "halftest:gun_barrel"},
		{"", "", "halftest:gun_handle"}
	}
})
