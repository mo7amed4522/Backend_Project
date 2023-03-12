 const mysql = require("mysql");
const db = mysql.createConnection({
    port: process.env.DB_PORT,
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.MYSQL_DB
});
db.connect((error) => {
    if (error)
        console.log(error.stack)
    else
        console.log('successs')
});
module.exports = db; 
