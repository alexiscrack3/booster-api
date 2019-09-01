const WordController = require('../controllers/word');

exports.getAll = (req, res) => {
    WordController.getAll()
        .then((words) => {
            res.json({
                data: words,
            });
        })
        .catch(() => {
            res.status(500).json({
                error: {
                    status: 500,
                    message: 'Request could not be completed.',
                },
            });
        });
};

exports.getById = (req, res) => {
    WordController.getById(req.params.id)
        .then((word) => {
            res.json({
                data: word,
            });
        })
        .catch(() => {
            res.status(404).json({
                error: {
                    status: 404,
                    message: 'Word not found.',
                },
            });
        });
};

exports.create = (req, res) => {
    WordController.create(req.body)
        .then((word) => {
            res.json({
                data: word,
            });
        })
        .catch(() => {
            res.status(500).json({
                error: {
                    status: 500,
                    message: 'Request could not be completed.',
                },
            });
        });
};
