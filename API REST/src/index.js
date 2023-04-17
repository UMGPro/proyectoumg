const express = require('express');
const Peticion = require('./routes/routes_peticiones');
const app = express();

//Antes de que lleguen a las rutas las peticiones del cliente
//Interpretamos el .json que nos llega.
app.use(express.json())

//app.get('/empleado', async(req,res) => {
//    const [result]= await  pool.query('SELECT 1+1 AS RESULT')
//    res.json(result[0])
//});
//app.post('/empleado', (req,res) => res.send('creando empleado'))
//app.put('/empleado', (req,res) => res.send('actualizando empleado'))
//app.delete('/empleado', (req,res) => res.send('eliminando empleado'))
app.use(Peticion)

app.listen(3000);