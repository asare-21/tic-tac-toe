const { Schema, model } = require('mongoose')

const highscoreSchema = new Schema({
    score: {
        type: Number,
        required: true,
    }
})



module.exports.HighScoreSchema = highscoreSchema;