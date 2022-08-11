import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/models/get_lottie.dart';
import 'package:tic_tac_toe/widgets/elevated_button.dart';

import '../providers/background_music_provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<BackgroundMusicProvider>(context, listen: false)
          .playing();
    });
    super.initState();
  }

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
                    () => Navigator.pushNamed(context, "/select-game"))),
            ChangeNotifierProvider(
              create: (context) => BackgroundMusicProvider(),
              child: Consumer<BackgroundMusicProvider>(
                builder: (context, provider, child) {
                  return Positioned(
                    bottom: 150,
                    child: CircleAvatar(
                      child: IconButton(
                        icon: FutureBuilder<bool>(
                            future: provider.getMuted,
                            builder: (context, snapshot) {
                              bool muted = snapshot.data ?? false;
                              return Icon(
                                !muted ? Icons.volume_off : Icons.speaker,
                                color: Colors.white,
                              );
                            }),
                        onPressed: () =>
                            context.read<BackgroundMusicProvider>().mute(),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
