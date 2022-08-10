import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/models/get_lottie.dart';
import 'package:tic_tac_toe/widgets/elevated_button.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            LottieBuilder.asset(GetLottie.get("welcome"),
                alignment: Alignment.topCenter),
            Positioned(
                bottom: 200,
                child: myElevatedButton(context, "Let's play",
                    () => Navigator.pushNamed(context, "/select-game")))
          ],
        ),
      ),
    );
  }
}
