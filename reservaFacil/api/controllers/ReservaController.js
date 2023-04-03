/**
 * ReservaController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

module.exports = {

  reservarFuncion: async (peticion, respuesta) => {
    if (!peticion.session || !peticion.session.usuario) {
      peticion.addFlash('mensaje', 'Vuelva a iniciar sesión para reservar')
      return respuesta.redirect("/")
    }
    let funcion = await Funcion.findOne({ id: peticion.params.funcionId})
    let evento = await Evento.findOne({id: funcion.evento})
    let lugar = await Lugar.findOne({id: funcion.lugar})
    if(peticion.body.asientos < 1){
      peticion.addFlash('mensaje2', 'Cantidad inválida de boletos')
      return respuesta.redirect("/espectador")
    }
    if (peticion.body.asientos > funcion.capacidad) {
      peticion.addFlash('mensaje2', 'La cantidad de boletos elegidos supera la capacidad del lugar')
      return respuesta.redirect("/espectador")
    } else {
      let crearReserva = await Reserva.create({
        funcion: peticion.params.funcionId,
        usuario: peticion.session.usuario.id,
        boletos: peticion.body.asientos
    })
    peticion.session.reserva = await Reserva.find({ usuario: peticion.session.usuario.id });
    let buscarReserva = await Reserva.findOne({id: peticion.session.reserva[peticion.session.reserva.length - 1].id}).populate('funcion')
    let a = await Funcion.update({id: buscarReserva.funcion.id}).set({capacidad: buscarReserva.funcion.capacidad - buscarReserva.boletos}) 
    console.log(buscarReserva.funcion.capacidad, buscarReserva.boletos);
    let funcionActualizada = await Funcion.findOne({id: buscarReserva.funcion.id})
    let nroSilla = lugar.capacidad - funcion.capacidad + 1
    for (let i = nroSilla; i  < nroSilla + buscarReserva.boletos; i++) {
      await Asiento.create({
        numero: i,
        reserva: buscarReserva.id,
        confirmado: false
      })  
    }
      let reserva = await Reserva.find({ id: peticion.session.reserva.id });
      let ultimaReserva = reserva[reserva.length - 1]
      respuesta.view("pages/formulario_reserva", {funcion,evento,lugar, ultimaReserva})
    }
  },
  
  procesarReserva: async (peticion, respuesta) => {
    if (!peticion.session || !peticion.session.usuario) {
      peticion.addFlash('mensaje', 'Vuelva a iniciar sesión para reservar')
      return respuesta.redirect("/")
    }
    let reserva = await Reserva.findOne({ id: peticion.params.reservaId}).populate('funcion')
    await Reserva.update({id: reserva.id}).set({
      telefono: peticion.body.telefono,
      email: peticion.body.email
    }) 
    console.log(reserva);
    peticion.session.reserva = await Reserva.find({ id: reserva.id });
    await Asiento.update({reserva: reserva.id}, {confirmado: true})  
    peticion.addFlash('mensaje', 'Reserva realizada con éxito')
    return respuesta.redirect('/espectador')
  },
};

