extends MeshInstance

const RAY_LENGTH = 1000.0

func transform_position_2d_to_3d(position_2d):
		var camera = $Camera
		var from = camera.project_ray_origin(position_2d)
		var to = from + camera.project_ray_normal(position_2d) * RAY_LENGTH
	
		var space_state = get_world().direct_space_state
		var result = space_state.intersect_ray(from, to)
		
		result = Vector3(result.position.x, 1, result.position.z)
		return result
