import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget selectGameWidget(BuildContext context, String text,
    void Function() onPressed, String lottieUrl) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: LottieBuilder.network(
                  lottieUrl,
                ),
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
