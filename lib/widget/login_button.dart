// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget loginButton(Color? color, String? title) {
  return Container(
    height: 55,
    width: double.infinity,
    margin: EdgeInsets.only(right: 30, left: 30, top: 20),
    padding: EdgeInsets.only(top: 15),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      title.toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.black54, fontSize: 17.8, fontWeight: FontWeight.w500),
    ),
  );
}
