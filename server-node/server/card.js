var db = require('./db');

var Card = db.model('Card', db.Schema({
    key: {type: String, required: true},
    value: {type: String, required: true}
}));

module.exports = Card;
