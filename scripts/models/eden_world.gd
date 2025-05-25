extends Node

class_name EdenWorld

var world_name: String = ""
var create_date: int = 0

var chunks: Dictionary = {} 
var area: Rect2 = Rect2()  
var sky_color: int = 0
var world_data: PackedByteArray = PackedByteArray()
var world_image : Image

var _eden_file_name: String        = ""
var _eden_file_name_suffix: String = ""

func get_eden_file_name() -> String:
	return "%s.%s" % [_eden_file_name, _eden_file_name_suffix]

func set_eden_file_name(value: String) -> void:
	var parts: PackedStringArray = value.split(".")
	if parts.size() != 2:
		push_error("EdenFileName must be in the format 'edenfilename.suffix'")
		return
	
	_eden_file_name = parts[0]
	_eden_file_name_suffix = parts[1]
	
	var time: int = int(_eden_file_name)
	create_date = calculate_create_date(time)
	
func get_create_date() -> int:
	return create_date

func set_create_date(value: int) -> void:
	create_date = value

func calculate_create_date(time: int) -> int:
	create_date = time
	return create_date
