const express = require('express');
const router = express.Router();
const con = require('../db');


router.post('/fetch', async (req, res) => {
    const { userId, courseId } = req.body;

    try {
        const query = `
        SELECT quizzes.id, quizzes.name, quizzes.created_at, COUNT(questions.id) AS total_questions
        FROM quizzes
        INNER JOIN courses ON quizzes.course_id = courses.id
        INNER JOIN enrollments ON courses.id = enrollments.course_id
        LEFT JOIN questions ON quizzes.id = questions.quiz_id
        WHERE enrollments.user_id = ? AND quizzes.course_id = ?
        GROUP BY quizzes.id, quizzes.name, quizzes.created_at;
      `;

        con.query(query, [userId, courseId], (err, result) => {
            if (err) {
                console.log(err);
                return res.status(500).json({ status: false, message: 'Internal Server Error' });
            }

            res.status(200).json({ status: true, quizzes: result });
        });
    } catch (err) {
        console.log({ err });
        return res.status(500).json({ status: false, message: 'Internal Server Error' });
    }
});

module.exports = router;