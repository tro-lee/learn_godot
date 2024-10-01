extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print("coin +1")
	
	queue_free() # 移出当前节点
	pass # Replace with function body.
