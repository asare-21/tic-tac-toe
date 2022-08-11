import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundMusicProvider with ChangeNotifier {
  final _player = AudioPlayer();

  Future<bool?> playing() async {
    AudioCache cache = AudioCache(prefix: "assets/audio/");
    final url = await cache.load("bg.mp3");

    // await _player.setSourceUrl(url.path);
    await _player.play(
      AssetSource(url.path),
    );

    notifyListeners();
    return false;
  }

  Future<bool> get getMuted async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
    return prefs.getBool('muted') ?? false;
  }

  Future<bool> mute() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool muted = prefs.getBool("muted") ?? false;
      if (!muted) {
        await _player.play(DeviceFileSource('assets/audio/bg.mp3'));

        bool hasMuted = await prefs.setBool("muted", !muted);
        notifyListeners();
        return hasMuted;
      }
      bool hasMuted = await prefs.setBool("muted", !muted);
      await _player.stop(); // will resume from beginning
      notifyListeners();
      return hasMuted;
    } catch (e) {
      rethrow;
    }
  }
}
