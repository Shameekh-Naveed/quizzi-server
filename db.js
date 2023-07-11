require('dotenv').config();
var mysql = require('mysql2');

// const connectToDB = async () => {
const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "password", // or admin
    database: "quizzi"
});
con.connect(function (err) {
    if (err) { console.log({ err }); throw err };
    console.log("Connected to database successfully!");
});
// }

module.exports = con;
