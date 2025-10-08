import comidas.*
import pepita.*
import wollok.game.*

object tutorial3 {

    method setUp() {
       nido.setUp()
       comidas.comidaSpawner.setUp_Manzanas(3)
       comidas.alpiste.setUp()
    }
}