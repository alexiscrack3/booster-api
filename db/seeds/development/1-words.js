/* eslint-disable import/no-extraneous-dependencies */
const faker = require('faker');
const Word = require('../../../app/models/word');

const words = [
];
for (let index = 0; index < 10; index += 1) {
    const word = new Word({
        text: faker.random.word(),
    });
    words.push(word);
}

module.exports = words;
