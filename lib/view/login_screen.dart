import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_assignment/controller/login_controller.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/utils/constant.dart';

import 'package:test_assignment/view/home_screen.dart';
import 'package:test_assignment/widget/login_button.dart';
import 'package:test_assignment/widget/login_widget.dart';
import 'package:test_assignment/widget/mail_textfield_widget.dart';
import 'package:test_assignment/widget/password_textfield_widget.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: loginWidget(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              mailWidget(loginController),
              passwordWidget(loginController),
              InkWell(
                  onTap: () {
                    Get.offAll(HomeScreen());
                  },
                  child: loginButton(backgroundColor, "Login")),
            ],
          ),
        )),
      ),
    );
  }
}
