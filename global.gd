extends Node2D

var high_score = 0
var savePath = "user://high_score.save"

func save_high_score():
	var file = FileAccess.open(savePath, FileAccess.WRITE)
	if file != null:
		print("Saving score:", high_score)
		file.store_var(high_score)
		file.close()
	else:
		push_error("Failed to open file for writing.")
	
func load_high_score():
	if FileAccess.file_exists(savePath):
		var file = FileAccess.open(savePath, FileAccess.READ)
		high_score = file.get_var()
		file.close()
