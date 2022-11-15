import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_assignment/utils/constant.dart';

Widget shopListWidget() {
  return SizedBox(
    height: 120,
    child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            width: 200,
            decoration: const BoxDecoration(color: backgroundColor),
          );
        }),
  );
}
