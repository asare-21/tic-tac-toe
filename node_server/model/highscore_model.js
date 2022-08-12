const { Schema, model } = require('mongoose')

const highscoreSchema = new Schema({
    score: {
        type: Number,
        required: true,
    }
})

const Highscore = model('Highscore', highscoreSchema)

module.exports.HighScoreModel = Highscore;