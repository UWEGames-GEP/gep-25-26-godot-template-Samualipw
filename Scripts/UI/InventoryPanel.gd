extends Control

const ITEM_SLOT_SCENE = preload("res://Scenes/ItemButton.tscn")
@onready var slots_container = $SlotsContainer # Replace with your VBoxContainer path
@onready var player_inventory = get_tree().current_scene.get_node("PlayerTemplate/P_Inventory")

func update_ui():
	# clear list first
	for child in slots_container.get_children():
		child.queue_free()
	# add button
	for item_data in player_inventory.items:
		var new_slot = ITEM_SLOT_SCENE.instantiate()
		new_slot.setup(item_data)
		new_slot.pressed.connect(_on_slot_pressed.bind(item_data))
		slots_container.add_child(new_slot)

func _on_slot_pressed(item_to_drop: Item):
	print("Clicked to drop: ", item_to_drop.item_name)
	player_inventory.remove_item_by_data(item_to_drop)
	update_ui()
