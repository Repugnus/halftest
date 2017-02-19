minetest.register_craftitem("halftest:bullet", {
	description = "Bullet",
	inventory_image = "halftest_gun_bullet.png",
})
minetest.register_craftitem("halftest:smg1_bullet", {
	description = "Smg1 Bullet",
	inventory_image = "halftest_smg1_bullet.png",
})
minetest.register_craftitem("halftest:9mm_clip", {
	description = "9mm Clip",
	inventory_image = "halftest_9mm_clip.png",
})
minetest.register_craftitem("halftest:smg1_clip", {
	description = "Smg1 Clip",
	inventory_image = "halftest_smg1_clip.png",
})
local GUNS_9MM_BULLET_ENTITY={
	physical = false,
	timer=0,
	visual = "sprite",
	visual_size = {x=0.1, y=0.1},
	textures = {"halftest_gun_bullet.png"},
	lastpos={},
	collisionbox = {0,0,0,0,0,0},
}
local GUNS_SMG1_BULLET_ENTITY={
	physical = false,
	timer=0,
	visual = "sprite",
	visual_size = {x=0.1, y=0.1},
	textures = {"halftest_smg1_bullet.png"},
	lastpos={},
	collisionbox = {0,0,0,0,0,0},
}

GUNS_9MM_BULLET_ENTITY.on_step = function(self, dtime)
	self.timer=self.timer+dtime
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if self.timer>0.2 then
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "halftest:9mm_bullet_entity" and obj:get_luaentity().name ~= "__builtin:item" then
					local damage = 15
					obj:punch(self.object, 1.0, {
						full_punch_interval=1.0,
						damage_groups={fleshy=damage},
					}, nil)
					self.object:remove()
				end
			else
				local damage = 30
				obj:punch(self.object, 1.0, {
					full_punch_interval=1.0,
					damage_groups={fleshy=damage},
				}, nil)
				self.object:remove()
			end
		end
	end

	if self.lastpos.x~=nil then
		if node.name ~= "air" then
			self.object:remove()
		end
	end
	self.lastpos={x=pos.x, y=pos.y, z=pos.z}
end

GUNS_SMG1_BULLET_ENTITY.on_step = function(self, dtime)
	self.timer=self.timer+dtime
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if self.timer>0.2 then
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "halftest:smg1_bullet_entity" and obj:get_luaentity().name ~= "__builtin:item" and obj:get_luaentity() ~= player then
					local damage = 20
					obj:punch(self.object, 1.0, {
						full_punch_interval=1.0,
						damage_groups={fleshy=damage},
					}, nil)
					self.object:remove()
				end
			else
				local damage = 40
				obj:punch(self.object, 1.0, {
					full_punch_interval=1.0,
					damage_groups={fleshy=damage},
				}, nil)
				self.object:remove()
			end
		end
	end

	if self.lastpos.x~=nil then
		if node.name ~= "air" then
			self.object:remove()
		end
	end
	self.lastpos={x=pos.x, y=pos.y, z=pos.z}
end

minetest.register_entity("halftest:9mm_bullet_entity", GUNS_9MM_BULLET_ENTITY)
minetest.register_entity("halftest:smg1_bullet_entity", GUNS_SMG1_BULLET_ENTITY)

minetest.register_craft({
	output = 'halftest:bullet 16',
	recipe = {
		{'default:steel_ingot', 'default:gold_lump'},
	}
})
minetest.register_craft({
	output = 'halftest:smg1_bullet 16',
	recipe = {
		{'default:steel_ingot', 'default:gold_lump', 'default:steel_ingot'},
	}
})
minetest.register_craft({
	output = 'halftest:9mm_clip 1',
	recipe = {
		{"default:steel_ingot", "9mm_bullet", "default:steel_ingot"},
		{"default:steel_ingot", "9mm_bullet", "default:steel_ingot"},
		{"default:steel_ingot", "9mm_bullet", "default:steel_ingot"}
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
