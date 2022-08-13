import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/models/get_lottie.dart';
import 'package:tic_tac_toe/providers/background_music_provider.dart';
import 'package:tic_tac_toe/widgets/elevated_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  late TextEditingController username, password, confimPassword;
  final _formKey = GlobalKey<FormState>();

  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Color(0xffedf6f9)));

  OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Color(0xfffca311)));
  Color cursorColor = const Color(0xfffca311);
  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    confimPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    Provider.of<BackgroundMusicProvider>(context, listen: false).mute();
    super.dispose();
  }

  void showDialogLoading() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Please wait..."),
              content: LottieBuilder.asset(
                GetLottie.get('loading'),
                height: 80,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: username,
              cursorColor: cursorColor,
              autofocus: true,
              onFieldSubmitted: (value) {
                showDialogLoading();
              },
              onEditingComplete: () {
                showDialogLoading();
              },
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                  hintText: "Username",
                  border: border,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: myElevatedButton(context, 'Check', () {},
                        elevation: 0, width: 80),
                  ),
                  focusedBorder: focusedBorder),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: password,
              cursorColor: cursorColor,
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Password",
                  border: border,
                  focusedBorder: focusedBorder),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: confimPassword,
              obscureText: true,
              cursorColor: cursorColor,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                } else if (password.text != confimPassword.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: border,
                  focusedBorder: focusedBorder),
            ),
            const SizedBox(
              height: 20,
            ),
            myElevatedButton(context, "Create My Account", () {},
                height: 40, width: 150)
          ],
        ),
      ),
    );
  }
}
