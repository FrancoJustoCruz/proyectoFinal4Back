import fs from 'fs/promises';
import path from 'path';
import Incidencia from '../models/IncidenciaModel.js';
import Categoria from '../models/CategoriaModel.js';
import User from '../models/UserModel.js';
import { Op } from 'sequelize';

export const getIncidencias = async (req, res) => {
    try {
        let response;
        if (req.role === 'admin') {
            response = await Incidencia.findAll({
                attributes: ['uuid', 'categoriaId', 'descripcion', 'estado', 'imagen'], 
                include: [
                    {
                        model: User,
                        attributes: ['name', 'email']
                    },
                    {
                        model: Categoria,
                        attributes: ['nombre']
                    }
                ]
            });
        } else {
            response = await Incidencia.findAll({
                attributes: ['uuid', 'categoriaId', 'descripcion', 'estado', 'imagen'], 
                where: {
                    userId: req.userId
                },
                include: [
                    {
                        model: User,
                        attributes: ['name', 'email']
                    },
                    {
                        model: Categoria,
                        attributes: ['nombre']
                    }
                ]
            });
        }
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
};

export const getIncidenciaById = async (req, res) => {
    try {
        const incidencia = await Incidencia.findOne({
            where: {
                uuid: req.params.id
            }
        });
        if (!incidencia) return res.status(404).json({ msg: 'Datos no encontrados' });
        
        let response;
        if (req.role === 'admin') {
            response = await Incidencia.findOne({
                attributes: ['uuid', 'categoriaId', 'descripcion', 'estado', 'imagen'], 
                where: {
                    id: incidencia.id
                },
                include: [
                    {
                        model: User,
                        attributes: ['name', 'email']
                    },
                    {
                        model: Categoria,
                        attributes: ['nombre']
                    }
                ]
            });
        } else {
            response = await Incidencia.findOne({
                attributes: ['uuid', 'categoriaId', 'descripcion', 'estado', 'imagen'], // Incluye 'imagen' aquí si necesitas la información de la imagen
                where: {
                    [Op.and]: [{ id: incidencia.id }, { userId: req.userId }]
                },
                include: [
                    {
                        model: User,
                        attributes: ['name', 'email']
                    },
                    {
                        model: Categoria,
                        attributes: ['nombre']
                    }
                ]
            });
        }
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
};

export const createIncidencia = async (req, res) => {
    const { categoriaId, descripcion, estado } = req.body;
    const imagen = req.file ? req.file.filename : null; // Obtener el nombre del archivo de la imagen

    try {
        const incidencia = await Incidencia.create({
            categoriaId,
            descripcion,
            estado,
            userId: req.userId,
            imagen // Guardar el nombre del archivo en la base de datos
        });

        // Obtener la URL completa de la imagen, si existe
        let imageUrl = null;
        if (incidencia.imagen) {
            imageUrl = `http://${req.headers.host}/uploads/${incidencia.imagen}`;
        }

        // Obtener la categoría correspondiente a partir del ID
        const categoria = await Categoria.findByPk(categoriaId);

        // Agregar la información de la categoría y la URL de la imagen a la incidencia
        incidencia.setDataValue('categoria', categoria);
        incidencia.setDataValue('imagenUrl', imageUrl);

        res.status(201).json({ msg: 'Incidencia creada exitosamente', incidencia });
    } catch (error) {
        console.error(error); // Loguear el error en la consola del servidor
        if (req.file) {
            await fs.unlink(path.normalize(`uploads/${req.file.filename}`));
        }
        res.status(500).json({ msg: error.message });
    }
};

export const updateIncidencia = async (req, res) => {
    try {
        const incidencia = await Incidencia.findOne({
            where: {
                uuid: req.params.id
            }
        });

        if (!incidencia) {
            return res.status(404).json({ msg: 'Datos no encontrados' });
        }

        const { categoriaId, descripcion, estado } = req.body;
        const imagenUrl = req.file ? `/uploads/${req.file.filename}` : incidencia.imagenUrl;

        if (req.role === 'admin') {
            await Incidencia.update({ categoriaId, descripcion, estado, imagenUrl }, {
                where: {
                    id: incidencia.id
                }
            });
        } else {
            if (req.userId !== incidencia.userId) {
                if (req.file) {
                    await fs.unlink(path.normalize(`uploads/${req.file.filename}`));
                }
                return res.status(403).json({ msg: 'Acceso prohibido' });
            }
            
            const oldImagen = incidencia.imagen;
            
            await Incidencia.update({ categoriaId, descripcion, estado, imagenUrl }, {
                where: {
                    [Op.and]: [{ id: incidencia.id }, { userId: req.userId }]
                }
            });

            if (req.file && oldImagen !== 'defaultImage.png') {
                await fs.unlink(path.normalize(`uploads/${oldImagen}`));
            }
        }

        res.status(200).json({ msg: 'Incidencia actualizada' });
    } catch (error) {
        console.error(error); // Loguear el error en la consola del servidor
        if (req.file) {
            await fs.unlink(path.normalize(`uploads/${req.file.filename}`));
        }
        res.status(500).json({ msg: error.message });
    }
};

export const deleteIncidencia = async (req, res) => {
    try {
        const incidencia = await Incidencia.findOne({
            where: {
                uuid: req.params.id
            }
        });
        if (!incidencia) return res.status(404).json({ msg: 'Datos no encontrados' });
        if (req.role === 'admin') {
            await Incidencia.destroy({
                where: {
                    id: incidencia.id
                }
            });
        } else {
            if (req.userId !== incidencia.userId) return res.status(403).json({ msg: 'Acceso prohibido' });
            await Incidencia.destroy({
                where: {
                    [Op.and]: [{ id: incidencia.id }, { userId: req.userId }]
                }
            });
        }

        if (incidencia.imagen && incidencia.imagen !== 'defaultImage.png') {
            await fs.unlink(path.normalize(`uploads/${incidencia.imagen}`));
        }

        res.status(200).json({ msg: 'Incidencia eliminada' });
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
};