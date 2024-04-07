extends CanvasLayer

const Texto2 : Array = [
	'¡Hola otra vez!',
	'Antes de comenzar a jugar, es necesario conocer las reglas del juego.',
	'Tu mision es este nivel es ayudar a Fred en su camino al mar.',
	'El es Fred',
	'Debes escapar de las gaviotas que intentan comerlo',
	'Fred siempre se encuentra caminando, pero si es necesario, puedes ayudarlo usando la función de correr.',
	'Usa la flecha derecha para aumentar la velocidad.',
	'Puedes esconderte bajo las hojas que encuentres en tu camino.',
	'Para quedarte quieto y escondido, utiliza la tecla de espacio.',
	'Te recomiendo que solo la utilices cuando sea necesario, de lo contrario, te atraparán mucho más fácilmente.',
	'Debes evitar los obstáculos en tu camino.',
	'Los evitarás saltando, para esto, utiliza la flecha superior.',
	'También debes evitar a los cangrejos que encuentres en tu camino.',
	'Los cangrejos le restan velocidad a Fred, y eso es algo que no queremos.',
	'Inntenta comer todas las plantas, ellas ayudan a recuperar la velocidad perdida.',
	'Esto es todo lo necesario para completar el nivel.',
	'¡Ah, casi lo olvido! No puedes utilizar dos teclas al mismo tiempo. Por ejemplo, no puedes saltar y correr al mismo tiempo.', 
	'¡Suerte!'
]

var index = 0

@export var Next = preload("res://NivelUno.tscn") as PackedScene

func hablar(Texto2:String) -> void:
	show()
	if index == 0:
		$Presentadora.play("Hola")
		$Timer.stop()
		$Button.visible = true
	
	else:
		$Presentadora.play('Habla2')
		
	if index == 4:
		$AnimationPlayer_Scene.play('Fred')
	
	if index == 5:
		$AnimationPlayer_Scene.play('back')
	
	if index == 6:
		$Fred.play('run')
		$tecla.play('Right')
	
	$Label.text = Texto2
	$AnimationPlayer_Button.play('Dialogo_Intro1')
	
	if index == 2:
		$AnimationPlayer_Scene.play("Desplazamiento")
	

func _ready():
	$Fred.play('empty')
	$tecla.play('empty')
	$AnimationPlayer_Scene.play('Scene')
	hide()
	$Button2.hide()
	$Timer2.start()

func _on_timer_timeout():
	$Presentadora.play("Hola")
	hablar(Texto2[index])
	index+=1


func _on_button_pressed():
	if index < Texto2.size():
		hablar(Texto2[index])
		index += 1
	else:
		index = 0
		$Label.hide()
		$CuadroDialogo.hide()
		$Button.hide()
		$Presentadora.hide()
		$Button2.show()


func _on_timer_2_timeout():
	show()
	$Presentadora.play("Calla2") 
	$AnimationPlayer_Cuadro.play('Aparece')
	$Timer.start()
	$Timer2.stop()
