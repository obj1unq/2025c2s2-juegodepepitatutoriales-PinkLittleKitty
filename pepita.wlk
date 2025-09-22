
object pepita {
	var energia = 500
	var property position = game.origin()

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms, direccion) {
		if (energia > 0) { 
			energia = energia - 9

			if (direccion == "derecha" && self.position().x() < game.width() - 1) {
				position = game.at(self.position().x() + kms, self.position().y())
			} else if (direccion == "izquierda" && self.position().x() > 0) {
				position = game.at(self.position().x() - kms, self.position().y())
			} else if (direccion == "arriba" && self.position().y() < game.height() - 1) {
				position = game.at(self.position().x(), self.position().y() + kms)
			} else if (direccion == "abajo" && self.position().y() > 0) {
				position = game.at(self.position().x(), self.position().y() - kms)
			}
		} else {
			self.image()
			game.stop()
		}
	}
	
	method energia() {
		return energia
	}

	method image() {
		if (self.position() == silvestre.position() || energia <= 0)
			return "pepita-gris.png"
		else {
			return "pepita.png"
		}
	}

	method centrar() {
		position = game.center()
	}

	method caer() {
		if (self.position().y() > 0) {
			position = game.at(self.position().x(), self.position().y() - 1)
		}
	}
}

object pepitaEnergia {
	var property position = game.at(1, game.height() - 1)
	
	method text() {
		return "Energía: " + pepita.energia()
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

