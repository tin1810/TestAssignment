import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_assignment/utils/constant.dart';

Widget loginWidget() {
  return Container(
    decoration: const BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.vertical(
        bottom: Radius.elliptical(190, 70),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: SvgPicture.asset("assets/images/login.svg"),
    ),
  );
}
