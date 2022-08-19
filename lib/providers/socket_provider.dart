import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../helpers/constants.dart';

class SocketProvider with ChangeNotifier {
  late IO.Socket socket;

  void initSocket(BuildContext context) {
    // Initiale sockets
    socket = IO.io(
        wssBaseUrl,
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            // .disableAutoConnect() // disable auto-connection
            // .setExtraHeaders({'foo': 'bar'}) // optional
            .setAuth({"username": "John", "password": "Doe"}) // optional
            .build());
    socket.onConnect((_) {
      debugPrint("Socket connected - $_");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Socket connected successfully")));
    });
    socket.onDisconnect((_) {
      debugPrint('Socket disconnected - $_');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Socket disconnected "),
        backgroundColor: Colors.red,
      ));
    });
  }

  void joinRoom(String roomId) {
    // Join room
    socket.emit("new-room", roomId);
  }

  void leaveRoom(String roomId) {
    // Leave room
    socket.emit("leave-room", roomId);
  }
}
