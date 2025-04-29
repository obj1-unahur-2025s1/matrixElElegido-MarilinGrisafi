object nave {
  const pasajeros = [neo, morfeo]//lista de pasajeros

  method cantidadDePasajeros() = pasajeros.size() //mensaje de consulta
  //pasajeros es una referencia a un objeto: una lista
  method pasajeroDeMayorVitalidad() = pasajeros.max({p => p.vitalidad})//le pido a cada "p", pasajero la vitalidad. mensaje de consulta
  method estaEquilibrada() { return self.pasajeroDeMayorVitalidad().vitalidad()< self.pasajeroDeMenosVitalidad().vitalidad() * 2}
  method pasajeroDeMenosVitalidad()= pasajeros.min({p => p.vitalidad})
  method elElegidoEstaEnLaNave() = pasajeros.any({p => p.esElElegido()})//si hay alguno de la lista que es el elegido

    method chocar() {//metodo de indicacion
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear() // se eliminan todos los objetos de la lista sin recorrer la misma como con "remove"
}
    method acelerar() {
        self.pasajerosQueNoSonElElegido().foreach({p =>p.saltar()})
    }
    method pasajerosQueNoSonElElegido() = pasajeros.filter({p => !p.esElElegido()}) //filtra de la lista a los pasajeros que no son el elegido

object neo {
    var energia = 100 //cuando salta pierde la mitad

    method esElElegido() = true
    method saltar() { energia = energia /2}
    method vitalidad() = energia * 0.1 //siempre es un porcentaje de su energia

}

object morfeo {
    var vitalidad = 8
    var estaCansado = false //estado interno del objeto
    
    method esElElegido() = false
    method saltar() {
        vitalidad = 0.max(vitalidad -1)
        estaCansado = !estaCansado //negado
        } //para que si queda en cero ese sea el valor maximo
    method vitalidad() = vitalidad //agregar solo si se necesita
}

object trinity {
    method vitalidad() = 0//no varia, es siempre igual
    method esElElegido() = false
    method saltar() {} // no hace nada- se colocan las llaves
}