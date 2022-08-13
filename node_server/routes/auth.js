const router = require('express').Router();
const { UserModel } = require('../model/user_model');
router.get('/check', (req, res) => {
    // Check if username exists in database
    const query = req.query.username
    UserModel.findOne({ username: query }, (err, user) => {
        if (err) return res.statusCode(400).json({ success: false, error: err })
        if (user) return res.statusCode(200).json({
            success: true, user: {
                exists: true,
                user: user._id
            }
        })
        return res.statusCode(200).json({
            success: true, user: {
                exists: false,
                user: null
            }
        })
    })
})

module.exports.authRouter = router;