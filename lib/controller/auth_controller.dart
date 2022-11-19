// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/utils/constant.dart';
import 'package:test_assignment/view/home_screen.dart';
import 'package:test_assignment/view/login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen(
            email: user.email!,
          ));
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: backgroundColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Create Account Failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(e.toString()));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "User message",
          backgroundColor: backgroundColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login Failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(e.toString()));
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
