import Categoria from '../models/CategoriaModel.js';


export const getAllCategorias = async (req, res) => {
    try {
        const categorias = await Categoria.findAll();
        res.status(200).json(categorias);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};


export const createCategoria = async (req, res) => {
    const { nombre } = req.body;
    try {
        const categoria = await Categoria.create({ nombre });
        res.status(201).json(categoria);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};


export const getCategoriaById = async (req, res) => {
    const { id } = req.params;
    try {
        const categoria = await Categoria.findByPk(id);
        if (!categoria) {
            res.status(404).json({ error: 'Categoría no encontrada' });
        } else {
            res.status(200).json(categoria);
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};


export const updateCategoria = async (req, res) => {
    const { id } = req.params;
    const { nombre } = req.body;
    try {
        const categoria = await Categoria.findByPk(id);
        if (!categoria) {
            res.status(404).json({ error: 'Categoría no encontrada' });
        } else {
            await categoria.update({ nombre });
            res.status(200).json(categoria);
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

export const deleteCategoria = async (req, res) => {
    const { id } = req.params;
    try {
        const categoria = await Categoria.findByPk(id);
        if (!categoria) {
            res.status(404).json({ error: 'Categoría no encontrada' });
        } else {
            await categoria.destroy();
            res.status(200).json({ message: 'Categoría eliminada exitosamente' });
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};