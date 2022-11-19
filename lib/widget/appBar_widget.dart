// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/auth_controller.dart';
import 'package:test_assignment/utils/constant.dart';
import 'package:test_assignment/view/profile_screen.dart';

Widget appBar(String email) {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0,
    flexibleSpace: Container(
      padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
            InkWell(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  "assets/icons/avatar.png",
                ),
                maxRadius: 18,
              ),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome $email",
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
