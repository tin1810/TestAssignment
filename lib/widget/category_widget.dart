import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_assignment/utils/constant.dart';

Widget categoryWidget(String? text) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
    height: 150,
    width: 150,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: backgroundColor)),
    child: Column(
      children: [
        Image.asset(
          "assets/icons/avatar.png",
          fit: BoxFit.cover,
          height: 100,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text!,
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}
