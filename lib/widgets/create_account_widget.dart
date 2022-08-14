import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/models/get_lottie.dart';
import 'package:tic_tac_toe/widgets/elevated_button.dart';

import '../providers/user_provider.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  late TextEditingController username, password, confimPassword;
  final _formKey = GlobalKey<FormState>();
  bool usernameAvailable = false;
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
              onChanged: (_) {
                setState(() {
                  usernameAvailable = false;
                });
              },
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
                    child: myElevatedButton(
                      context,
                      'Check',
                      () async {
                        if (username.text.isNotEmpty) {
                          bool response = await Provider.of<UserProvider>(
                                  context,
                                  listen: false)
                              .checkUsernameAvailability(username.text);
                          setState(() {
                            usernameAvailable = response;
                          });
                          if (!response && mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                  "Username ${username.text} is available"),
                            ));
                          } else if (response && mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Username ${username.text} is not available"),
                            ));
                          }
                        }
                      },
                      elevation: 0,
                      width: 80,
                    ),
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
                  hintText: "Confirm Password",
                  border: border,
                  focusedBorder: focusedBorder),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  "You need to check username availability before you can create an account",
                  style: TextStyle(color: Colors.red)),
            ),
            usernameAvailable
                ? myElevatedButton(context, "Create My Account", () async {
                    if (_formKey.currentState!.validate() &&
                        usernameAvailable) {
                      // If the form is valid, send details to server for authentication
                      bool response = await Provider.of<UserProvider>(context,
                              listen: false)
                          .createAccount(
                              username: username.text, password: password.text);
                      if (!response && mounted) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(seconds: 5),
                          content: Text("Account creation error"),
                        ));
                        return;
                      }
                    }
                  }, height: 40, width: 150)
                : Container()
          ],
        ),
      ),
    );
  }
}
