import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/models/get_lottie.dart';

import '../providers/background_music_provider.dart';
import '../widgets/create_account_widget.dart';
import '../widgets/signin_widget.dart';

class SignInOrCreate extends StatefulWidget {
  const SignInOrCreate({Key? key}) : super(key: key);

  @override
  State<SignInOrCreate> createState() => _SignInOrCreateState();
}

class _SignInOrCreateState extends State<SignInOrCreate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              LottieBuilder.asset(
                GetLottie.get('auth'),
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "tx3 Auth",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: "Sign In",
                  ),
                  Tab(
                    text: "Create Account",
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TabBarView(children: [
                    SignIn(),
                    CreateAccount(),
                  ]),
                ),
              ),
              Consumer<BackgroundMusicProvider>(
                builder: (context, provider, child) {
                  return CircleAvatar(
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
                  );
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
