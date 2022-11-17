// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/shop_controller.dart';

Widget filterWidget() {
  final shopController = Get.put(ShopController());
  return SizedBox(
    height: 250,
    child: Center(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.new_label),
            title: Text(
              "Latest Item",
              style: TextStyle(fontSize: 18),
            ),
            // trailing: Checkbox(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30)),
            //     // value: shopController.isSelected.value,
            //     onChanged: (value) {}),
          ),
          ListTile(
            leading: Icon(Icons.money_off),
            title: Text(
              "Low Price",
              style: TextStyle(fontSize: 18),
            ),
            trailing: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                value: true,
                onChanged: (value) {}),
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text(
              "High Price",
              style: TextStyle(fontSize: 18),
            ),
            trailing: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                value: true,
                onChanged: (value) {}),
          ),
        ],
      ),
    ),
  );
}
