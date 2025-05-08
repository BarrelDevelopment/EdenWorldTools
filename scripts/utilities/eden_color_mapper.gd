extends Node

class_name eden_color_mapper

var _painted_colors : Array[Color]
var _unpainted_colors : Array[Color]
var _len_painted_colors : int
var _len_unpainted_colors : int

func _init() -> void:
	_painted_colors = [
		Color(1.0, 0.6667, 0.6667),
		Color(1.0, 0.9176, 0.6667),
		Color(0.9843, 1.0, 0.6667),
		Color(0.6667, 1.0, 0.749),
		Color(0.6667, 1.0, 1.0),
		Color(0.6667, 0.749, 1.0),
		Color(0.8314, 0.6667, 1.0),
		Color(1.0, 0.6667, 0.9176),
		Color(1.0, 1.0, 1.0),
		
		Color(1.0, 0.3333, 0.3333),
		Color(1.0, 0.8314, 0.3333),
		Color(0.9647, 1.0, 0.3333),
		Color(0.3333, 1.0, 0.502),
		Color(0.3333, 1.0, 1.0),
		Color(0.3333, 0.502, 1.0),
		Color(0.6667, 0.3333, 1.0),
		Color(1.0, 0.3333, 0.8314),
		Color(0.8, 0.8, 0.8),
		
		Color(1.0, 0.0, 0.0),
		Color(1.0, 0.749, 0.0),
		Color(0.949, 1.0, 0.0),
		Color(0.0, 1.0, 0.251),
		Color(0.0, 1.0, 1.0),
		Color(0.0, 0.251, 1.0),
		Color(0.502, 0.0, 1.0),
		Color(1.0, 0.0, 0.749),
		Color(0.6, 0.6, 0.6),
		
		Color(0.749, 0.0, 0.0),
		Color(0.749, 0.5608, 0.0),
		Color(0.7137, 0.749, 0.0),
		Color(0.0, 0.749, 0.188),
		Color(0.0, 0.749, 0.749),
		Color(0.0, 0.188, 0.749),
		Color(0.376, 0.0, 0.749),
		Color(0.749, 0.0, 0.5608),
		Color(0.4, 0.4, 0.4),
		
		Color(0.502, 0.0, 0.0),
		Color(0.502, 0.376, 0.0),
		Color(0.4745, 0.502, 0.0),
		Color(0.0, 0.502, 0.125),
		Color(0.0, 0.502, 0.502),
		Color(0.0, 0.125, 0.502),
		Color(0.251, 0.0, 0.502),
		Color(0.502, 0.0, 0.376),
		Color(0.2, 0.2, 0.2),
		
		Color(0.251, 0.0, 0.0),
		Color(0.251, 0.188, 0.0),
		Color(0.2392, 0.251, 0.0),
		Color(0.0, 0.251, 0.063),
		Color(0.0, 0.251, 0.251),
		Color(0.0, 0.063, 0.251),
		Color(0.125, 0.0, 0.251),
		Color(0.251, 0.0, 0.188),
		Color(0.0118, 0.0118, 0.0118),
	]
	
	_unpainted_colors = [
		Color(0.0118, 0.0118, 0.0118),
		Color(0.635, 0.635, 0.635),
		Color(0.627, 0.321, 0.176), # Sienna
		Color(0.949, 0.862, 0.549),
		Color(0.039, 0.247, 0.051),
		Color(0.49, 0.357, 0.086),
		Color(0.729, 0.643, 0.345),
		Color(0.321, 0.58, 0.208),
		Color(1.0, 0.0, 0.0),
		Color(0.231, 0.231, 0.231),
		Color(0.321, 0.58, 0.208),
		Color(0.321, 0.58, 0.208),
		Color(0.8, 0.188, 0.161),
		Color(0.337, 0.361, 0.373),
		Color(0.525, 0.643, 0.729),
		Color(1.0, 1.0, 1.0),
		Color(0.196, 0.196, 0.196),
		Color(0.824, 0.706, 0.549), # Tan
		Color(1.0, 1.0, 1.0),
		Color(0.0, 0.0, 1.0),
		Color(0.824, 0.706, 0.549),
		Color(0.0, 1.0, 0.0),
		Color(1.0, 0.271, 0.0),

		Color(0.635, 0.635, 0.635),
		Color(0.635, 0.635, 0.635),
		Color(0.635, 0.635, 0.635),
		Color(0.635, 0.635, 0.635),
		Color(0.729, 0.643, 0.345),
		Color(0.729, 0.643, 0.345),
		Color(0.729, 0.643, 0.345),
		Color(0.729, 0.643, 0.345),
		Color(0.411, 0.411, 0.411),
		Color(0.411, 0.411, 0.411),
		Color(0.411, 0.411, 0.411),
		Color(0.411, 0.411, 0.411),
		Color(0.525, 0.643, 0.729),
		Color(0.525, 0.643, 0.729),
		Color(0.525, 0.643, 0.729),
		Color(0.525, 0.643, 0.729),

		Color(0.635, 0.635, 0.635),
		Color(0.635, 0.635, 0.635),
		Color(0.635, 0.635, 0.635),
		Color(0.635, 0.635, 0.635),
		Color(0.729, 0.643, 0.345),
		Color(0.729, 0.643, 0.345),
		Color(0.729, 0.643, 0.345),
		Color(0.729, 0.643, 0.345),
		Color(0.411, 0.411, 0.411),
		Color(0.411, 0.411, 0.411),
		Color(0.411, 0.411, 0.411),
		Color(0.411, 0.411, 0.411),
		Color(0.525, 0.643, 0.729),
		Color(0.525, 0.643, 0.729),
		Color(0.525, 0.643, 0.729),
		Color(0.525, 0.643, 0.729),

		Color(0.411, 0.411, 0.411),
		Color(1.0, 1.0, 1.0),
		Color(0.827, 0.827, 0.827),
		Color(0.0, 0.0, 1.0),
		Color(0.0, 0.0, 1.0),
		Color(0.0, 0.0, 1.0),
		Color(1.0, 0.271, 0.0),
		Color(1.0, 0.271, 0.0),
		Color(1.0, 0.271, 0.0),
		Color(1.0, 0.0, 0.0),
		Color(0.824, 0.706, 0.549),
		Color(0.824, 0.706, 0.549),
		Color(0.824, 0.706, 0.549),
		Color(0.824, 0.706, 0.549),
		Color(1.0, 0.843, 0.0), # Gold
		Color(1.0, 0.98, 0.804), # LemonChiffon
		Color(0.0, 0.0, 1.0),

		Color(0.662, 0.662, 0.662),
		Color(0.827, 0.827, 0.827),
		Color(0.827, 0.827, 0.827),
		Color(0.827, 0.827, 0.827),
		Color(0.827, 0.827, 0.827),
		Color(0.827, 0.827, 0.827),
		Color(1.0, 1.0, 1.0),
		Color(1.0, 1.0, 1.0),
		Color(0.0, 1.0, 0.0),
		Color(0.827, 0.827, 0.827),
		Color(0.662, 0.662, 0.662),
		Color(0.627, 0.321, 0.176), # Sienna
		Color(0.961, 0.871, 0.702), # Wheat
		Color(1.0, 0.0, 0.0),
		Color(0.824, 0.706, 0.549), # Tan
		Color(0.411, 0.411, 0.411),

		Color(1.0, 1.0, 1.0),
		Color(1.0, 1.0, 1.0),
		Color(0.545, 0.271, 0.075), # SaddleBrown
		Color(0.0, 1.0, 0.0),
		Color(0.698, 0.133, 0.133), # Firebrick
		Color(0.502, 0.502, 0.502),
		Color(0.0, 1.0, 0.0),
		Color(0.824, 0.706, 0.549), # Tan
		Color(0.0, 0.749, 1.0), # DeepSkyBlue
		Color(1.0, 1.0, 1.0),
		Color(0.196, 0.196, 0.196),
		Color(1.0, 1.0, 1.0),
		Color(0.662, 0.662, 0.662),
		Color(0.824, 0.706, 0.549),
		Color(0.0, 0.749, 1.0),
		Color(0.411, 0.411, 0.411),
		Color(0.824, 0.706, 0.549),

		Color(0.0, 0.0, 1.0),
		Color(1.0, 0.271, 0.0),
		Color(1.0, 0.0, 0.0),
		Color(1.0, 0.98, 0.804),
		Color(0.662, 0.662, 0.662),
	]
	
	_len_painted_colors = _painted_colors.size();
	_len_unpainted_colors = _unpainted_colors.size();

func get_painted_color_by_index(color_index : int) -> Color:
	if(color_index > 0 && color_index <= _len_painted_colors): 
		return _painted_colors[color_index]
	else: 
		return Color.BLACK
func get_unpainted_color_by_index(color_index : int) -> Color:
	if(color_index > 0 && color_index <= _len_unpainted_colors): 
		return _unpainted_colors[color_index]
	else: 
		return Color.BLACK
