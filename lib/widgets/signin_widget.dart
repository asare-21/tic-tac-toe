import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/widgets/elevated_button.dart';

import '../providers/background_music_provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Form key
  final _formKey = GlobalKey<FormState>();
  late TextEditingController username, password;
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
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    Provider.of<BackgroundMusicProvider>(context, listen: false).mute();

    super.dispose();
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Username",
                  border: border,
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
              height: 35,
            ),
            myElevatedButton(context, "Sign in", () {
              FocusScope.of(context).unfocus();
              if (_formKey.currentState!.validate()) {
                // If the form is valid, send details to server for authentication

              }
            }, height: 40, width: 150)
          ],
        ),
      ),
    );
  }
}
