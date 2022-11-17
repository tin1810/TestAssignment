import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/model/shop_model.dart';
import 'package:test_assignment/utils/constant.dart';

import 'package:test_assignment/view/accessories_product_screen.dart';
import 'package:test_assignment/view/man_product_screen.dart';
import 'package:test_assignment/view/woman_product_screen.dart';
import 'package:test_assignment/widget/category2Widget.dart';
import 'package:test_assignment/widget/category_widget.dart';

class Category1Screen extends StatelessWidget {
  const Category1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Category? tempCat;
    final shopController = Get.put(ShopController());
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Mango's Category",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<ShopModel>>(
          future: shopController.loadShop(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              shopController.shop = snapshot.data as List<ShopModel>;

              return Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: shopController.shop[0].category!.length,
                    itemBuilder: (context, index) {
                      return Category2Widget(index,
                          tempCat = shopController.shop[1].category![index]);
                    }),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
