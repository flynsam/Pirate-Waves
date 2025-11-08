extends TextureButton


func _on_pressed():
	if ! $"../Map".is_visible_in_tree():
		$"../Map".show()
		$"../MapBorder".show()
		$"../ShipIcon".show()
	else:
		$"../Map".hide()
		$"../MapBorder".hide()
		$"../ShipIcon".hide()
