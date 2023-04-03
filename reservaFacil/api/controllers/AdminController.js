/**
 * AdminController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */
function confirmarEliminacion() {
    let confirmAction = confirm("Está seguro de eliminar este evento?");
    if (confirmAction) {
    
    }
  }
module.exports = {
    inicioSesion:  async (peticion, respuesta) => {
        respuesta.view('pages/admin/inicio-sesion')
    },
    procesarSesion: async (peticion, respuesta) => {
        let admin = await Admin.findOne({ nombre: peticion.body.nombre, contrasena: peticion.body.password });
        if (admin) {
            peticion.session.admin = admin
            return respuesta.redirect("/admin/administrador")
        } else {
            peticion.addFlash('mensaje','Usuario o contraseña incorrecta')
            return respuesta.redirect("/admin/inicio_sesion")
        }
    },

    eliminarEvento: async (peticion, respuesta) => {
        if (!peticion.session || !peticion.session.admin) {
            return respuesta.redirect("/")
          }
        let evento = await Evento.findOne({id: peticion.params.eventoId})
        if (evento){
            await Evento.destroy({id: peticion.params.eventoId})
        peticion.addFlash('mensaje','Se eliminó el evento')
        respuesta.redirect("/admin/administrador")
        }
    },

    eliminarFuncion: async (peticion, respuesta) => {
        if (!peticion.session || !peticion.session.admin) {
            return respuesta.redirect("/")
          }
        let funcion = await Funcion.findOne({id: peticion.params.funcionId})
        if (funcion){
            await Funcion.destroy({id: peticion.params.funcionId})
        }
        peticion.addFlash('mensaje','Se eliminó la función')
        respuesta.redirect("/admin/administrador")
    },
    agregarFuncion: async (peticion, respuesta) => {
        if (!peticion.session || !peticion.session.admin) {
            return respuesta.redirect("/")
          }
        let funcion = await Funcion.findOne({
            evento: peticion.params.eventoId,
            lugar: peticion.body.lugares,
            hora: peticion.body.horario + ' hs'
        })
        console.log(funcion,peticion.params.eventoId ,peticion.body.lugares, peticion.body.horario + ' hs' );
        if (!funcion){
            let lugar = await Lugar.findOne({id: peticion.body.lugares})
            await Funcion.create({
                evento: peticion.params.eventoId,
                lugar: peticion.body.lugares,
                hora: peticion.body.horario + ' hs',
                capacidad: lugar.capacidad
            }) 
            peticion.addFlash('mensaje','Función creada con éxito')
            respuesta.redirect("/admin/administrador")
        } else {
            peticion.addFlash('mensaje2','Ya existe una función con estos datos')
            respuesta.redirect("/admin/administrador")
        }
    },

    editarEvento: async (peticion, respuesta) => {
        if (!peticion.session || !peticion.session.admin) {
            return respuesta.redirect("/")
          }
        await Evento.update({id: peticion.params.eventoId},
            {nombre: peticion.body.nombre,
            imagen: 'images/'+ peticion.body.imagen}
            )
        peticion.addFlash('mensaje','Evento modificado con éxito')
        respuesta.redirect("/admin/administrador")
    },

    agregarEvento: async (peticion, respuesta) => {
        if (!peticion.session || !peticion.session.admin) {
            return respuesta.redirect("/")
          }
        let evento = await Evento.findOne({
            nombre: peticion.body.nombre,
        })
        if (!evento){
            await Evento.create({
            nombre: peticion.body.nombre,
            imagen: 'images/' + peticion.body.imagen
          })
            peticion.addFlash('mensaje','Evento creado con éxito')
            respuesta.redirect("/admin/administrador")
        } else {
            peticion.addFlash('mensaje2','Ya existe un evento con este nombre')
            respuesta.redirect("/admin/administrador")
        }
    },

    cerrarSesion: async (peticion, respuesta) => {
        peticion.session.admin = undefined;
        peticion.addFlash('mensaje', 'Sesión finalizada')
        return respuesta.redirect("/");
      },
};

