const Entry = require('../models/entry');

exports.getAll = () => Entry.find({});

exports.getById = id => Entry.findById(id);

exports.getByEmail = email => Entry.findOne({ email });

exports.create = (body) => {
    const entry = Entry(body);
    return entry.save();
};
