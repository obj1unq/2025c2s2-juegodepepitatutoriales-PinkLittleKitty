object gravedad {
    
    const objetosAfectados = []

    method agregar(element) {
        objetosAfectados.add(element)
    }

    method eliminar(element) {
        objetosAfectados.remove(element)
    }

    method iniciarGravedad() {
        objetosAfectados.forEach({elem => game.onTick(800, "GRAVEDAD", { elem.caer() })})
    }
}