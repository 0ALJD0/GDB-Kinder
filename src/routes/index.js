const express= require('express');
const router = express.Router();
const control = require('../controllers/controllers')


//transact 1
router.get('/inter1',control.consulta);
router.post('/inter1',control.insert1);
//transact 2
router.get('/inter2',control.consultatrans2);
router.post('/inter2',control.updatetrans);
//crud1
router.get('/inter3',control.consultregistros);
router.post('/inter3',control.insertregistro1);
//CRUD 2
router.get('/inter4',control.consultregistros2);
router.post('/inter4',control.insertregistro2);
module.exports=router; 