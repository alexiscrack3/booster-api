const express = require('express');
const createError = require('http-errors');
const middlewares = require('./middlewares');
const routes = require('./config/routes');
const database = require('./db');

const app = express();

Object.keys(middlewares).forEach((key) => {
    app.use(middlewares[key]);
});

Object.keys(routes).forEach((path) => {
    app.use(path, routes[path]);
});

database.connect().catch((err) => {
    if (err) {
        process.exit(1);
    }
});

// catch 404 and forward to error handler
app.use((req, res, next) => {
    next(createError(404));
});

// error handler
app.use((err, req, res) => {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    // res.render('error', { title: 'error' });
});

module.exports = app;
