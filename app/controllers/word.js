const Word = require('../models/word');

exports.getAll = () => Word.find({});

exports.getById = id => Word.findById(id);

exports.getByEmail = email => Word.findOne({ email });

exports.create = (body) => {
    const word = Word(body);
    return word.save();
};
