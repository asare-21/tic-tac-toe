import 'package:flutter/material.dart';

Widget myElevatedButton(
    BuildContext context, String text, void Function() onPressed,
    {double elevation = 1.0, double width = 0, double height = 0}) {
  return SizedBox(
    width: width == 0 ? double.infinity : width,
    height: height == 0 ? 0 : height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: elevation,
          primary: Colors.white,
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.black),
      ),
    ),
  );
}
