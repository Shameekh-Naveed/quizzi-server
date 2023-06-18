const express = require('express');
const con = require('./db');
const cors = require('cors');
// const mysql = require('mysql2');
// const bodyParser = require('body-parser');
const bodyParser = require('body-parser');

const path = require('path');

// const con = mysql.createConnection({
// 	host: "localhost",
// 	user: "root",
// 	password: "admin",
// 	database: "quizzi"
// });
// con.connect(function (err) {
// 	if (err) { console.log({ err }); throw err };
// 	console.log("Connected to database successfully!");
// });
// console.log(process.env.REACT_APP_mongoURI)

const app = express();
const port = 5000;

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));


// Available Routes
app.use('/api/auth', require('./routes/auth'));
app.use('/api/courses', require('./routes/courses'));
app.use('/api/quizes', require('./routes/quizes'));

app.listen(process.env.PORT || port, () => {
	console.log(`Example app listening on port ${port}`);
});
