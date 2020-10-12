--declare in order(functions, entities, items, recipes, technologies)
require("prototypes.functions")
--declare only static or key items at this point
----load order dictates any dynamic find/set stuff should be in data-updates

--Categories
require("prototypes.categories")
--ENTITIES
--Generator(s)
require("prototypes.buildings.generator-1")
require("prototypes.buildings.generator-2")
require("prototypes.buildings.generator-3")
require("prototypes.buildings.generator-4")
--Feeding trough, rest camp, biter regen area and breeder building
require("prototypes.buildings.rest-camp")
require("prototypes.buildings.breeder-building")
--ITEMS/TOOLS/CAPSULES
require("prototypes.items.items")
--RECIPES
require("prototypes.recipes.biter")
--TECHNOLOGIES
require("prototypes.technology.technology")



