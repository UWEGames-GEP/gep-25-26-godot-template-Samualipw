extends Node
@onready var inventory = get_tree().get_first_node_in_group("Player").get_node("P_Inventory")
@onready var inventory_ui = get_tree().root.find_child("InventoryPanel", true, false)
@export var button_container: Control

func _input(event):
	if event.is_action_pressed("dropitem"):
		inventory.remove_item(0)
		# drops item in list
	
	if event.is_action_pressed("Inventory"):
		toggle_inventory()
		# goes to inventory menu

func toggle_inventory():
	var panel = get_tree().root.find_child("InventoryPanel", true, false)
	# grabs panel
	if panel:
		panel.visible = !panel.visible
		if panel.visible:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			get_tree().paused = true
			panel.refresh_inventory()
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			get_tree().paused = false
