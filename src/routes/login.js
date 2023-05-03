//Constantes para llamar a las carpetas con todo y sus funciones
const express = require('express');
const LoginController = require('../controllers/LoginController');
const persController = require('../controllers/personalController');
const menuController = require('../controllers/menuController');

//Funcion que nos ayuda a definir las rutas de nuestras paginas 
const router = express.Router();

//Definimos la ruta que usaremos para la funcion index la cual nos redirigue asia nuestro inicio de sesion
router.get('/login', LoginController.index);
//Se utiliza la misma ruta login ya que la funcion auth nos ayuda a iniciar sesion 
router.post('/login', LoginController.auth);
//Definimos la ruta para poder cerrar sesion
router.get('/logout', LoginController.logout);


//Definimos la ruta que usaremos para la funcion index la cual nos redirigue asia la tabla de datos
router.get('/pers', persController.index);
//Definimos la ruta que usaremos para la funcion create la cual nos redirigue asia el formulario donde 
//devemos insertar nuestros datos
router.get('/create', persController.create);
//Se utiliza la misma ruta create ya que la funcion store es la que nos agregara los datos a nuestra base
router.post('/create', persController.store);
//Definicion de la ruta que usaremos para eliminar usuarios
router.post('/pers/delete', persController.destroy);
//Definicion de las rutas que usaremos para editar usuarios mas sus ids
router.get('/pers/edita/:id', persController.edita);
router.post('/pers/edita/:id', persController.update);

//Definimos la ruta que usaremos para la funcion menu la cual nos redirigue asia la tabla de datos
router.get('/menu', menuController.menu);
//Definimos la ruta que usaremos para la funcion alta la cual nos redirigue asia el formulario donde 
//devemos insertar nuestros datos
router.get('/alta', menuController.alta);
//Se utiliza la misma ruta create ya que la funcion store es la que nos agregara los datos a nuestra base
router.post('/alta', menuController.store);
//Definicion de la ruta que usaremos para eliminar productos
router.post('/menu/delete', menuController.destroy);
//Definicion de las rutas que usaremos para editar productos mas sus ids
router.get('/menu/edit/:id', menuController.edit);
router.post('/menu/edit/:id', menuController.update);

//Exportacion de las rutas
module.exports = router;

