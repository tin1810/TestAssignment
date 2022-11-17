import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/model/shop_model.dart';
import 'package:test_assignment/utils/constant.dart';
import 'package:test_assignment/view/category2_screen.dart';
import 'package:test_assignment/view/category_screen.dart';

Widget shopListWidget(
    ShopController shopController, int index, ShopModel? tempShop) {
  return InkWell(
    onTap: () {
      if (tempShop?.id == 0) {
        Get.to(const CategoryScreen());
      } else if (tempShop?.id == 1) {
        Get.to(const Category1Screen());
      }
    },
    child: Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      width: 230,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: backgroundColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            shopController.shop[index].shopName.toString(),
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.w500, color: Colors.green),
          ),
          Text(
            shopController.shop[index].shopAddress.toString(),
            style: TextStyle(fontSize: 18, color: Colors.pink),
          ),
          Text(shopController.shop[index].openingTime.toString()),
        ],
      ),
    ),
  );
}
