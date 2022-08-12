import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/elevated_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: username,
            cursorColor: cursorColor,
            autofocus: true,
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
            decoration: InputDecoration(
                hintText: "Password",
                border: border,
                focusedBorder: focusedBorder),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: password,
            cursorColor: cursorColor,
            decoration: InputDecoration(
                labelText: "Confirm Password",
                border: border,
                focusedBorder: focusedBorder),
          ),
          const SizedBox(
            height: 20,
          ),
          myElevatedButton(context, "Create My Account", () {})
        ],
      ),
    );
  }
}
