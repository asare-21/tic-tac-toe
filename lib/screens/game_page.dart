import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/models/get_lottie.dart';
import 'package:tic_tac_toe/widgets/audio_widget.dart';
import 'package:tic_tac_toe/widgets/room_selection_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.animateTo(39.8,
          duration: const Duration(seconds: 1), curve: Curves.linearToEaseOut);
      final Map<String, dynamic> args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      if (args['multiplayer']) {
        selectRoom(context);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void selectRoom(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        context: context,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: roomBottomModalSheet(context, mounted),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LottieBuilder.asset(
                                  GetLottie.get("player1"),
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ))),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LottieBuilder.asset(
                                  GetLottie.get("happy-boy"),
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width - 25,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      itemCount: 9,
                      controller: _scrollController,
                      padding: const EdgeInsets.all(5),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1, crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Center(
                            child: LottieBuilder.asset(
                                GetLottie.get(index % 2 == 0 ? "x" : "o"),
                                repeat: false),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              audioCard(context)
            ],
          ),
        ),
      ),
    );
  }
}
