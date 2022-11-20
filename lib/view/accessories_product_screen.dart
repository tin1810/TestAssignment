// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/model/product_model.dart';
import 'package:test_assignment/utils/constant.dart';

import 'package:test_assignment/widget/titleText_widget.dart';

import 'search_screen.dart';

class AccessoriesProductScreen extends StatefulWidget {
  const AccessoriesProductScreen({super.key});

  @override
  State<AccessoriesProductScreen> createState() =>
      _AccessoriesProductScreenState();
}

class _AccessoriesProductScreenState extends State<AccessoriesProductScreen> {
  @override
  Widget build(BuildContext context) {
    final shopController = Get.put(ShopController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Acces's Product List",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(SearchScreen());
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
          future: shopController.loadAccessories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              shopController.accessories = snapshot.data as List<ProductModel>;

              return Column(
                children: [
                  ListTile(
                    leading: IconButton(
                        onPressed: () {
                          setState(() {
                            shopController.issortPrice.value =
                                !shopController.issortPrice.value;
                            shopController.sortPriceList(snapshot.data!);
                          });
                          // snapshot.data!
                          //     .sort((a, b) => a.price!.compareTo(b.price!));
                        },
                        icon: const Icon(
                          Icons.money,
                          color: Colors.black,
                        )),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            shopController.issortProduct.value =
                                !shopController.issortProduct.value;
                            shopController.sortProductList(snapshot.data!);
                          });

                          // snapshot.data!
                          //     .sort((a, b) => a.name!.compareTo(b.name!));
                        },
                        icon: const Icon(
                          Icons.sort,
                          color: Colors.black,
                        )),
                  ),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                  Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        reverse: shopController.issortProduct.value,
                        itemCount: shopController.accessories.length,
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
                                    .accessories[index].image
                                    .toString()),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    productName(
                                      shopController.accessories[index].name
                                          .toString(),
                                    ),
                                    price(
                                      shopController.accessories[index].price
                                          .toString(),
                                    ),
                                    productCode(
                                      shopController.accessories[index].code
                                          .toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  )
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
