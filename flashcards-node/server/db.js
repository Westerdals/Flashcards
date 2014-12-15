var mongoose = require('mongoose');

mongoose.connect('mongodb://localhost/flashcards', function (err) {
    if (err) console.log(err);
    console.log('Connected to MongoDB.');
});

module.exports = mongoose;
