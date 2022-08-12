const { Schema, model } = require('mongoose')
const { HighScoreModel } = require('../model/highscore_model')
const userSchema = new Schema({
    username: {
        type: String,
        required: true,
    },
    password: {
        type: String,
        required: true,
    },
    scores: [HighScoreModel],
    dateJoined: {
        type: Date,
        default: Date.now(),
    }
})

const User = model('User', userSchema)

module.exports.UserModel = User;