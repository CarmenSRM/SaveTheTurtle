extends CanvasLayer

const Texto : Array = [
	'¡Hola, bienvenido al juego!',
	'Yo soy Carmen, y te acompañaré en tu paso por del juego',
	'Yo sere tu guía y voy a explicarte las dinámicas de los niveles.',
	'Para ayudarte a entender un poco acerca de la situación que están viviendo las tortugas marinas.',
	'Las tortugas marinas son uno de los animales en peligro de extinción.',
	'Esto es debido a una gran cantidad de factores. Algunos de ellos se presentarán a lo largo de este juego.',
	'¡Vamos, comencemos!'
]

var index = 0

@export var Next = preload("res://nacimiento.tscn") as PackedScene

func hablar(Texto:String) -> void:
	show()
	if index == 0:
		$Presentadora.play("Hola")
		$Timer.stop()
		$Button.visible = true
	else:
		$Presentadora.play('Habla2')
	$Label.text = Texto
	$AnimationPlayer_Button.play("Dialog")

func _ready():
	$Button2.hide()
	$Presentadora.play("Calla2") 
	$AnimationPlayer_Cuadro.play('Aparece')
	$Timer.start()
	
func _on_button_pressed():
	if index < Texto.size():
		hablar(Texto[index])
		index += 1
	else:
		index = 0
		$Label.hide()
		$CuadroDialogo.hide()
		$Button.hide()
		$Presentadora.hide()
		$Button2.show()

func _on_timer_timeout():
	$Presentadora.play("Hola")
	hablar(Texto[index])
	index+=1


func _on_button_2_pressed():
	get_tree().change_scene_to_packed(Next)
