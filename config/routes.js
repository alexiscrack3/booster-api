const express = require('express');
const EntryRoutes = require('../app/routes/entry');

const indexRouter = express.Router();
const entryRouter = express.Router();

indexRouter.get('/', (req, res) => {
    res.send('Hello World!');
});

entryRouter
    .get('/', EntryRoutes.getAll)
    .get('/:id', EntryRoutes.getById);

module.exports = {
    '/': indexRouter,
    '/entries': entryRouter,
};
