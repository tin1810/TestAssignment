// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_assignment/utils/constant.dart';

Widget appBar() {
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
              onTap: () {},
              child: const CircleAvatar(
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
            "Welcome to Our App",
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
          )
        ],
      ),
    ),
  );
}
