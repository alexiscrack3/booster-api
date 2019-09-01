const express = require('express');
const WordRoutes = require('../app/routes/word');

const indexRouter = express.Router();
const wordRouter = express.Router();

indexRouter.get('/', (req, res) => {
    res.send('Hello World!');
});

wordRouter
    .get('/', WordRoutes.getAll)
    .get('/:id', WordRoutes.getById);

module.exports = {
    '/': indexRouter,
    '/words': wordRouter,
};
