const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
const con = require('../db');
// const uuid = require('uuid');
// const User = require('../models/User');
const bcrypt = require('bcryptjs');
const crypto = require('crypto');
const jwt = require('jsonwebtoken');
// const { exists } = require('../models/User');


router.post('/signup', [
	body('email').isEmail(),
	body('password').isLength({ min: 5 }).isAlphanumeric(),
], async (req, res) => {

	let status = false;
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return res.status(400).json({ status, message: errors.array() });
	}
	const { name, email, password } = req.body;
	// const id = uuid.v4();
	// Check if the user already exists
	const checkUserQuery = `SELECT * FROM users WHERE email = "${email}"`;
	con.query(checkUserQuery, async (err, result) => {
		if (err) console.log({ err });
		if (result.length > 0) {
			return res.status(401).json({ status, message: 'User already exists' });
		}

		// converrting password to hash
		const salt = await bcrypt.genSalt(10);
		const secPassword = await bcrypt.hash(password, salt);

		// Make a new user
		const newUserQuery = `INSERT INTO users (id,name, password, email) VALUES ("${id}", "${name}", "${secPassword}","${email}")`;
		con.query(newUserQuery, (err, result) => {
			if (err) { console.log({ err }); throw err };
			status = true;
			res.status(200).json({ status, message: 'Success! User created' });
		})
	});
})

router.post('/login', [
	body('email').isEmail(),
	body('password').isLength({ min: 5 }).isAlphanumeric(),
], async (req, res) => {
	let status = false;
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return res.status(400).json({ status, message: errors.array() });
	}
	const { email, password } = req.body;

	// Find the user
	const checkUserQuery = `SELECT * FROM users WHERE email = "${email}"`;
	con.query(checkUserQuery, async (err, result) => {
		if (err) { console.log({ err }); throw err };
		if (result.length === 0) {
			return res.status(401).json({ status, message: 'Invalid credentials' });
		}
		const user = result[0];

		// Match the password
		const isMatch = await bcrypt.compare(password, user.password);
		if (!isMatch) {
			return res.status(401).json({ status, message: 'Invalid credentials' });
		}

		// Successful login
		status = true;
		const data = {
			user: {
				id: user.id,
			},
		};
		const authToken = jwt.sign(data, process.env.JWT_SECRET);
		res.status(200).json({ status, message: 'Success! Logged in', authToken });
	})

}
)

module.exports = router;
