import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/helpers/constants.dart';

class UserProvider with ChangeNotifier {
  Future<bool> checkUsernameAvailability(String username) async {
    Response response =
        await Dio().get("$baseUrl/users/check?username=$username");
    return response.data;
  }

  Future<bool> createAccount(
      {required String username, required String password}) async {
    Response response = await Dio().post(baseUrl, data: {
      'username': username,
      'password': password,
    });
    return response.data['success'];
  }

  // Future resetPassword(){}
}
