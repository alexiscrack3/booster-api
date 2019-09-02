/* eslint-disable import/no-extraneous-dependencies */
const fs = require('fs');
const faker = require('faker');
const Entry = require('../../../app/models/entry');

const content = fs.readFileSync('./Vocabulary.txt', 'utf8')
    .split('\n')
    .filter(line => line !== '');

const entries = [];
for (let index = 0; index < content.length; index += 1) {
    const entry = new Entry({
        headword: content[index],
        definitions: [faker.random.words()],
    });
    entries.push(entry);
}

module.exports = entries;
