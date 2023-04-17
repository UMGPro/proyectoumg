const { createPool } = require('mysql2/promise');

const pool = createPool({
    host: '127.0.0.1',
    user: 'n270276_administrador',
    password: 'Guatemala321',
    database: 'n270276_farmacia',
    port: '3306'
})

module.exports = pool;