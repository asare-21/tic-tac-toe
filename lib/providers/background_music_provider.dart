import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundMusicProvider with ChangeNotifier {
  final _player = AudioPlayer();

  Future<bool?> playing() async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // bool muted = prefs.getBool("muted") ?? false;
      // print(!muted);
      // if (!muted) {
      //   _player.dispose();
      //   return muted;
      // }

      // AudioCache cache = AudioCache(prefix: "assets/audio/");
      // final url = await cache.load("bg.mp3");
      // await _player.play(AssetSource('audio/bg.mp3'));
      // await _player.setVolume(1);

      // notifyListeners();
      return false;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
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
      _player.dispose();
      if (!muted) {
        await _player.play(AssetSource('audio/bg.mp3'));

        bool hasMuted = await prefs.setBool("muted", !muted);
        notifyListeners();
        return hasMuted;
      }
      bool hasMuted = await prefs.setBool("muted", !muted);
      await _player.stop(); // will resume from beginning
      _player.dispose();
      notifyListeners();
      return hasMuted;
    } catch (e) {
      rethrow;
    }
  }
}
