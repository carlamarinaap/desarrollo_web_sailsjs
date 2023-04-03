/**
 * PrincipalController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */



module.exports = {
  inicio:  async (peticion, respuesta) => {
    let reserva = await Reserva.findOne({email: ''}).populate('funcion')
    if(reserva){
      await Funcion.update({id: reserva.funcion.id}).set({capacidad: reserva.funcion.capacidad + reserva.boletos}) 
    }
    await Reserva.destroy({email: ''})
      const eventos = await Evento.find()
      respuesta.view('pages/inicio', {eventos})
  },

  espectador: async (peticion, respuesta) => {
    if (!peticion.session || !peticion.session.usuario) {
      peticion.addFlash('mensaje', 'Vuelva a iniciar sesión para reservar')
      return respuesta.redirect("/")
    }
    let reserva = await Reserva.findOne({email: ''}).populate('funcion')
    if(reserva){
      await Funcion.update({id: reserva.funcion.id}).set({capacidad: reserva.funcion.capacidad + reserva.boletos}) 
    }
    await Reserva.destroy({email: ''})
    
    let eventos = await Evento.find()
    let funcionesPorEvento = []
    let eventosActivos = []
    for (let i = 0; i < eventos.length; i++){
      const a = await Funcion.find({evento: eventos[i].id}).populate('evento').populate('lugar')
      if (a.length != 0) {
        eventosActivos.push(a[0].evento)
        funcionesPorEvento.push(a)
      }
    }
    respuesta.view('pages/espectador', { funcionesPorEvento, eventosActivos })  
    },

    administrador: async (peticion, respuesta) => {
      if (!peticion.session || !peticion.session.admin) {
        return respuesta.redirect("/")
      }
      let eventos = await Evento.find();
      let reservas = await Reserva.find().populate('funcion')
      let asientos = await Asiento.find().populate('reserva')
      let lugares = await Lugar.find()
      let funcionesPorEvento = []
      let eventosActivos = []
      let eventosSinFunciones = []
      for (let i = 0; i < eventos.length; i++){
        const a = await Funcion.find({evento: eventos[i].id}).populate('evento').populate('lugar')
        if (a.length != 0) {
          eventosActivos.push(a[0].evento)
          funcionesPorEvento.push(a)
        } else {
          eventosSinFunciones.push(eventos[i])
        }
      }
      respuesta.view('pages/admin/administrador', { funcionesPorEvento, eventosActivos, reservas, asientos,eventosSinFunciones, lugares })  
    }, 
};  
