import 'package:flutter/material.dart';

Widget myElevatedButton(
    BuildContext context, String text, void Function() onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    onPressed: onPressed,
    child: Text(
      text,
      style:
          Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black),
    ),
  );
}
