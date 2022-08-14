import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/widgets/select_game_widget.dart';

import '../models/get_lottie.dart';

class SelectGameScreen extends StatefulWidget {
  const SelectGameScreen({Key? key}) : super(key: key);

  @override
  State<SelectGameScreen> createState() => _SelectGameScreenState();
}

class _SelectGameScreenState extends State<SelectGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: const Color(0x0ffedffe),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              GetLottie.get("user_reviews"),
              height: 250,
            ),
            selectGameWidget(
                context,
                "Single Player",
                () => Navigator.pushNamed(context, "/game", arguments: {
                      "multiplayer": false,
                    }),
                "single"),
            selectGameWidget(
                context,
                "Multi Player",
                () => Navigator.pushNamed(context, "/game",
                    arguments: {"multiplayer": true}),
                "multiple"),
          ],
        ),
      ),
    );
  }
}
