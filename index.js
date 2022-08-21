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
const { authRouter } = require('./routes/auth')

https.listen(port, () => {
    connect(
        process.env.MONGODB_URI,
    ).then(async () => {
        console.log("Connected to database");
        console.log("Express server listening:", port);
    });
});

// Routes
app.use("/users", authRouter)
//

io.on("connection", (socket) => {
    ////////////////////////////////////////////////////////////////
    console.log("user connected");
    console.log("Rooms ", socket.rooms)
    ////////////////////////////////////////////////////////////////

    socket.on("new-room", (roomId, userId) => {
        console.log(roomId, userId)
        socket.emit(roomId); // Join room
    })
    socket.on("leave-room", (roomId, userId) => {
        console.log(roomId, userId)

        socket.join(roomId); // Join room
    })

    socket.on("game", (roomId, userId) => {
        socket.to(roomId).emit("game", { userId, positon: "001" }); // emit data to specific room
    })



    ////////////////////////////////////////////////////////////////
    socket.on("disconnect", (roomId) => {
        console.log("user disconnected");
        socket.leave(roomId); // Leave room
        socket.to(roomId).emit(`user ${socket.id} has left the room`); // Notify other users in room
    });
    ////////////////////////////////////////////////////////////////

});