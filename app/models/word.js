const mongoose = require('mongoose');

const { Schema } = mongoose;

const wordSchema = new Schema({
    text: { type: String, required: true },
    pronunciation: String,
    definitions: [String],
});

const Word = mongoose.model('Word', wordSchema);

module.exports = Word;
