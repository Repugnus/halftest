local function update_health(player)
	player:hud_change(player, "text", "health "..player:get_hp()*5)
end
minetest.register_on_joinplayer(function(player)
player:hud_set_flags({ healthbar=false })
player:hud_add({
         hud_elem_type = "text",
         position = {x = .04, y = .97},
         name = "health",
         text = "",
         number = 0xffa500
})
if minetest.setting_getbool("enable_damage") then
	update_health(player)
end
end)
minetest.register_on_player_hpchange(update_health)
minetest.register_on_respawnplayer(function(player)
	player:hud_change(player, "text", "health "..player:get_hp()*5)
end)

