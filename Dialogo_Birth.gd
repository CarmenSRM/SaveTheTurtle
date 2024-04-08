extends CanvasLayer

const Texto : Array = [
	'Como mencioné hace un momento, el hurto de los huevos de las tortugas marinas es uno de los factores que contribuyen a que se encuentren en peligro de extinción.',
	'Seguro te preguntarás la razón. Bueno, comenzaré explicando que esta actividad ocurre cuando alguien toma los huevos que las tortugas ponen en la playa.',
	'¿Por qué alguien haría eso? En realidad, hay muchas razones:',
	'Comercio Ilegal: Algunas personas venden los huevos en el mercado negro para ganar dinero.',
	'Prácticas Culturales y Tradicionales: También existen prácticas culturales y tradicionales en las que se utilizan los huevos de tortuga.',
	'Debido a estas acciones, las poblaciones de tortugas marinas disminuyen. Esto significa que hay menos tortugas en el mundo.',
	'En algunas áreas, la recolección ilegal de huevos es una de las mayores amenazas para la supervivencia de las tortugas. Esto es muy perjudicial para el ciclo de vida de las tortugas, ya que si no hay suficientes huevos, las crías no pueden nacer. Esto hace que las poblaciones sean más pequeñas y menos saludables.',
	'Según la Unión Internacional para la Conservación de la Naturaleza (UICN), se estima que se recolectan ilegalmente millones de huevos de tortugas marinas cada año en países donde esta práctica no está regulada o controlada adecuadamente.',
	'Debido a la magnitud de este problema, muchos países y organizaciones están trabajando arduamente para proteger a las tortugas marinas. Implementan leyes más estrictas, patrullan las playas para evitar el hurto de huevos y educan al público sobre la importancia de cuidar a estas criaturas.',
	'¿Qué podemos hacer nosotros? Podemos aprender más sobre las tortugas marinas, no comprar huevos ilegales y ayudar a difundir la conciencia sobre su conservación.',
	'Vamos, comencemos con el juego, ya casi conoces a Fred'
]

var index = 0

@export var Next = preload("res://Intro1.tscn") as PackedScene

func hablar(Texto:String) -> void:
	show()
	if index == 0:
		$Timer.stop()
		$Button.visible = true
	$Presentadora.play('Habla2')
	$Label.text = Texto
	$AnimationPlayer_Button.play('Dialogo')

func _ready():
	$AnimationPlayer_Scenes.play('Inicio')
	$Button2.visible = false
	$Presentadora.play("Calla2") 
	$AnimationPlayer_Cuadro.play('Aparece')
	$Timer.start()

func _process(delta):
	pass

func _on_timer_timeout():
	hablar(Texto[index])
	index+=1

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
		$AnimationPlayer_Scenes.play("Birth")

func _on_button_3_pressed():
	$Label.hide()
	$CuadroDialogo.hide()
	$Button.hide()
	$Button3.hide()
	$Presentadora.hide()
	$AnimationPlayer_Scenes.play("Birth")


func _on_button_2_pressed():
	get_tree().change_scene_to_packed(Next)
