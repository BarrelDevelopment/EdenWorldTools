extends Node2D

class_name EdenWorldDrawer

var world: EdenWorld = null
var blocks_in_world := 0
var map_texture: ImageTexture
var map_image: Image


func create_world_image():
	if world == null:
		push_error("No world loaded")
		return

	var width: int  = int(world.area.size.x) * 16
	var height: int = int(world.area.size.y) * 16
	map_image = Image.create(width, height, false, Image.FORMAT_RGBA8)
	
	var temp_color_mapper := eden_color_mapper.new()

	for address in world.chunks.keys():
		var chunk_pos: Vector2 = world.chunks[address]
		var base_x: int = int((chunk_pos.x - world.area.position.x) * 16)
		var base_y: int = int((chunk_pos.y - world.area.position.y) * 16)
		
		
		
		for x in range(16):
			for y in range(16):
				
				var is_block_painted := false
				for base_height in range(3, -1, -1):
					for z in range(15, -1, -1):
						var data_index = address + base_height * 8192 + x * 256 + y * 16 + z
						var color_index = data_index + 4096

						if world.world_data[data_index] != 0:
							blocks_in_world += 1
							if world.world_data[color_index] != 0 and not is_block_painted:
								var pen: int = world.world_data[color_index] - 1
								if(x == base_x && y == base_y):
									var col = temp_color_mapper.get_painted_color_by_index(pen)
									col = Color(col, 200)
									map_image.set_pixel(base_x + x, base_y + y, col)
								else:
									map_image.set_pixel(base_x + x, base_y + y, temp_color_mapper.get_painted_color_by_index(pen))
								
								is_block_painted = true
							elif not is_block_painted:
								var pen: int = world.world_data[data_index] - 1
								if(x == base_x && y == base_y):
									var col = temp_color_mapper.get_unpainted_color_by_index(pen)
									col = Color(col, 200)
									map_image.set_pixel(base_x + x, base_y + y, col)
								else:
									map_image.set_pixel(base_x + x, base_y + y, temp_color_mapper.get_unpainted_color_by_index(pen))
								is_block_painted = true
						#else:
							#map_image.set_pixel(base_x + x, base_y + y, temp_color_mapper.get_unpainted_color_by_index(10))
		var pixel = map_image.get_pixel(base_x, base_y)
		map_image.set_pixel(base_x, base_y, Color(pixel.r + 0.200, pixel.g + 0.200, pixel.b + 0.200))
			
	map_image.flip_x()
	map_image.flip_y()
	map_texture = ImageTexture.create_from_image(map_image)
	print(map_texture.get_size())
	print(map_texture.get_height())
	print(map_texture.get_width())

func _draw():
	pass
	#if map_texture:
	#	draw_texture(map_texture, Vector2(map_texture.get_width() * -0.5, map_texture.get_height() * -0.5 ))

func get_texture() -> ImageTexture:
	return map_texture

func get_image_png_base64() -> String:
	if not map_image:
		return ""
	var buffer := map_image.save_png_to_buffer()
	return "data:image/png;base64," + Marshalls.raw_to_base64(buffer)
