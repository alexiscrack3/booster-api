const mongoose = require('mongoose');

const { Schema } = mongoose;

const wordSchema = new Schema({
    text: String,
});

const Word = mongoose.model('Word', wordSchema);

module.exports = Word;
