import express from 'express';
import http from 'http';
import { Server as SocketIOServer } from 'socket.io';
import cors from 'cors';
import session from 'express-session';
import dotenv from 'dotenv';
import UserRoute from './routes/UserRoute.js';
import ProductRoute from './routes/ProductRoute.js';
import AuthRoute from './routes/AuthRoute.js';
import IncidenciaRoute from './routes/IncidenciaRoute.js';
import CategoriaRoute from './routes/CategoriaRoute.js';
import SequelizeStoreFactory from 'connect-session-sequelize';
import db from './config/Database.js';
import { fileURLToPath } from 'url';
import path from 'path';

dotenv.config();

if (!process.env.SECRET_KEY) {
    console.error('No se encontró SECRET_KEY en las variables de entorno');
    process.exit(1);
}

const sessionSecret = process.env.SECRET_KEY;
const SequelizeStore = SequelizeStoreFactory(session.Store);
const store = new SequelizeStore({
    db: db
});

const app = express();
const server = http.createServer(app);
const io = new SocketIOServer(server, {
    cors: {
        origin: ['http://localhost:5173'],
        methods: ['GET', 'POST'],
        credentials: true
    }
});

const __dirname = path.dirname(fileURLToPath(import.meta.url));

app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

app.use(session({
    secret: sessionSecret,
    resave: false,
    saveUninitialized: true,
    store: store,
    cookie: {
        secure: 'auto'
    }
}));

app.use(cors({
    credentials: true,
    origin: ['http://localhost:5173']
}));

app.use(express.json());

app.use('/api', UserRoute);
app.use('/api', ProductRoute);
app.use('/api', AuthRoute);
app.use('/api', IncidenciaRoute);
app.use('/api', CategoriaRoute);

io.on('connection', (socket) => {
    console.log('Nuevo cliente conectado', socket.id);

    socket.on('disconnect', () => {
        console.log('Cliente desconectado', socket.id);
    });

    socket.on('mensaje', (data) => {
        console.log('Mensaje recibido:', data);
        io.emit('mensaje', data); // Envía el mensaje a todos los clientes conectados
    });
});

const PORT = process.env.APP_PORT || 3000;

server.listen(PORT, () => {
    console.log(`Servidor corriendo en el puerto ${PORT}`);
});