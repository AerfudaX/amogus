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

end