extends Button
# i do this so we can grab the name of items
var item_data: Item

func setup(new_item_data: Item):
	item_data = new_item_data
	text = item_data.item_name
