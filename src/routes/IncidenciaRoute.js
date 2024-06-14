import express from 'express';
import { getIncidencias, getIncidenciaById, createIncidencia, updateIncidencia, deleteIncidencia } from '../controllers/Incidencias.js';
import { verifyUser } from '../middleware/AuthUser.js';
import upload from '../config/uploadConfig.js'; 

const router = express.Router();

router.get('/incidencias', verifyUser, getIncidencias);
router.get('/incidencias/:id', verifyUser, getIncidenciaById);
router.post('/incidencias', verifyUser, upload.single('imagen'), createIncidencia); 
router.patch('/incidencias/:id', verifyUser, updateIncidencia);
router.delete('/incidencias/:id', verifyUser, deleteIncidencia);

export default router;