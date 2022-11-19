// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/model/product_model.dart';
import 'package:test_assignment/model/shop_model.dart';
import 'package:test_assignment/utils/constant.dart';
import 'package:test_assignment/widget/titleText_widget.dart';

class SearchScreen extends GetView<ShopController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopController = Get.put(ShopController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: TextField(
          textInputAction: TextInputAction.search,
          onChanged: (value) {
            if (value.isNum) {
              shopController.filterProductwithCode(value);
            } else {
              shopController.filterProduct(value);
            }
          },
          autofocus: true,
          decoration: InputDecoration(
              suffixIcon: Icon(
            Icons.search,
            color: Colors.black,
          )),
        ),
      ),
      body: FutureBuilder<List<ProductModel>>(
          future: shopController.loadProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              shopController.product = snapshot.data as List<ProductModel>;

              return Column(
                children: [
                  Flexible(
                    child: Obx(() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: shopController.foundProducts.value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                            ),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: backgroundColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(shopController
                                    .foundProducts.value[index].image
                                    .toString()),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    productName(
                                      shopController
                                          .foundProducts.value[index].name
                                          .toString(),
                                    ),
                                    price(
                                      shopController
                                          .foundProducts.value[index].price
                                          .toString(),
                                    ),
                                    productCode(
                                      shopController
                                          .foundProducts.value[index].code
                                          .toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        })),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
