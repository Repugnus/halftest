
-- This code is used from Christian9's Gun mod

bullet = {
	{"halftest:bullet", "halftest:gun_bullet_entity"},
}

local halftest_shoot_bullet = function(itemstack, player)
	for _,arrow in ipairs(arrows) do
		if player:get_inventory():get_stack("main", player:get_wield_index()+1):get_name() == arrow[1] then
			if not minetest.setting_getbool("creative_mode") then
				player:get_inventory():remove_item("main", arrow[1])
			end
			local playerpos = player:getpos()
			local obj = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, bullet[2])
			local dir = player:get_look_dir()
			obj:setvelocity({x=dir.x*19, y=dir.y*19, z=dir.z*19})
			obj:setacceleration({x=dir.x, y=dir.y, z=dir.z})
			obj:setyaw(player:get_look_yaw()+math.pi)
			if obj:get_luaentity().player == "" then
				obj:get_luaentity().player = player
			end
			obj:get_luaentity().node = player:get_inventory():get_stack("main", 1):get_name()
			return true
		end
	end
	return false
end

local halftest_shoot_bullets = function(itemstack, player)
	for _,arrow in ipairs(arrows) do
		if player:get_inventory():get_stack("main", player:get_wield_index()+1):get_name() == bullet[1] then
			if not minetest.setting_getbool("creative_mode") then
				player:get_inventory():remove_item("main", arrow[1])
			end
			local playerpos = player:getpos()
			local obj = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, bullet[2])
			local obj1 = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, bulet[2])
			local obj2 = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, bullet[2])
			local dir = player:get_look_dir()
			obj:setvelocity({x=dir.x*19, y=dir.y*19, z=dir.z*19})
			obj:setacceleration({x=dir.x, y=dir.y, z=dir.z})
			obj:setyaw(player:get_look_yaw()+math.pi)
			minetest.after(.1, function()
				obj1:setvelocity({x=dir.x*19, y=dir.y*19, z=dir.z*19})
				obj1:setacceleration({x=dir.x, y=dir.y, z=dir.z})
				obj1:setyaw(player:get_look_yaw()+math.pi)
				minetest.after(.1, function()
					obj2:setvelocity({x=dir.x*19, y=dir.y*19, z=dir.z*19})
					obj2:setacceleration({x=dir.x, y=dir.y, z=dir.z})
					obj2:setyaw(player:get_look_yaw()+math.pi)
				end)
			end)
			if obj:get_luaentity().player == "" then
				obj:get_luaentity().player = player
			end
			if obj1:get_luaentity().player == "" then
				obj1:get_luaentity().player = player
			end
			if obj2:get_luaentity().player == "" then
				obj2:get_luaentity().player = player
			end
			obj:get_luaentity().node = player:get_inventory():get_stack("main", 1):get_name()
			obj1:get_luaentity().node = player:get_inventory():get_stack("main", 1):get_name()
			obj2:get_luaentity().node = player:get_inventory():get_stack("main", 1):get_name()
			return true
		end
	end
	return false
end

minetest.register_tool("halftest:9mm", {
	description = "9mm",
	inventory_image = "halftest_9mm.png",
    stack_max = 1,
	on_use = function(itemstack, user, pointed_thing)
		if halftest_shoot_bullet(item, user, pointed_thing) then
			if not minetest.setting_getbool("creative_mode") then
				itemstack:add_wear(65535/200)
			end
		end
		return itemstack
	end,
})
minetest.register_tool("halftest:smg1", {
	description = "SMG1",
	inventory_image = "halftest_smg1.png",
    stack_max = 1,
	on_use = function(itemstack, user, pointed_thing)
		if halftest_shoot_bullets(item, user, pointed_thing) then
			if not minetest.setting_getbool("creative_mode") then
				itemstack:add_wear(65535/200)
			end
		end
		return itemstack
	end,
})
minetest.register_craft({
	output = 'halftest:9mm',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:wood'},
		{'', '', 'default:wood'},
	}
})
minetest.register_craft({
	output = 'halftest:smg1',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'', '', 'default:wood'},
	}
})

