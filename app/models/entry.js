const mongoose = require('mongoose');

const { Schema } = mongoose;

const entrySchema = new Schema({
    text: { type: String, required: true },
    pronunciation: String,
    definitions: [String],
});

const Entry = mongoose.model('Entry', entrySchema);

module.exports = Entry;
