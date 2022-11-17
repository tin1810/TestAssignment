 import 'package:flutter/material.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/utils/constant.dart';

Widget shopListWidget(ShopController shopController, int index) {
    return Container(
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
    );
  }