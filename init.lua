local modname = "amogus"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
local S = minetest.get_translator(minetest.get_current_modname())

local colors_amogus = {
    {"red",         S("Red"),        "#D71E22",     "dye:red",                         },
	{"black",       S("Black"),      "#4A565E",     "dye:black",                       },
	{"white",       S("White"),      "#E9F7FF",     "dye:white",                       },
	{"rose",        S("Rose"),       "#FFD6EC",     "unifieddyes:faint_crimson",       },
	{"blue",        S("Blue"),       "#1D3CE9",     "dye:blue",                        },
	{"cyan",        S("Cyan"),       "#44FFF7",     "dye:cyan",                        },
	{"yellow",      S("Yellow"),     "#FFFF67",     "dye:yellow",                      },
	{"pink",        S("Pink"),       "#FF63D4",     "dye:pink",                        },
	{"purple",      S("Purple"),     "#783DD2",     "dye:violet",                      },
	{"orange",      S("Orange"),     "#FF8D1C",     "dye:orange",                      },
	{"banana",      S("Banana"),     "#FFFFBE",     "unifieddyes:faint_vermilion",     },
	{"coral",       S("Coral"),      "#EC7578",     "unifieddyes:faint_red",           },
	{"lime",        S("Lime"),       "#5BFE4B",     "dye:green",                       },
	{"green",       S("Green"),      "#1B913E",     "dye:dark_green",                  },
	{"gray",        S("Gray"),       "#8397A7",     "dye:grey",                        },
	{"maroon",      S("Maroon"),     "#6C2B3D",     "unifieddyes:dark_crimson",        },
	{"brown",       S("Brown"),      "#80582D",     "dye:brown",                       },
	{"tan",         S("Tan"),        "#9F9989",     "unifieddyes:dark_grey",           }
}

for _, col in ipairs(colors_amogus) do
    minetest.register_node("amogus:amogus_"..col[1],{
        description = S("@1 Amogus ", col[2]),
	    tiles = {"(blanktexture.png^[colorize:" .. col[3] .. ":255)^blanktextureup.png", "(blanktexture.png^[colorize:" .. col[3] .. ":255)^blanktexturebottom.png", "(blanktexture.png^[colorize:" .. col[3] .. ":255)^blanktextureright.png", "(blanktexture.png^[colorize:" .. col[3] .. ":255)^blanktextureleft.png", "blanktexture.png^[colorize:" .. col[3] .. ":255", "(blanktexture.png^[colorize:" .. col[3] .. ":255)^cyanface.png"},
	    drawtype = "nodebox",
	    node_box = {
	        type = "fixed",
		    fixed = {
		        {-5/16, -5/16, -2/16, 5/16, 6/16, 2/16},
			    {-4/16, 6/16, -2/16, 4/16, 7/16, 2/16},
			
			    {-5/16, -8/16, -2/16, -2/16, -5/16, 2/16},
		    	{2/16, -8/16, 2/16, 5/16, -5/16, -2/16},
			
		    	{5/16, -3/16, 5/16, -5/16, 4/16, 2/16},
			
			    {-4/16, 0, -2/16, 4/16, 4/16, -3/16},
		    },
	    },
	    selection_box = {
	        type = "fixed",
		    fixed = {
		        {-5/16, -8/16, -3/16, 5/16, 7/16, 5/16},
		    },
    	},
		paramtype = "light",
		sunlight_propagates = true,
	    paramtype2 = "facedir",
	    groups = {snappy = 3, miniatures = 1},
    })

minetest.register_craft({
	output = "amogus:amogus_" .. col[1],
	recipe = {
		{"", "bakedclay:white", col[4]},
		{"default:chest", "bonemeal:bone", "default:glass"},
		{"", "lavastuff:block",""},
	}
})

mobs:register_mob("amogus:mob_"..col[1], {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	attack_npcs = true,
	pushable = true,
	rotate = 180,
	reach = 3,
	damage = 16,
	hp_min = 45,
	hp_max = 80,
	armor = 40,
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 1, 0.5},
	visual = "wielditem",
	textures = {"amogus:amogus_"..col[1]},
	makes_footstep_sound = true,
	view_range = 16,
	walk_velocity = 2,
	drops = {
		{name = "amogus:amogus_"..col[1], chance = 1, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fall_damage = -1,
	fall_speed = -10,
	fear_height = 4,
	visual_size = {x=0.65, y=0.65},
})

mobs:register_egg("amogus:mob_"..col[1],S("@1 Amogus ", col[2]), "(blanktextureamogus.png^[colorize:"..col[3]..":255)^cyanfaceamogus.png")

mobs:alias_mob("amogus:"..col[1], "amogus:mob_"..col[1])

minetest.register_craft({
	output = "amogus:mob_" .. col[1],
	recipe = {
		{"","",""},
		{"default:mese_crystal","amogus:amogus_"..col[1],"default:sword_steel"},
		{"","",""},
	}
})

minetest.register_craftitem("amogus:amogus_shard",{
    description = S("Amogus Shard"),
	inventory_image = "amogushard.png",
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "amogus:amogus_shard 6",
	recipe = {
		{"","",""},
		{"default:mese_crystal","amogus:amogus_"..col[1],"farming:mortar_pestle"},
		{"","",""},
	},
	replacements = {
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"amogus:amogus_"..col[1], "bonemeal:bone"},
	},
})

minetest.register_craftitem("amogus:unforged_lavaingot",{
    description = S("Unforged Lava Ingot"),
	inventory_image = "lavastuff_ingot.png^[colorize:#E9F7FF:210",
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "amogus:unforged_lavaingot",
	recipe = "amogus:amogus_shard",
	cooktime = 10,
})

minetest.register_craft({
    type = "cooking",
	output = "lavastuff:ingot",
	recipe = "amogus:unforged_lavaingot",
	cooktime = 45,
})


end
