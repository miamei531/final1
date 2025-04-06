extends Node2D

var in_area1 = false
var in_area2 = false
var in_area3 = false
@onready var bgms = $nhackichtinh
@onready var sai = $sai
var bgmson = true
var chuyencau = 0 
var cau_hoi = ["Câu 1: Trong tam giác vuông ABC, với góc vuông tại A. 
				Độ dài cạnh huyền BC được tính bằng công thức nào?"
				,"Câu 2: Trong tam giác vuông ABC, với góc vuông tại A,
				 công thức tính đường cao AH theo cạnh AB và AC là:",
				"Câu 3: Trong tam giác vuông ABC, góc vuông tại A,
				 với cạnh góc vuông AB = 6 cm, cạnh góc vuông AC = 8 cm. 
				 Độ dài đường cao AH từ A xuống cạnh huyền BC là:"]
var i= 0
var dapan1 = ["A. BC = √(AB² + AC²)","A. AH = AB + AC","A= 7,2 cm"]
var dapan2 = ["B. BC = AB + AC","B. AH = √(AB · AC)","B= 6,4 cm"]
var dapan3 = ["C. BC = AB · AC"," C. AH = (AB · AC)","C=  4,8 cm"]
var ben = 0
var causai = 0
var cc = 0

@onready var anim = $AnimatableBody2D/AnimationPlayer
func _ready():
	await get_tree().create_timer(3).timeout
	$AnimatedSprite2D/chilen.play("chilen")
	$AnimatedSprite2D2/chixuong.play("chilen")
	'''$Label2.visible =true
	print($Label2.c)
	if $Label2.c == 1:
		anim.play("move")
		$Label2.visible = false'''
	Dialogic.VAR.tongcauhoi = 3
	Dialogic.VAR.tran = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Dialogic.VAR.nhan_do.ans == 1 and chuyencau == 0 :
		bgmson = false
		if !sai.playing:
			sai.play()
		await get_tree().create_timer(1).timeout
		sai.stop()
		bgmson=true
		chuyencau = 1
		
	if Dialogic.VAR.nhan_do.ans == 2 and chuyencau ==1  :
		bgmson = false
		if !sai.playing:
			sai.play()
		await get_tree().create_timer(1).timeout
		sai.stop()
		bgmson=true
		chuyencau = 2 
		
	if Dialogic.VAR.nhan_do.ans == 3 and chuyencau == 2:
		bgmson = false
		if !sai.playing:
			sai.play()
		await get_tree().create_timer(1).timeout
		sai.stop()
		bgmson=true
		chuyencau = 3
	up_date_music_start()
	#print("nhìn nè",Dialogic.VAR.nhan_do.ans) print nếu cần check câu sai
	if i < 3:

		Dialogic.VAR.socauhoi = i+1
		$Panel/cauhoi.text = cau_hoi[i]
		$AnimatableBody2D/Panel/cautrl1/trl1.text = dapan1[i]
		$AnimatableBody2D/Panel/cautrl2/trl2.text = dapan2[i]
		$AnimatableBody2D/Panel/cautrl3/trl3.text = dapan3[i]

		if in_area1 == true:
			#print("người chơi chọn câu A") print nếu cần check câu người chơi chọn
			if i == 0:
				print("Đúng") 
			elif i == 1:
				#print("sai")
				causai = causai+1
			elif i == 2:
				#print("sai")
				causai = causai+1
			in_area1 = false
			await get_tree().create_timer(5).timeout
			i= i +1
		elif in_area2 == true:
			#print("người chơi chọn câu B")
			if i == 1:
				print("Đúng")
			elif i == 0:
				#print("sai")
				causai = causai+1
			elif i == 2:
				#print("sai")
				causai = causai+1
			in_area2 = false
			await get_tree().create_timer(5).timeout
			i= i +1
		elif in_area3 == true:
			#print("người chơi chọn câu C")
			if i == 2:
				print("Đúng")
			elif i == 1:
				#print("sai")
				causai = causai+1
			elif i == 0:
				#print("sai")
				causai = causai+1
			in_area3 = false
			await get_tree().create_timer(5).timeout
			i = i +1
		Dialogic.VAR.nhan_do.ans = causai
		await get_tree().create_timer(5).timeout
		#print($ui.chuyen)
		if $ui.chuyen == 101010:
			
			Dialogic.VAR.nhan_do.ans = 13
			Dialogic.VAR.het = true
			#print($ui.chuyen)
			
		else:
			#print($ui.chuyen)
			#print("đã chuyển")
			Dialogic.VAR.nhan_do.ans = 12
			#print($ui.chuyen)
	else :
		print("hết rùi")
		anim.play("not")
		Dialogic.VAR.het = true
		print(Dialogic.VAR.het)
		print(Dialogic.VAR.tongcauhoi)
		print(Dialogic.VAR.socauhoi)
		
	if ben == 0 and $Label2.c == 98:
		$Panel/cauhoi.visible = true
		cc = 1
		#print( $Label2.c)
		anim.play("move")
		#$AnimatedSprite2D/chilen.play("chilen")
		#$AnimatedSprite2D2/chixuong.play("chilen")
		
	elif ben == 1 and $Label2.c == 98:
		$Panel/cauhoi.visible = true
		anim.play("moveb")
		


func _on_cautrl_1_body_entered(body):
	if body.has_method("main"):
		in_area1 = true


func _on_cautrl_2_body_entered(body):
	if body.has_method("main"):
		in_area2 = true



func _on_cautrl_3_body_entered(body):
	if body.has_method("main"):
		in_area3 = true





func _on_bentrai_area_entered(area):
	print("qua bên trái")
	ben = 1


func _on_benphai_area_entered(area):
	print("qua bên phải")
	ben = 0


func _on_bentrai_body_entered(body):
	if body.has_method("main"):
		causai = causai+1


func _on_benphai_body_entered(body):
	if body.has_method("main"):
		causai = causai+1
func up_date_music_start():
	if bgmson== true:
		if !bgms.playing:
			bgms.play()
			print("nhạc chạy")
	else:
		bgms.stop()

