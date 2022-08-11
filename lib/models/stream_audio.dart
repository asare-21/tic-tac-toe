import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mic_stream/mic_stream.dart';

class StreamAudio with ChangeNotifier {
  late Stream<List<int>> stream = microphone(sampleRate: 44100);
  late StreamSubscription listener;
  Stream streamMicrophone() async* {
    PermissionStatus permission = await Permission.microphone.status;
    if (permission != PermissionStatus.granted) {
      await Permission.microphone.request();
      yield null;
    }
    listener = stream.listen((event) {
      debugPrint(event.toString());
    });
  }

  void stopStream() {
    // stream.cancel();
    listener.cancel();
  }
}
