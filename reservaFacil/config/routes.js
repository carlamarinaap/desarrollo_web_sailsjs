/**
 * Route Mappings
 * (sails.config.routes)
 *
 * Your routes tell Sails what to do each time it receives a request.
 *
 * For more information on configuring custom routes, check out:
 * https://sailsjs.com/anatomy/config/routes-js
 */

const SesionController = require("../api/controllers/SesionController");

module.exports.routes = {

  /***************************************************************************
  *                                                                          *
  * Make the view located at `views/homepage.ejs` your home page.            *
  *                                                                          *
  * (Alternatively, remove this and add an `index.html` file in your         *
  * `assets` directory)                                                      *
  *                                                                          *
  ***************************************************************************/

  'GET /': 'PrincipalController.inicio',
  'GET /espectador': 'PrincipalController.espectador',
  'GET /admin/administrador':'PrincipalController.administrador',

  'GET /inicio_sesion':'SesionController.inicioSesion',
  'GET /registro': 'SesionController.registro',
  'GET /cerrar-sesion': 'SesionController.cerrarSesion',
  'POST /procesar-sesion':'SesionController.procesarSesion',
  'POST /procesar-registro':'SesionController.procesarRegistro',
  
  'POST /reservar-funcion/:funcionId': 'ReservaController.reservarFuncion',
  'POST /procesar-reserva/:reservaId':'ReservaController.procesarReserva',

  'GET /admin/inicio_sesion':'AdminController.inicioSesion',
  'POST /admin/procesar-sesion':'AdminController.procesarSesion',
  'GET /admin/cerrar-sesion': 'AdminController.cerrarSesion',
  'POST /admin/agregar-evento': 'AdminController.agregarEvento',
  'POST /admin/agregar-funcion/:eventoId': 'AdminController.agregarFuncion',
  'POST /admin/editar-evento/:eventoId': 'AdminController.editarEvento',
  'GET /admin/eliminar-evento/:eventoId': 'AdminController.eliminarEvento', 
  'GET /admin/eliminar-funcion/:funcionId': 'AdminController.eliminarFuncion',



  /***************************************************************************
  *                                                                          *
  * More custom routes here...                                               *
  * (See https://sailsjs.com/config/routes for examples.)                    *
  *                                                                          *
  * If a request to a URL doesn't match any of the routes in this file, it   *
  * is matched against "shadow routes" (e.g. blueprint routes).  If it does  *
  * not match any of those, it is matched against static assets.             *
  *                                                                          *
  ***************************************************************************/


};
