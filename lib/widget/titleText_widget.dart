import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget titleTextWidget(String? text) {
  return Text(
    text!,
    style: const TextStyle(
        fontSize: 17, fontWeight: FontWeight.w500, color: Colors.blue),
  );
}
