import pepita.*
import wollok.game.*

object tutorial2 {

    method setUp() {
        game.addVisual(pepitaEnergia)

        keyboard.right().onPressDo({
		    pepita.volar(1, "derecha")
        })
        keyboard.left().onPressDo({ pepita.volar(1, "izquierda") })
        keyboard.up().onPressDo({ pepita.volar(1, "arriba") })
        keyboard.down().onPressDo({ pepita.volar(1, "abajo") })

        game.onTick(800, "caer", { pepita.caer() })
    }
}