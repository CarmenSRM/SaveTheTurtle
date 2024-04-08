extends CanvasLayer

const Texto : Array = [
	'¡Hola! Bienvenido al juego. Yo seré tu guía y te acompañaré durante tu recorrido por el juego.', 
	'Voy a explicarte las dinámicas de los niveles y proporcionarte datos interesantes sobre el tema.',
	'Comenzaré diciendo que este juego tiene como objetivo ayudarte a entender un poco más acerca de la situación que están viviendo las tortugas marinas.',
	'Las tortugas marinas desempeñan un papel muy importante en los ecosistemas marinos y terrestres. Ellas ayudan a “sanificar” los arrecifes de coral, las praderas marinas y las cadenas tróficas.',
	'En tierra, contribuyen a dispersar semillas, controlar plagas y reciclar nutrientes. Gracias a ellas, las playas y costas logran ser tan bellas y habitables para humanos y animales.',
	'La conservación de las tortugas marinas es vital para la biodiversidad.',
	'Estos increíbles animales se encuentran en peligro de extinción debido a una gran cantidad de factores, como la contaminación, el comercio ilegal, el hurto de huevos, la caza incidental e ilegal, y el turismo inconsciente, entre otros.',
	'A lo largo de este juego, se presentarán algunos de estos desafíos.',
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
		$Button3.hide()
		$Presentadora.hide()
		$Button2.show()

func _on_timer_timeout():
	$Presentadora.play("Hola")
	hablar(Texto[index])
	index+=1


func _on_button_2_pressed():
	get_tree().change_scene_to_packed(Next)


func _on_button_3_pressed():
	get_tree().change_scene_to_packed(Next)
