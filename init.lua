bed_colors = {"red", "blue", "cyan", "grey", "silver", "black", "yellow", "green", "magenta", "orange", "purple", "brown", "pink", "lime", "light_blue", "white"}

local function destroy(pos)
	minetest.dig_node(pos)
end

local function get_bed(pos, color)
	return minetest.find_node_near(pos, 4, "mcl_beds:bed_" .. color)
end

minetest.register_globalstep(function()
	if minetest.settings:get_bool("bed_destroyer") then
		local player_pos = minetest.localplayer:get_pos()

		for coloridx, color in pairs(bed_colors) do
			if get_bed(player_pos, color) ~= nil then
				destroy(get_bed(player_pos, color))
			end
		end
	end
end)

minetest.register_cheat("BedDestroyer", "Combat", "bed_destroyer")
