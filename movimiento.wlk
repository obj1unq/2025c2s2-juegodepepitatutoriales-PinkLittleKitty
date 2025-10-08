import pepita.*
import wollok.game.*

object movimiento {

    method setUp() {
        game.addVisual(pepitaEnergia)

        keyboard.right().onPressDo({ pepita.volarDerecha(1) })
        keyboard.left().onPressDo({ pepita.volarIzquierda(1) })
        keyboard.up().onPressDo({ pepita.volarArriba(1) })
        keyboard.down().onPressDo({ pepita.volarAbajo(1) })
    }
}