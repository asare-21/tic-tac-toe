import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/widgets/select_game_widget.dart';

class SelectGameScreen extends StatefulWidget {
  const SelectGameScreen({Key? key}) : super(key: key);

  @override
  State<SelectGameScreen> createState() => _SelectGameScreenState();
}

class _SelectGameScreenState extends State<SelectGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.network(
              "https://assets1.lottiefiles.com/packages/lf20_njobaah2.json",
              height: 250,
            ),
            selectGameWidget(
                context,
                "Single Player",
                () => Navigator.pushNamed(context, "/game"),
                "https://assets8.lottiefiles.com/packages/lf20_cl7cds1u.json"),
            selectGameWidget(
                context,
                "Multi Player",
                () => Navigator.pushNamed(context, "/game"),
                "https://assets9.lottiefiles.com/datafiles/8yvoinR27PpzCUE/data.json"),
          ],
        ),
      ),
    );
  }
}
