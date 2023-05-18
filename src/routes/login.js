//Constantes para llamar a las carpetas con todo y sus funciones
const express = require('express');
const { requiresAuth } = require('express-openid-connect');
const LoginController = require('../controllers/LoginController');
const MenuController = require('../controllers/MenuController');

//funcion que nos ayuda a definir las rutas de nuestras paginas 
const router = express.Router();

//definimos la ruta que usaremos para la funcion index la cual nos redirigue hasia nuestro inicio de sesion
router.get('/login', LoginController.index);

//definimos la ruta que usaremos para la funcion index la cual nos redirigue hasia nuestro formulario de registro
//router.get('/register', LoginController.register);

//se utiliza la misma ruta register ya que la funcion store es la que nos agregara los datos a nuestra base
//router.post('/register', LoginController.storeUser);

//se utiliza la misma ruta login ya que la funcion auth nos ayuda a iniciar sesion 
router.post('/login', LoginController.auth);
//definimos la ruta para poder cerrar sesion
router.get('/logout', LoginController.logout);

router.get('/menu', MenuController.alta);


//exportacion de las rutas
module.exports = router;
