extends CanvasLayer

const Texto : Array = [
	'!Felicidades!',
	'Has ayudado a Fred a llegar hasta el final. Espero que hayas disfrutado y aprendido un poco sobre las tortugas.',
	'Gracias por acompañarnos',
	'¡Hasta la próxima aventura!'
]

var index = 0

func hablar(Texto:String) -> void:
	show()
	if index == 0:
		$Presentadora.play("Felicita ")
		$Timer.stop()
		$Button.visible = true
	elif index == 3:
		$Presentadora.play("Hola")
	else:
		$Presentadora.play('Habla')
	$Label.text = Texto
	$AnimationPlayer_Button.play("Dialog")

func _ready():
	$Presentadora.play("Calla") 
	$AnimationPlayer_Cuadro.play('Aparece')
	$Timer.start()

func _process(delta):
	pass

func _on_button_pressed():
	if index < Texto.size():
		hablar(Texto[index])
		index += 1
	else:
		index = 0
		hide()

func _on_timer_timeout():
	$Presentadora.play("Felicita ")
	hablar(Texto[index])
	index+=1
