/**
 * SesionController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

module.exports = {
    inicioSesion:  async (peticion, respuesta) => {
        respuesta.view('pages/inicio-sesion')
    },
    registro: async (peticion, respuesta) => {
        respuesta.view('pages/registro')
    },      
    procesarRegistro: async (peticion, respuesta) => {
        let usuario = await Usuario.findOne({ nombre: peticion.body.nombre_usuario });
        if (usuario) {
          peticion.addFlash('mensaje', 'Nombre de usuario ya existe')
          return respuesta.redirect("/registro");
        }
        if (peticion.body.password != peticion.body.confirm) {
            peticion.addFlash('mensaje', 'Las contraseñas no coinciden')
            return respuesta.redirect("/registro");
        }
        if (peticion.body.password.length < 6) {
          peticion.addFlash('mensaje', 'La contraseña debe tener al menos 6 caracteres')
          return respuesta.redirect("/registro");
        } else {
          let usuario = await Usuario.create({
            nombre: peticion.body.nombre_usuario,
            contrasena: peticion.body.password
          })
          peticion.session.usuario = usuario;
          peticion.addFlash('mensaje', 'Usuario registrado')
          return respuesta.redirect("/");
        }
      },
      
    procesarSesion: async (peticion, respuesta) => {
        let usuario = await Usuario.findOne({ nombre: peticion.body.nombre_usuario, contrasena: peticion.body.password });
        if (usuario) {
            peticion.session.usuario = usuario
            peticion.addFlash('mensaje', 'Sesión iniciada')
            return respuesta.redirect("/espectador")
        } else {
          peticion.addFlash('mensaje', 'Email o contraseña invalidos')
          return respuesta.redirect("/inicio_sesion");
        }
    },
    cerrarSesion: async (peticion, respuesta) => {
      
        peticion.session.usuario = undefined;
        peticion.addFlash('mensaje', 'Sesión finalizada')
        return respuesta.redirect("/");
    },

};

