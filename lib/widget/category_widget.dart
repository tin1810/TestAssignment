// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_assignment/model/shop_model.dart';
import 'package:test_assignment/view/accessories_product_screen.dart';
import 'package:test_assignment/view/man_product_screen.dart';
import 'package:test_assignment/view/woman_product_screen.dart';

Widget CategoryWidget(int index, Category? tempCat) {
  return InkWell(
    onTap: () {
      if (tempCat.id == 0) {
        Get.to(const ManProductScreen());
      } else if (tempCat.id == 1) {
        Get.to(const WomanProductScreen());
      } else if (tempCat.id == 2) {
        Get.to(const AccessoriesProductScreen());
      }
    },
    child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
                height: 110, child: Image.asset(tempCat!.image.toString())),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                tempCat.categoryName.toString(),
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        )),
  );
}
