const mongoose = require('mongoose');

const { Schema } = mongoose;

const entrySchema = new Schema({
    headword: { type: String, required: true },
    class: { type: String, required: true, default: 'noun' },
    pronunciation: String,
    definitions: [String],
});

const Entry = mongoose.model('Entry', entrySchema);

module.exports = Entry;
