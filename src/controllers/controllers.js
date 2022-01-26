const db = require("../database");
/*exports.consulta= async(req,res)=>{
    const a= await db.query('select  id_ninio, nombre_ninio || \'\' || apellido_ninio as nombres from ninio WHERE ESTADO_MATRICULA=TRUE; ');
    res.status(200).json(a.rows);
};*/
exports.consulta = (req, res) => {

    db.query("select  id_ninio as ID, apellido_ninio || \' \' || nombre_ninio  as nombres from ninio WHERE ESTADO_MATRICULA=TRUE;", (error, results) => {
        if (error) {
            console.log(error);
            
        } else {
            console.log(results.rows);
            req.datos = results.rows;
            res.render("inter1", {
                datos: req.datos,
                
                
            });
            
        }
    });
    
};

exports.insert1 = async (req, res) => {
    const {ninio,anio=5, precio} = req.body
    const client = await db.connect()
    try {
        await client.query('BEGIN')
        await client.query('UPDATE ninio SET estado_matricula = FALSE WHERE id_ninio = $1 and estado_matricula=TRUE' , [ninio])   
        await client.query(`INSERT INTO MATRICULA 
        (ID_NINIO,ID_ANO_LECTIVO,PRECIO_MATRICULA) VALUES ($1, $2, $3)`, 
        [ninio,anio , precio ])
        await client.query('COMMIT')
        res.json({status: "ok"})
    } catch (error) {
        await client.query('ROLLBACK')
    throw error
    } finally {
        client.release()
    }
} 


//transact 2
exports.consultatrans2 = async(req, res) => {
    const client= await db.query("select  n.id_ninio as ID, n.apellido_ninio || \' \' ||n.nombre_ninio as nombre  from ninio n inner join matricula mat on n.id_ninio=mat.id_ninio inner join ano_lectivo an on mat.id_ano_lectivo=an.id_ano_lectivo where an.ano=\'2021\';" );
    const client2 = await db.query("select act.id_actividad as id, act.nombre_avtivi as nombre from actividad act inner join programa pro on act.id_programa=pro.id_programa inner join ano_lectivo an on pro.id_ano_lectivo=an.id_ano_lectivo where an.ano=\'2021\' and act.finalizado=FALSE;");
    const client3= await db.query("select tip.id_tipo_rendimient as id, tip.nombre_rendimient as nombre from tipo_rendimiento tip;");
if (client.rowCount>0 && client2.rowCount>0 && client3.rowCount>0 ) {
    console.log(client.rows);
    console.log(client2.rows);
    console.log(client3.rows);
    req.datos = client.rows;
    req.datos2=client2.rows;
    req.datos3 = client3.rows;
            res.render("inter2", {
                datos:req.datos,
                actividad: req.datos2,
                rendimiento:req.datos3,
                
            });
} else {
    
}
    
};
exports.updatetrans  = async(req,res) =>{
    const {ninio,actividad, rendimient,obser} = req.body;
    const client = await db.connect();
    try {
        await client.query('BEGIN');
        
        await client.query('update actividad act set finalizado = TRUE where act.id_actividad=$1 and act.finalizado=FALSE  ',[actividad]);
        await client.query('insert into rendimiento (id_ninio,id_tipo_rendimient,id_actividad,observaciones) values ($1,$2,$3,$4)',[ninio, rendimient,actividad,obser]);
        await client.query('COMMIT');
        res.json({status: "ok"});
    } catch (error) {
        await client.query('ROLLBACK')
        throw error;
    }finally {
        client.release()
    }
    
}
//CRUD 1 Registro TUTOR 
exports.consultregistros = async(req, res) => {
    const client= await db.query("select id_nacionalidad as id,nombre_nacionalidad as nombre from nacionalidad;" );
    const client2 = await db.query("select id_genero as id, nombre_genero as nombre from genero");
    const client3= await db.query("select id_parentesco as id, nombre_parentesco as nombre from relacion;");
if (client.rowCount>0 && client2.rowCount>0 && client3.rowCount>0) {
    console.log(client.rows);
    console.log(client2.rows);
    console.log(client3.rows);
    req.datos = client.rows;
    req.datos2=client2.rows;
    req.datos3 = client3.rows;
            res.render("inter3", {
                nacionalidad:req.datos,
                genero: req.datos2,
                parentesco:req.datos3,
                
            });
} else {
    
}
   
};

exports.insertregistro1 = async (req,res) =>{
    const {nacionalidad,genero, parentesco,nombre,apellido,cedula,direccion,telefono,domicilio,motivo} = req.body;
    const client = await db.connect();
    try {
        await client.query(
            "INSERT INTO TUTOR (ID_NACIONALIDAD,ID_GENERO,ID_PARENTESCO,NOMBRE_TUTOR,APELLIDO_TUTOR,CI_TUTOR,DIRECCION_TUTOR,TELEFONO_TUTOR,DOMICILIO_TUTOR,MOTIVO) VALUES"+
            "($1,$2,$3,$4,$5,$6,$7,$8,$9,$10);"
            ,[nacionalidad,genero, parentesco,nombre,apellido,cedula,direccion,telefono,domicilio,motivo]
        );
        res.json({status: "ok"});
    }   catch (error) {
        throw error;
    }  finally {
        client.release();
    }

}
//CRUD 2 Registro PADRE
exports.consultregistros2 = async(req, res) => {
    const client= await db.query("select id_nacionalidad as id,nombre_nacionalidad as nombre from nacionalidad;" );
    const client2 = await db.query("select id_genero as id, nombre_genero as nombre from genero");
    const client3= await db.query("select id_parentesco as id, nombre_parentesco as nombre from relacion;");
if (client.rowCount>0 && client2.rowCount>0 && client3.rowCount>0) {
    console.log(client.rows);
    console.log(client2.rows);
    console.log(client3.rows);
    req.datos = client.rows;
    req.datos2=client2.rows;
    req.datos3 = client3.rows;
            res.render("inter4", {
                nacionalidad:req.datos,
                genero: req.datos2,
                parentesco:req.datos3,
                
            });
} else {
    
}
   
};
exports.insertregistro2 = async (req,res) =>{
    const {nacionalidad,genero,nombre,apellido,cedula,direccion,telefono,domicilio} = req.body;
    const client = await db.connect();
    try {
        await client.query(
            "INSERT INTO PADRE (ID_NACIONALIDAD,ID_GENERO,NOMBRE_PADRE,APELLIDO_PADRE,CI_PADRE,DIRECCION_PADRE,TELEFONO_PADRE,DOMICILIO_PADRE) VALUES"+
            "($1,$2,$3,$4,$5,$6,$7,$8);"
            ,[nacionalidad,genero,nombre,apellido,cedula,direccion,telefono,domicilio]
        );
        res.json({status: "ok"});
    }   catch (error) {
        throw error;
    }  finally {
        client.release();
    }

}