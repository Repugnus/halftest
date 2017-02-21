bullet = {
	{"halftest:bullet","halftest:smg1_bullet", "halftest:9mm_bullet_entity", "halftest:smg1_bullet_entity", "halftest:9mm_clip", "halftest:smg1_clip", "halftest:spas12_bullet_entity", "halftest:spas12_shell"},
}

local halftest_shoot_bullet = function(itemstack, player)
	for _,bullet in ipairs(bullet) do
		if player:get_inventory():get_stack("main", player:get_wield_index()+1):get_name() == bullet[5] then
			if not minetest.setting_getbool("creative_mode") then
				player:get_inventory():remove_item("main", bullet[5])
			end
			local playerpos = player:getpos()
			local obj = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, bullet[3])
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
	for _,bullet in ipairs(bullet) do
		if player:get_inventory():get_stack("main", player:get_wield_index()+1):get_name() == bullet[6] then
			if not minetest.setting_getbool("creative_mode") then
				player:get_inventory():remove_item("main", bullet[6])
			end
			local playerpos = player:getpos()
			local obj = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, bullet[4])
			local obj1 = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, bullet[4])
			local obj2 = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, bullet[4])
			local dir = player:get_look_dir()
			obj:setvelocity({x=dir.x*20, y=dir.y*20, z=dir.z*20})
			obj:setacceleration({x=dir.x, y=dir.y, z=dir.z})
			obj:setyaw(player:get_look_yaw()+math.pi)
			minetest.after(.001, function()
				obj1:setvelocity({x=dir.x*20, y=dir.y*20, z=dir.z*20})
				obj1:setacceleration({x=dir.x, y=dir.y, z=dir.z})
				obj1:setyaw(player:get_look_yaw()+math.pi)
				minetest.after(.001, function()
					obj2:setvelocity({x=dir.x*20, y=dir.y*20, z=dir.z*20})
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
local halftest_shoot_bullets1 = function(itemstack, player)
	for _,bullet in ipairs(bullet) do
		if player:get_inventory():get_stack("main", player:get_wield_index()+1):get_name() == bullet[8] then
			if not minetest.setting_getbool("creative_mode") then
				player:get_inventory():remove_item("main", bullet[8])
			end
			local playerpos = player:getpos()
			local obj = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, bullet[7])
			local obj1 = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, bullet[7])
			local obj2 = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, bullet[7])
			local dir = player:get_look_dir()
			obj:setvelocity({x=dir.x*20, y=dir.y*20, z=dir.z*20})
			obj:setacceleration({x=dir.x, y=dir.y+1, z=dir.z})
			obj:setyaw(player:get_look_yaw()+math.pi)
			obj1:setvelocity({x=dir.x*20, y=dir.y*20, z=dir.z*20})
			obj1:setacceleration({x=dir.x+10, y=dir.y, z=dir.z})
			obj1:setyaw(player:get_look_yaw()+math.pi)
			obj2:setvelocity({x=dir.x*20, y=dir.y*20, z=dir.z*20})
			obj2:setacceleration({x=dir.x, y=dir.y, z=dir.z-10})
			obj2:setyaw(player:get_look_yaw()+math.pi)
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
minetest.register_node("halftest:9mm", {
	description = "9mm",
	drawtype = "mesh",
	mesh = "gun.obj",
	tiles = {name="default_steel_block.png"},
	inventory_image = "halftest_9mm.png",
	on_place = function(itemstack, placer, pointed_thing)
		if minetest.get_node(pointed_thing.under).name == "default:chest_locked" then
			minetest.item_place(itemstack, placer, pointed_thing, param2)
		end
	end,
	on_use = function(itemstack, user, pointed_thing)
		if halftest_shoot_bullet(item, user, pointed_thing) then
			if not minetest.setting_getbool("creative_mode") then
				itemstack:add_wear(65535/200)
			end
		end
		return itemstack
	end,
	node_placement_prediction = "",
})
minetest.register_craftitem("halftest:smg1", {
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
minetest.register_craftitem("halftest:spas12", {
	description = "SPAS12",
	inventory_image = "halftest_spas12.png",
    stack_max = 1,
	on_use = function(itemstack, user, pointed_thing)
		if halftest_shoot_bullets1(item, user, pointed_thing) then
			if not minetest.setting_getbool("creative_mode") then
				itemstack:add_wear(65535/200)
			end
		end
		return itemstack
	end,
})
