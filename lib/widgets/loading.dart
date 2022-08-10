import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/models/get_lottie.dart';

void loading(BuildContext context) {
  AwesomeDialog(
          context: context,
          headerAnimationLoop: false,
          dismissOnTouchOutside: false,
          dismissOnBackKeyPress: false,
          dialogType: DialogType.NO_HEADER,
          customHeader: LottieBuilder.asset(
            GetLottie.get("loading"),
            alignment: Alignment.topCenter,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Loading...",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          autoDismiss: true,
          autoHide: const Duration(seconds: 3))
      .show();
}
