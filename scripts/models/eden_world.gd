extends Node

class_name EdenWorld

var eden_file_name: String = ""
var eden_file_name_suffix: String = ""
var world_name: String = ""
var create_date: int = 0 # UNIX timestamp

var chunks: Dictionary = {} # Simuliert Dictionary<int, Vector2>
var area: Rect2 = Rect2()   # Entspricht System.Drawing.Rectangle
var sky_color: int = 0
var world_data: PackedByteArray = PackedByteArray()

# Computed property
func get_eden_file_name() -> String:
	return "%s.%s" % [eden_file_name, eden_file_name_suffix]

func set_eden_file_name(value: String) -> void:
	var parts = value.split(".")
	if parts.size() != 2:
		push_error("EdenFileName must be in the format 'edenfilename.suffix'")
		return
	
	eden_file_name = parts[0]
	eden_file_name_suffix = parts[1]
	
	var time = int(eden_file_name)
	create_date = calculate_create_date(time)

# Computed property (optional use)
func get_create_date() -> int:
	return create_date

func set_create_date(value: int) -> void:
	create_date = value

# Calculate Unix timestamp (returns seconds since 1970-01-01 UTC)
func calculate_create_date(time: int) -> int:
	create_date = time
	return create_date
