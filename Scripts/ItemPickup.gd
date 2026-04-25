extends Area3D
@export var item_data: Item

func _ready():
	# Dont remember why this needed to be here, but it breaks if its removed so
	body_entered.connect(_on_body_entered)

# To pass data
func set_item_data(new_data: Item):
	item_data = new_data

func _on_body_entered(body):
	var inv = body.find_child("P_Inventory", true, false)
	if inv:
		inv.add_item(item_data)
		queue_free()
