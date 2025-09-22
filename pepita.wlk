
object pepita {
	var energia = 100
	var property position = game.origin()
	var imagen = "pepita.png"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	method image() {
		return imagen
	}

	method imagen(nuevaImagen) {
		imagen = nuevaImagen
	}

	method centrar() {
		position = game.center()
	}
}

object silvestre {
	var energia = 100
	var position = game.origin()
	
	method energia() {
		return energia
	}

	method image() {
		return "silvestre.png"
	}

	method position() {
		if (pepita.position().x() > 3)
			return game.at(pepita.position().x(), 0)
		else {
			return game.at(3, 0)
		}
	}
}

