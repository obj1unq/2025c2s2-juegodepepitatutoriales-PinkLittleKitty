import wollok.game.*
import pepita.*
import randomizer.*


object comidaSpawner {

	var property manzanas = #{}

	method setUp_Manzanas(cantidad) {
		cantidad.times({ i => self.generarManzana() })
	}

	method generarManzana()
	{
		const unaManzana = new Manzana()

		game.addVisual(unaManzana)
		
		unaManzana.position(randomizer.position())

		manzanas.add(unaManzana)
	}

	method remover_de_(comida, lista)
	{
		if (lista.contains(comida)) {
			lista.remove(comida)
		}
	}
}


class Manzana {
	var property position = randomizer.position()

	method image() {
		return "manzana.png"
	}

	method energiaQueOtorga() {
		return 100
	}

	method colisiónConPepita() {
		pepita.comer(self)
		game.removeVisual(self)
	}

}

object alpiste {
	var property position = game.origin()
	var comida = false;
	var peso = 40.randomUpTo(100)

	method image() {
		return "alpiste.png"
	}

	method energiaQueOtorga() {
		return 50
	}

	method setUp() {
		game.addVisual(self)

		self.position(randomizer.position())
	}

	method colisiónConPepita() {
		pepita.comer(self)
		comida = true;
		game.removeVisual(self)
	}

	method comida() {
		return comida
	}
}