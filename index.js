const app = require('express')()
const express = require('express')
const { connect } = require('mongoose')
require('dotenv').config()
const port = process.env.PORT || 3000
const http = require("http");
const https = http.createServer(app);
const io = require('socket.io')(https);
const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.json());


https.listen(port, () => {
    connect(
        process.env.MONGODB_URI,
    ).then(async () => {
        console.log("Connected to database");
        console.log("Express server listening:", port);
    });
});


io.on("connection", (socket) => {

    console.log("user connected", socket);

    socket.on("location", (msg) => {
        console.log(msg, "Stream");
        socket.broadcast.emit("location", msg);
    });
    socket.on("cancel-location", (msg) => {
        console.log(msg);
        socket.broadcast.emit("cancel-location", msg);
    });
    socket.on("disconnect", () => {
        console.log("user disconnected");
    });
});