
function index(req, res) {
   //seleccion de la tabla de nuestra base de datos
   req.getConnection((err, conn) => {
     //le damos valor a la variable users la cual sera nuestra tabla y nos servira para imprimir datos
     conn.query('SELECT * FROM users', (err, users) => {
       if(err) {
         res.json(err);
       }
       //renderisacion de la pagina para la tabla
       res.render('pages/tablaPersonal', {users});
     });
   });
 }
  //Creacion de la ruta para la pagina que nos dara de alta el personal
   function create(req, res) {   
     res.render('pages/altaPersonal');
   }
 
 
 //funcion para poder insertar nuestros datos a la base de datos
   function store(req, res) {      
     const data=req.body;
     //Conecta con la base de datos
     req.getConnection((err,conn) => {
       //Hace una comparacion con los emails para comprovar si no hay uno identico al que nos dio el usuario
       conn.query('SELECT * FROM users WHERE email= ?',[data.email], (err,userData) => {
         //Si se euncuentra unos similar nos redirige a la pagina de alta personal y nos muestra un error
         if (userData.length>0){
           //Hace la redireccion y definimos lo que dira el error
           res.render('pages/altaPersonal', {error: 'Este correo ya existe'});
         //Si no se encuentra ninguno similar insertara los datos a la base
         } else {
           //Conecta a la base e inserta los datos dados por el usuario
             req.getConnection((err,conn) => {
                 conn.query('INSERT INTO users SET ?',[data], (err,rows) => {
                   //Una ves insertadoa nos dirigira a nuestra tabla 
                   res.redirect('/pers'); 
                 });
             });
         
         }
       });
     });
   } 
 
   //Funcion para eliminar usuarios mediante su id en la base de datos
   function destroy(req, res){
     const id = req.body.id;
     
     //Coneccion de la base de datos
     req.getConnection((err, conn) =>{
       //Query para poder elegir la tabla de la base de datos y su id y asi los elimine
       conn.query('DELETE FROM users WHERE id = ?', [id], (err, rows) =>{
           //Una ves eliminados nos redirigira a la tabla
           res.redirect('/pers')
       });
   });
   }
 
   //Funcion para editar
   function edita(req, res){
     const id = req.params.id;
 
     //Coneccion de la base de datos
     req.getConnection((err, conn) => {
       //Query para poder elegir la tabla de la base de datos y su id
         conn.query('SELECT * FROM users WHERE ID = ?', [id], (err, users) => {
             //Si no se encuentran los datos anteriores marcara error
             if(err){
                 res.json(err);  
             }
             //Si se encuentra nos renderesira la pagina de editar el cual nos mostrara el formulario con los 
             //datos del usuario para editar
             res.render('pages/edita', { users });
         });
     });
   }
 
   //Funcion para agregar los cambios a la base de datos
   function update(req, res){
     const id = req.params.id;
     const data = req.body;
 
     //coneccion con la base de datos
     req.getConnection((err, conn) => {
       //Query para selccionar los datos, busca el id y haci insertar los datos cambiados
         conn.query('UPDATE users SET ? WHERE id = ?', [data, id], (err, rows) => {
             //Una ves echo esto nos redireccionara a la tabla
             res.redirect('/pers')
         });
     });
   }
 
 
   //Exportacion de nuestras funciones 
   module.exports = {
     index: index,
     create: create,
     store: store,
     destroy: destroy,
     edita: edita,
     update: update,
   }