import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/get_lottie.dart';

Widget audioCard(BuildContext context) {
  return CircleAvatar(
    backgroundColor: const Color(0xffffffff),
    radius: 40,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: LottieBuilder.asset(GetLottie.get("waves"), height: 100),
    ),
  );
}
