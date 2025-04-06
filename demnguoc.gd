extends Label


var dem = ["Thông báo 1", "Thông báo 2", "Thông báo 3"]
var b = 0
var c = 99
func _ready():
	start_sequence()
var a = 4
# Khai báo hàm không đồng bộ với từ khóa 'async'
func start_sequence():
	
	while a <= 4:
		a -= 1
		print(a)
		self.text = str(a)
		await get_tree().create_timer(1).timeout
		if a == 1:
			c = 98
			self.text = ""
			break
#func start_sequence():
	#await get_tree().create_timer(1).timeout
	#self.text = "1"
	#
	#await get_tree().create_timer(1).timeout
	#self.text = "2"
	#if b < dem.size():
		#self.text = dem[b]
		#b += 1
#
	#await get_tree().create_timer(1).timeout
	#print(b)
