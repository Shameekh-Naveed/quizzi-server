const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
const jwt = require('jsonwebtoken');
const con = require('../db');

router.get('/search', async (req, res) => {
    const { searchQuery } = req.query;
    const trimmedSearchQuery = searchQuery.trim();

    try {
        const searchTerms = trimmedSearchQuery.split(' ');

        // Build the SQL query dynamically based on the search terms
        let sqlQuery = 'SELECT * FROM courses WHERE ';
        const conditions = [];

        searchTerms.forEach((term, index) => {
            const condition = `name LIKE '%${term}%'`;
            conditions.push(condition);
        });

        sqlQuery += conditions.join(' OR ');

        // Add ORDER BY clause to sort the results by resemblance to the search query
        sqlQuery += ` ORDER BY CASE
                        WHEN name LIKE '${searchQuery}%' THEN 1
                        WHEN name LIKE '%${searchQuery}%' THEN 2
                        ELSE 3
                      END`;

        // Execute the SQL query
        con.query(sqlQuery, (err, result) => {
            if (err) {
                console.log({ err });
                return res.status(500).json({ status: false, message: 'Internal Server Error' });
            }

            // Return the matching courses
            res.status(200).json({ status: true, courses: result });
        });
    } catch (err) {
        console.log({ err });
        return res.status(500).json({ status: false, message: 'Internal Server Error' });
    }
});


router.post('/enroll', async (req, res) => {
    const { courseId, auth_tokken } = req.body;

    try {
        // Check if the enrollment already exists
        const data = jwt.verify(auth_tokken, process.env.JWT_SECRET);
        const userID = data.user.id;

        const checkEnrollmentQuery = 'SELECT * FROM enrollments WHERE course_id = ? AND user_id = ?';
        con.query(checkEnrollmentQuery, [courseId, userID], (err, result) => {
            if (err) {
                console.log(err);
                return res.status(500).json({ status: false, message: 'Internal Server Error' });
            }

            if (result.length > 0) {
                // User is already enrolled in the course
                return res.status(400).json({ status: false, message: 'User is already enrolled in the course' });
            }

            // Create the enrollment
            const createEnrollmentQuery = 'INSERT INTO enrollments (user_id, course_id) VALUES (?, ?)';
            con.query(createEnrollmentQuery, [userID, courseId], (err, result) => {
                if (err) {
                    console.log(err);
                    return res.status(500).json({ status: false, message: 'Internal Server Error' });
                }

                // Enrollment created successfully
                res.status(200).json({ status: true, message: 'Enrollment created successfully' });
            });
        });
    } catch (err) {
        console.log({ err });
        return res.status(500).json({ status: false, message: 'Internal Server Error' });
    }
});

router.get('/getEnrolledCourses/', async (req, res) => {
    const auth_tokken = req.query.userId;
    // const userId = 107;

    try {
        const data = jwt.verify(auth_tokken, process.env.JWT_SECRET);
        const userID = data.user.id;

        const query = `
        SELECT courses.id, courses.name, COUNT(quizzes.id) AS total_quizzes
        FROM courses
        INNER JOIN enrollments ON courses.id = enrollments.course_id
        LEFT JOIN quizzes ON courses.id = quizzes.course_id
        WHERE enrollments.user_id = ?
        GROUP BY courses.id, courses.name;
      `;

        con.query(query, [userID], (err, result) => {
            if (err) {
                console.log(err);
                return res.status(500).json({ status: false, message: 'Internal Server Error' });
            }
            res.status(200).json({ status: true, courses: result });
        });
    } catch (err) {
        console.log({ err });
        return res.status(500).json({ status: false, message: 'Internal Server Error' });
    }
});



module.exports = router;
