import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_assignment/controller/auth_controller.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/utils/constant.dart';

import 'package:test_assignment/view/home_screen.dart';
import 'package:test_assignment/view/register_screen.dart';
import 'package:test_assignment/widget/login_button.dart';
import 'package:test_assignment/widget/login_widget.dart';
import 'package:test_assignment/widget/mail_textfield_widget.dart';
import 'package:test_assignment/widget/password_textfield_widget.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
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
              mailWidget(authController, emailController),
              passwordWidget(authController, passwordController),
              InkWell(
                  onTap: () {
                    AuthController.instance.login(emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: loginButton(backgroundColor, "Login")),
              InkWell(
                  onTap: () {
                    Get.to(RegisterScreen());
                  },
                  child: loginButton(backgroundColor, "Register")),
            ],
          ),
        )),
      ),
    );
  }
}
