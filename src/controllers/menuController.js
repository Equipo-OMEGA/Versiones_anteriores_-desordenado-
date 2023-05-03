function menu(req, res) {
    //Seleccion de la tabla de nuestra base de datos
    req.getConnection((err, conn) => {
        //Le damos valor a la variable productos la cual sera nuestra tabla y nos servira para imprimir datos
        conn.query('SELECT * FROM productos', (err, productos) => {
            if(err){
                res.json(err);
            }
            //Renderisacion de la pagina para la tabla
            res.render('menu/tablaMenu', { productos });
        });
    });
}

//Creacion de la ruta para la pagina que nos dara de alta el producto
function alta(req, res) {
    res.render('menu/altaMenu');
}

//Funcion para poder insertar nuestros datos ala base de datos
function store(req, res){
    const data = req.body;

    //Conecta a la base e inserta los datos dados por el usuario   
    req.getConnection((err, conn) => {
        conn.query('INSERT INTO productos SET ?', [data], (err, rows) =>{
            //Una ves insertado nos dirigira a nuestra tabla 
            res.redirect('/menu');
        });
    });
}

//Funcion para eliminar productos mediante su id en la base de datos
function destroy(req, res){
    const id = req.body.id;

    //Coneccion de la base de datos
    req.getConnection((err, conn) =>{
        //Query para poder elegir la tabla de la base de datos y su id y asi los elimine
        conn.query('DELETE FROM productos WHERE id = ?', [id], (err, rows) =>{
            //Una ves eliminados nos redirigira a la tabla
            res.redirect('/menu')
        });
    });
}

//Funcion para editar
function edit(req, res){
    const id = req.params.id;

    //Coneccion de la base de datos
    req.getConnection((err, conn) => {
        //Query para poder elegir la tabla de la base de datos y su id
        conn.query('SELECT * FROM productos WHERE ID = ?', [id], (err, productos) => {
             //Si no se encuentran los datos anteriores marcara error
            if(err){
                res.json(err);
            }
            //Si se encuentra nos renderesira la pagina de editar el cual nos mostrara el formulario con los 
            //datos del producto para editar
            res.render('menu/edit', { productos });
        });
    });
}

//Funcion para agregar los camios a la base de datos
function update(req, res){
    const id = req.params.id;
    const data = req.body;

    //Coneccion con la base de datos
    req.getConnection((err, conn) => {
        //Query para selccionar los datos, busca el id y haci insertar los datos cambiados
        conn.query('UPDATE productos SET ? WHERE id = ?', [data, id], (err, rows) => {
            //Una ves echo esto nos redireccionara a la tabla del menu 
            res.redirect('/menu')
        });
    });
}

  //Exportacion de nuestras funciones 
  module.exports = {
    menu,
    alta,
    store,
    destroy,
    edit,
    update,
}