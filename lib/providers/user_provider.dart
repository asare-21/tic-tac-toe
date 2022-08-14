import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/helpers/constants.dart';
import 'package:tic_tac_toe/models/user_model.dart';

class UserProvider with ChangeNotifier {
  late SharedPreferences prefs;
  late UserModel user;

  Future<bool> checkUsernameAvailability(String username) async {
    try {
      prefs = await SharedPreferences.getInstance();
      Response response = await Dio().get(
          "$checkUrl/$username"); // Use ws://localhost:3000 for testing and wss:// for production
      return response.data['user']['exists'];
    } catch (e) {
      debugPrint("Username search error: $e");
      return false;
    }
  }

  Future<bool> createAccount(
      {required String username, required String password}) async {
    try {
      prefs = await SharedPreferences.getInstance();
      //
      Response response = await Dio().post(createUrl, data: {
        'username': username,
        'password': password,
      });
      return response.data['success'];
    } catch (e) {
      debugPrint("Account creating error: $e");
      return false;
    }
  }

  Future<bool> signIn(
      {required String username, required String password}) async {
    try {
      prefs = await SharedPreferences.getInstance();
      //
      Response response = await Dio().post(signUrl, data: {
        'username': username,
        'password': password,
      });

      String uid = response.data['user']['_id'];
      String serverUsername = response.data['user']['username'];

      prefs.setBool("auth", true); // true
      prefs.setString("uid", uid); // User uid returned from server
      // save user in user variable
      user = UserModel(
        uid: uid,
        username: serverUsername, // Username returned from server
      );
      if (response.data['success']) {
        Map<String, dynamic> userData = response.data['user'];
        return true;
      }
      return false;
    } catch (e) {
      debugPrint("Sign in error: $e");
      return false;
    }
  }

  Future logout() async {
    try {
      prefs = await SharedPreferences.getInstance();
      prefs.setBool("auth", false);
      prefs.setString("uid", "");
    } catch (e) {
      debugPrint("Logout error: $e");
      rethrow;
    }
  }
  // Future resetPassword(){}
}
