const EntryController = require('../controllers/entry');

exports.getAll = (req, res) => {
    EntryController.getAll()
        .then((entries) => {
            res.json({
                data: entries,
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
    EntryController.getById(req.params.id)
        .then((entry) => {
            res.json({
                data: entry,
            });
        })
        .catch(() => {
            res.status(404).json({
                error: {
                    status: 404,
                    message: 'Entry not found.',
                },
            });
        });
};

exports.create = (req, res) => {
    EntryController.create(req.body)
        .then((entry) => {
            res.json({
                data: entry,
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
