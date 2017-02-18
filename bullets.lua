minetest.register_craftitem("halftest:bullet", {
	description = "Bullet",
	inventory_image = "halftest_gun_bullet.png",
})
local GUNS_RIFLE_BULLET_ENTITY={
	physical = false,
	timer=0,
	visual = "sprite",
	visual_size = {x=0.1, y=0.1},
	textures = {"halftest_gun_bullet.png"},
	lastpos={},
	collisionbox = {0,0,0,0,0,0},
}

GUNS_RIFLE_BULLET_ENTITY.on_step = function(self, dtime)
	self.timer=self.timer+dtime
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if self.timer>0.2 then
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "halftest:gun_bullet_entity" and obj:get_luaentity().name ~= "__builtin:item" then
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

minetest.register_entity("halftest:gun_bullet_entity", GUNS_RIFLE_BULLET_ENTITY)

minetest.register_craft({
	output = 'halftest:bullet 16',
	recipe = {
		{'default:steel_ingot', 'default:gold_lump'},
	}
})
