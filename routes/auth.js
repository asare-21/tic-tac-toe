const router = require('express').Router();
const { UserModel } = require('../model/user_model');
var bcrypt = require('bcryptjs');
var salt = bcrypt.genSaltSync(10);

router.get('/check/:username', (req, res) => {
    // Check if username exists in database
    const query = req.params.username
    try {
        UserModel.findOne({ username: query }, (err, user) => {
            if (err) return res.status(400).json({ success: false, error: err })
            if (user) return res.status(200).json({
                success: true, user: {
                    exists: true,
                    user: user._id
                }
            })
            return res.status(200).json({
                success: true, user: {
                    exists: false,
                    user: null
                }
            })
        })
    } catch (e) {
        console.log("Username check error: ", e)
        return res.status(400).json({ success: false, error: e })
    }
})


router.post("/login", (req, res) => {
    try {
        const { username, password } = req.body;
        UserModel.findOne({ username: username }, (err, user) => {
            if (err) return res.status(400).json({ success: false, error: err })
            if (!user) return res.status(200).json({ success: false, error: "User not found" })
            // Compare password
            bcrypt.compare(password, hash, function (err, result) {
                if (err) return res.status(400).json({ success: false, error: err })
                if (!result) {
                    // Incorrect password
                    return res.status(200).json({ success: false, error: "Password incorrect" })
                }
            });
            // Password correct
            return res.status(200).json({ success: true, user: user })
        })
    } catch (e) {
        console.log("Username authentication error: ", e)
        return res.status(400).json({ success: false, error: e })
    }
})

router.post("/create", (req, res) => {
    try {
        if (req.body.username === null || req.body.username === undefined) return res.status(400).json({ success: false, error: "Username/Password is required" })
        UserModel.findOne({ username: req.body.username }, (err, user) => {
            if (err) return res.status(400).json({ success: false, error: err })
            if (user) return res.status(200).json({ success: false, error: "Username already exists" })
            // Create user
            bcrypt.genSalt(10, function (err, salt) {
                bcrypt.hash(req.body.password, salt, function (err, hash) {
                    // Store hash in your password DB.
                    const newUser = new UserModel({
                        username: req.body.username,
                        password: hash
                    }).save()
                });
            });
            return res.status(200).json({ success: true, })

        })
    } catch (e) {
        console.log("Username creation error: ", e)
        return res.status(400).json({ success: false, error: e })
    }
})
module.exports.authRouter = router;