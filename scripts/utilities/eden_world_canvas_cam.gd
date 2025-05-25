extends Camera2D

var zoomspeed: int    = 100
var zoommargin: float = 0.3

#var _last_mouse_pos : Vector2

@export var zoommin: float = 10.0
@export var zoommax: float = 50.0

var zoompos: Vector2  = Vector2()
var zoomfactor: float = 1.0

var deadzone: int = 300

var _previousPosition: Vector2 = Vector2(0, 0);
var _moveCamera: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	zoom.x = lerp(zoom.x, zoom.x * zoomfactor, zoomspeed * delta)
	zoom.y = lerp(zoom.y, zoom.y * zoomfactor, zoomspeed * delta)
	
	zoom.x = clamp(zoom.x, zoommin, zoommax)
	zoom.y = clamp(zoom.y, zoommin, zoommax)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
		pass
		#_last_mouse_pos = event.position
		#print("Mouse pos ->" + str(_last_mouse_pos))
		#_popup_menu.popup(Rect2i(_last_mouse_pos.x, _last_mouse_pos.y, 200, 200))
	
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		get_viewport().set_input_as_handled();
		if event.is_pressed():
			_previousPosition = event.position;
			_moveCamera = true;
		else:
			_moveCamera = false;
	elif event is InputEventMouseMotion && _moveCamera:
		get_viewport().set_input_as_handled();
		position += (_previousPosition - event.position);
		_previousPosition = event.position;
		print("Variable -> Vector2" + str(position))
	
	if abs(zoompos.x - get_global_mouse_position().x) > zoommargin:
		zoomfactor = 1.0
	
	if abs(zoompos.y - get_global_mouse_position().y) > zoommargin:
		zoomfactor = 1.0
		
	if event is InputEventMouseButton: 
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoomfactor -= 0.01
				zoompos = get_global_mouse_position()
			
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoomfactor += 0.01
				zoompos = get_global_mouse_position()
