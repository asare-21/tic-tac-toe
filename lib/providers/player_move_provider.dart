import 'package:flutter/material.dart';

class MoveProvider with ChangeNotifier {
  int _move = 0;
  int get move => _move;
  set move(int move) {
    _move = move;
    notifyListeners();
  }
}
