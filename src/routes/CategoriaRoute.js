import express from 'express';
import { getAllCategorias, createCategoria, getCategoriaById, updateCategoria, deleteCategoria } from '../controllers/CategoriaController.js';
import { verifyUser } from '../middleware/AuthUser.js';

const router = express.Router();


router.get('/categorias', verifyUser, getAllCategorias);

router.get('/categorias/:id', verifyUser, getCategoriaById);

router.post('/categorias', verifyUser, createCategoria);

router.put('/categorias/:id', verifyUser, updateCategoria);

router.delete('/categorias/:id', verifyUser, deleteCategoria);

export default router;