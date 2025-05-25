extends Node2D

var defaultPixelSize : float = 1.0

@export var worldFile : String
@export var world : EdenWorld
@onready var can = $TextureRect

func _ready() -> void:
	var fileData : PackedByteArray
	fileData = FileAccess.get_file_as_bytes(worldFile)
	var edenWorldLoader = EdenWorldLoader.new()
	var edenWorld : EdenWorld
	edenWorld = edenWorldLoader.load(fileData)
	print(edenWorld.world_name)
	var edenWorldDrawer = EdenWorldDrawer.new()
	edenWorldDrawer.world = edenWorld
	edenWorldDrawer.create_world_image()
	#add_child(edenWorldDrawer)
	can.texture = edenWorldDrawer.get_texture()
	
