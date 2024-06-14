import {Sequelize} from 'sequelize'

const db=new Sequelize('edificio','root','',{
    host:'localhost',
    dialect:'mysql'
})

export default db