import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/home_page.dart';
import 'package:tic_tac_toe/screens/game_page.dart';
import 'package:tic_tac_toe/screens/select_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTacToe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xffedffe9),
        appBarTheme: const AppBarTheme(
          color: Color(0xffedffe9),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePageScreen(),
        "/select-game": (context) => const SelectGameScreen(),
        "/game": (context) => const GameScreen(),
      },
    );
  }
}
