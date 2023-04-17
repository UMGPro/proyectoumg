const pool = require('../db');

const ObtenerInfo = async(req,res) => {
        const {nick,pass} = req.body
        const [result]= await  pool.query('SELECT fk_empleado FROM usuariof WHERE nick=? AND password=SHA2(?, 256)', [nick,pass])
        res.send({result})
};

const CrearInfo= async (req,res) => {
    const {id, nick, password, empleado}= req.body
    const [rows] = await pool.query('INSERT INTO usuariof (id_user, nick,password,fk_empleado) VALUES (?,?,SHA2(?, 256),?)', [id, nick, password,empleado])
   //console.log(req.body) 
   //Solo para verificar si se insertaron los datos m.
   res.send({rows})
}
//const ActualizarInfo= (req,res) => res.send('Actualizando')
const ActualizarInfo= async (req,res) => {
        const {id,nick,pass,empleado} = req.body
        const [Actualizado]= await  pool.query('UPDATE usuariof SET nick = ?, password=SHA2(?, 256), fk_empleado=? WHERE id_user=?',[nick,pass,empleado,id])
        res.send({Actualizado})
};
//const EliminarInfo=(req,res)=> res.send('Eliminando')
const EliminarInfo=async(req,res)=> {
        const {id,nick} = req.body
        const [Eliminado]= await  pool.query('DELETE FROM usuariof WHERE id_user=? AND nick=?', [id,nick])
        res.send({Eliminado})
};

const solicitudes={
    ObtenerInfo: ObtenerInfo,
    CrearInfo: CrearInfo,
    ActualizarInfo: ActualizarInfo,
    EliminarInfo: EliminarInfo
};

module.exports = solicitudes;

