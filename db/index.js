const mongoose = require('mongoose');
const debug = require('debug')('booster:database');

let db = null;

function buildConnString() {
    let connString = `${process.env.DB_PREFIX}://`;
    if (process.env.DB_USER && process.env.DB_PASS) {
        connString += `${process.env.DB_USER}:${process.env.DB_PASS}@`;
    }
    connString += process.env.DB_HOST;
    if (process.env.DB_PORT) {
        connString += `:${process.env.DB_PORT}`;
    }
    connString += `/${process.env.DB_NAME}`;
    if (process.env.DB_MISC) {
        connString += process.env.DB_MISC;
    }
    return connString;
}

module.exports = {
    connect: (connection = buildConnString()) => new Promise((resolve, reject) => {
        const options = {
            useNewUrlParser: true,
            useCreateIndex: true,
        };
        mongoose.connect(connection, options).then((client) => {
            debug(`Connected to ${client.connection.name}`);
            db = client;
            resolve(client);
        }, (err) => {
            debug('MongoDB Connection Error. Please make sure that MongoDB is running.');
            reject(err);
        });
    }),
    disconnect: () => new Promise((resolve, reject) => {
        db.connection.close(() => {
            resolve();
        }, (err) => {
            reject(err);
        });
    }),
    drop: () => new Promise((resolve, reject) => {
        db.connection.dropDatabase(() => {
            resolve();
        }, (err) => {
            reject(err);
        });
    }),
};
