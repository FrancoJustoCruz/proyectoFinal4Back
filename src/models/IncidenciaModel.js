import { Sequelize, DataTypes } from 'sequelize';
import db from '../config/Database.js'; 


import User from './UserModel.js';
import Categoria from './CategoriaModel.js';

const Incidencia = db.define('incidencia', {
    uuid: {
        type: DataTypes.STRING,
        defaultValue: DataTypes.UUIDV4,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    categoriaId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    descripcion: {
        type: DataTypes.TEXT,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    estado: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    userId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    imagen: {
        type: DataTypes.STRING, // Ajusta el tipo de datos según tus necesidades (STRING, TEXT, etc.)
        allowNull: true // Puede ser nullable si no todos los registros tienen imagen
    }
}, {
    freezeTableName: true
});

// Relaciones con otros modelos
User.hasMany(Incidencia, { foreignKey: 'userId' });
Incidencia.belongsTo(User, { foreignKey: 'userId' });

Categoria.hasMany(Incidencia, { foreignKey: 'categoriaId' });
Incidencia.belongsTo(Categoria, { foreignKey: 'categoriaId' });

export default Incidencia;