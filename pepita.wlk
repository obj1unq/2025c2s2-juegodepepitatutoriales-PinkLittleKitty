import comidas.*

object pepita {
	var energia = 500
	var property position = game.origin()

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volarDerecha(kms) {
		if (energia > 0) { 
			self.irA(self.position().x() + kms, self.position().y())
		} else {
			self.image()
			game.stop()
		}
	}

	method volarIzquierda(kms) {
		if (energia > 0) { 
			self.irA(self.position().x() - kms, self.position().y())
		} else {
			self.image()
			game.stop()
		}
	}

	method volarArriba(kms) {
		if (energia > 0) { 
			self.irA(self.position().x(), self.position().y() + kms)
		} else {
			self.image()
			game.stop()
		}
	}

	method volarAbajo(kms) {
		if (energia > 0) { 
			self.irA(self.position().x(), self.position().y() - kms)
		} else {
			self.image()
			game.stop()
		}
	}

	method irA(posiciónx, posicióny) {
		if (self.posiciónValida(posiciónx, posicióny)) { 
			position = game.at(posiciónx, posicióny)
			energia = energia - 9
		}
	}
	
	method posiciónValida(posiciónx, posicióny) {
		return (posiciónx <= game.width() - 1 && posiciónx >= 0) 
				&& (posicióny <= game.height() - 1 && posicióny >= 0) 
				&& (posiciónx != muro.position().x() || posicióny != muro.position().y())
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
		if (self.posiciónValida(self.position().x(), self.position().y() - 1)) {
			position = game.at(self.position().x(), self.position().y() - 1)
		}
	}

	method setUp() {
		self.centrar()
		game.addVisual(self)
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

	method colisiónConPepita() {
		pepita.image()
		game.stop()
	}
}

object muro {
	var property position = game.origin()

	method image() {
		return "muro.png"
	}

	method setUp() {
		game.addVisual(muro)
		const x = 0.randomUpTo(game.width()).truncate(0)
    	const y = 0.randomUpTo(game.height()).truncate(0)

		self.position(game.at(x, y))
	}
}

object nido {
	var property position = game.at(game.width(), game.height() - 1)

	method image() {
		return "nido.png"
	}

	method setUp() {
		game.addVisual(self)
		self.position(game.at(game.width() - 1, game.height() - 1))
	}

	method colisiónConPepita() {
		game.stop()
	}
}