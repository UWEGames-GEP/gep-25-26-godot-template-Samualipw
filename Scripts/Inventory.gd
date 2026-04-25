extends Node

var items: Array[Item] = []
@onready var player = get_parent()

func add_item(item_data: Item):
	items.append(item_data)
	print("Added: ", item_data.item_name) 
	var inven_grabber = get_tree().root.find_child("InventoryPanel", true, false)
	if (inven_grabber and inven_grabber.visible):
		inven_grabber.refresh_inventory()

func remove_item(index: int):
	if index >= 0 and index < items.size():
		var item_data = items[index]
		_spawn_physical_item(item_data)
		items.remove_at(index)
		print("Dropped ", item_data.item_name)

## The land of shinanigins. 
func _spawn_physical_item(item_data: Item):
	if item_data.scene_file:
		var newItem = item_data.scene_file.instantiate()
		get_tree().root.add_child(newItem)
		var forward_vector = -player.global_transform.basis.z
		newItem.global_position = player.global_position + (forward_vector * 1.5) + Vector3(0, 1, 0)
		# not entirely sure how this bit works, but it does so we take it
		newItem.propagate_call("set_item_data", [item_data])
		print("Dropped item and data sent.")
	else:
		print("ERROR, No scene assigned to inven script!")
