const express = require('express');
const router = express.Router();
const con = require('../db');
const jwt = require('jsonwebtoken');


// Fetch all quizes of a course for a user (enrolled) 
router.post('/fetch', async (req, res) => {
    const { auth_tokken, courseId } = req.body;
    // console.log({ auth_tokken, courseId });

    try {
        const data = jwt.verify(auth_tokken, process.env.JWT_SECRET);
        const userID = data.user.id;
        const query = `
        SELECT q.id, q.name, q.created_at, IF(a.id IS NOT NULL, 1, 0) AS attempted
        FROM quizzes q
        LEFT JOIN quiz_attempts a ON q.id = a.quiz_id AND a.user_id = ${userID}
        WHERE q.course_id = ${courseId}
        ORDER BY attempted DESC
        `

        con.query(query, (err, result) => {
            if (err) {
                console.log(err);
                return res.status(500).json({ status: false, message: 'Internal Server Error' });
            }
            // console.log({ result })
            res.status(200).json({ status: true, quizzes: result });
        });
    } catch (err) {
        console.log({ err });
        return res.status(500).json({ status: false, message: 'Internal Server Error' });
    }
});

// Fetch the question for a quiz given the quiz id
router.post('/fetch-questions', async (req, res) => {
    const { auth_tokken, quizID } = req.body;
    try {
        // const data = jwt.verify(auth_tokken, process.env.JWT_SECRET);
        // const userID = data.user.id;
        const query = `
        SELECT qq.quiz_id as quizID, qq.id as questionID, question_text, correct_answer, wrong_answer_1, wrong_answer_2, wrong_answer_3 
        FROM questions as q
        JOIN quiz_questions as qq ON q.id = qq.question_id 
        WHERE qq.quiz_id = ${quizID};
        `

        con.query(query, (err, result) => {
            if (err) {
                console.log(err);
                return res.status(500).json({ status: false, message: 'Internal Server Error' });
            }
            // console.log({ result })
            res.status(200).json({ status: true, questions: result });
        });

    } catch (err) {
        console.log({ err });
        return res.status(500).json({ status: false, message: 'Internal Server Error' });
    }
});

module.exports = router;