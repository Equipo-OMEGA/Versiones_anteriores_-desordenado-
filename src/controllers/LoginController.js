//Incripta la contraseña
const bcrypt = require('bcrypt');

//Creacion de nuestra ruta para poder ingresar al inicio de sesion
function index(req, res) {
  if(req.session.loggedin != true){
    res.render('login/index');
  }else{
    res.redirect('/');
  }

}

//Funcion para poder iniciar sesion
function auth(req, res) {
  const data=req.body;
	//let email = req.body.email;
	//let password = req.body.password;

  //compara la contraseña y el correo electronico
  req.getConnection((err,conn) => {
    conn.query('SELECT * FROM users WHERE email = ?',[data.email], (err,userdata) => {
      if (userdata.length > 0){
        userdata.forEach(element => {
          conn.query('SELECT * FROM users WHERE password = ?',[data.password], (err,userdata) => {
          //Si coinciden la contraseña y el correo entonces se inicia la sesion
          if(userdata.length > 0){
            req.session.loggedin = true;
            req.session.nombre = element.nombre;
            
            res.redirect('/'); 
          }else{
            //Si no coinciden las contraseñas marcara el siguiente error 
            res.render('login/index', {error: 'Contraseña Incorrecta!'});
          }
        });
        });
        //Si no se cumple lo anterior marcara el siguiente error 
      } else {
        res.render('login/index', {error: 'El correo electronico no existe'});
      }
      
    });
  });
}


//Creacion de nuestra funcion para poder cerrar sesion
function logout(req, res) {
  if (req.session.loggedin == true) {
    req.session.destroy();

  }
  res.redirect('/login');
}


//Exportacion de nuestras funciones
module.exports = {
  index: index,
  auth: auth,
  logout: logout,
  

}
