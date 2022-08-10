import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/loading.dart';

OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: Color(0xffedf6f9)));

OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: Color(0xfffca311)));

Widget roomBottomModalSheet(BuildContext context) {
  return Container(
      padding: const EdgeInsets.all(25),
      height: 300,
      child: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "Enter room name",
                border: border,
                focusedBorder: focusedBorder),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "Enter room password",
                border: border,
                focusedBorder: focusedBorder),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(15),
                primary: const Color(0xfffca311)),
            onPressed: () {
              Navigator.pop(context);
              if (FocusScope.of(context).hasFocus) {
                FocusScope.of(context).unfocus();
              }
              loading(context);
            },
            child: const SizedBox(
                width: 150,
                child: Text(
                  "Join room",
                  textAlign: TextAlign.center,
                )))
      ]));
}
