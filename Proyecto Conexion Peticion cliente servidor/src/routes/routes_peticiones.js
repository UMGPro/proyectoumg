const Router = require('express');
//Utilizamos express para el get, post, put, etc. mediante router.
const router = Router();
//Utilizamos controles
const solicitudes = require('../controllers/solicitudes');

router.get('/administrar', solicitudes.ObtenerInfo)//(req,res) => res.send('creando empleado'))
router.post('/administrar', solicitudes.CrearInfo)
router.put('/administrar', solicitudes.ActualizarInfo)
router.delete('/administrar', solicitudes.EliminarInfo)

module.exports = router;