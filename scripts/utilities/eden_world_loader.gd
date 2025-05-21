extends Node

class_name EdenWorldLoader

func load(file_data: PackedByteArray) -> EdenWorld:
	var world := EdenWorld.new()
	var sky_color = []

	world.world_data = file_data

	# Sky color lesen (Bytes 132 bis 148)
	for i in range(132, 149):
		if world.world_data[i] != 14:
			sky_color.append(world.world_data[i])
		print("Sky Color: ", world.world_data[i])

	if sky_color.size() == 0:
		world.sky_color = 14
	else:
		var counts := {}
		for val in sky_color:
			counts[val] = counts.get(val, 0) + 1
		var max_count := 0
		var most_common := 14
		for key in counts:
			if counts[key] > max_count:
				max_count = counts[key]
				most_common = key
		world.sky_color = most_common

	print("Sky Color: ", world.sky_color)

	# Chunk Pointer Start Index (Little-endian 4-Byte-Int bei Offset 32–35)
	var chunk_pointer_start_index = world.world_data[35] * 256**3 + world.world_data[34] * 256**2 + world.world_data[33] * 256 + world.world_data[32]
	print("Chunk Pointer Start Index: ", chunk_pointer_start_index)

	# Weltname lesen (ab Byte 40 bis 75, nullterminiert)
	var name_array: PackedByteArray = PackedByteArray()
	for i in range(40, 76):
		if i < 40 or world.world_data[i] != 0:
			name_array.append(world.world_data[i])
	var name_string: String = name_array.get_string_from_ascii()
	world.world_name = name_string.strip_edges()

	# Chunks lesen
	world.chunks = {}

	var current_chunk_pointer_index = chunk_pointer_start_index
	while current_chunk_pointer_index + 11 < world.world_data.size():
		var address = world.world_data[current_chunk_pointer_index + 11] * 256**3 + world.world_data[current_chunk_pointer_index + 10] * 256**2 + world.world_data[current_chunk_pointer_index + 9] * 256 + world.world_data[current_chunk_pointer_index + 8]
		var x = world.world_data[current_chunk_pointer_index + 1] * 256 + world.world_data[current_chunk_pointer_index]
		var y = world.world_data[current_chunk_pointer_index + 5] * 256 + world.world_data[current_chunk_pointer_index + 4]
		world.chunks[address] = Vector2(x, y)
		current_chunk_pointer_index += 16

	# Bereich berechnen
	var points := world.chunks.values()
	if points.size() > 0:
		var min_x = points[0].x
		var min_y = points[0].y
		var max_x = points[0].x
		var max_y = points[0].y

		for point in points:
			min_x = min(min_x, point.x)
			min_y = min(min_y, point.y)
			max_x = max(max_x, point.x)
			max_y = max(max_y, point.y)

		var width = max_x - min_x + 1
		var height = max_y - min_y + 1
		world.area = Rect2(min_x, min_y, width, height)

	return world
