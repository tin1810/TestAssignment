// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/model/product_model.dart';
import 'package:test_assignment/model/shop_model.dart';
import 'package:test_assignment/utils/constant.dart';
import 'package:test_assignment/view/search_screen.dart';
import 'package:test_assignment/widget/titleText_widget.dart';

class WatchProductScreen extends StatefulWidget {
  const WatchProductScreen({super.key});

  @override
  State<WatchProductScreen> createState() => _WatchProductScreenState();
}

class _WatchProductScreenState extends State<WatchProductScreen> {
  @override
  Widget build(BuildContext context) {
    final shopController = Get.put(ShopController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Watch's Product List",
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
          future: shopController.loadWatch(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              shopController.watch = snapshot.data as List<ProductModel>;

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
                          // shopController.sortProductList(snapshot.data!);
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
                          // shopController.sortProductList(snapshot.data!);
                          // shopController.issortProduct
                          // snapshot.data!
                          //     .sort((a, b) => a.name!.compareTo(b.name!));
                        },
                        icon: const Icon(
                          Icons.sort,
                          color: Colors.black,
                        )),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     // Padding(
                  //     //   padding: const EdgeInsets.only(
                  //     //       top: 20, bottom: 10, left: 15),
                  //     //   child: titleTextWidget("Watch's Product Lists"),
                  //     // ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(top: 10),
                  //       child: IconButton(
                  //           onPressed: () {
                  //             snapshot.data!
                  //                 .sort((a, b) => a.price!.compareTo(b.price!));
                  //           },
                  //           icon: const Icon(Icons.upcoming)),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(top: 10),
                  //       child: IconButton(
                  //           onPressed: () {
                  //             snapshot.data!
                  //                 .sort((a, b) => a.name!.compareTo(b.name!));
                  //           },
                  //           icon: const Icon(Icons.list)),
                  //     )
                  //   ],
                  // ),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                  Flexible(
                    child: ListView.builder(
                        // shrinkWrap: true,
                        itemCount: shopController.watch.length,
                        // itemCount: shopController
                        //     .shop[1].category![1].productName!.length,
                        reverse: shopController.issortProduct.value,
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
                                Image.asset(shopController.watch[index].image
                                    .toString()),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    productName(
                                      shopController.watch[index].name
                                          .toString(),
                                    ),
                                    price(
                                      shopController.watch[index].price
                                          .toString(),
                                    ),
                                    productCode(
                                      shopController.watch[index].code
                                          .toString(),
                                    ),
                                  ],
                                ),
                                // Image.asset(shopController.shop[1].category![1]
                                //     .productName![index].image
                                //     .toString()),
                                // Text(shopController.shop[1].category![1]
                                //     .productName![index].name
                                //     .toString()),
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
