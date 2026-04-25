extends Control
@onready var inventory = get_tree().get_first_node_in_group("Player").get_node("P_Inventory")
@export var button_container: Control

func refresh_inventory():
	for child in button_container.get_children():
		child.queue_free()
	for i in range(inventory.items.size()):
		var item = inventory.items[i]
		var button = Button.new()
		button.text = item.item_name
		button.pressed.connect(_on_button_pressed.bind(i))
		button_container.add_child(button)

func _on_button_pressed(index: int):
	inventory.remove_item(index)
	refresh_inventory()
