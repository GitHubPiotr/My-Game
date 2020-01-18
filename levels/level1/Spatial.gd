extends Spatial

func _process(delta):
	$Planet.rotation += Vector3(delta*0.4, delta*0.2, delta*0.1)
