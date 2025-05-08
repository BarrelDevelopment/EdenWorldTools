extends Node2D

var defaultPixelSize : float = 1.0

func _ready() -> void:
	var fileData : PackedByteArray
	fileData = FileAccess.get_file_as_bytes("res:///mockupdata/1737689872.eden")
	#fileData = FileAccess.get_file_as_bytes("res:///mockupdata/1736167506.eden")
	#fileData = FileAccess.get_file_as_bytes("res:///mockupdata/1722489989.eden")
	var edenWorldLoader = EdenWorldLoader.new()
	var edenWorld : EdenWorld
	edenWorld = edenWorldLoader.load(fileData)
	print(edenWorld.world_name)
	var edenWorldDrawer = EdenWorldDrawer.new()
	edenWorldDrawer.world = edenWorld
	edenWorldDrawer.create_world_image()
	add_child(edenWorldDrawer)
