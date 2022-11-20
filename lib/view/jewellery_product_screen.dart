// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/model/jewellery_model.dart';
import 'package:test_assignment/model/product_model.dart';
import 'package:test_assignment/model/shop_model.dart';
import 'package:test_assignment/utils/constant.dart';
import 'package:test_assignment/view/search_screen.dart';
import 'package:test_assignment/widget/filter_widget.dart';
import 'package:test_assignment/widget/titleText_widget.dart';

class JewelleryProductScreen extends StatefulWidget {
  const JewelleryProductScreen({super.key});

  @override
  State<JewelleryProductScreen> createState() => _JewelleryProductScreenState();
}

class _JewelleryProductScreenState extends State<JewelleryProductScreen> {
  @override
  Widget build(BuildContext context) {
    final shopController = Get.put(ShopController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Jewellery's Product List",
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
          future: shopController.loadJewellery(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              shopController.jewellery = snapshot.data as List<ProductModel>;

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
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                  Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        reverse: shopController.issortProduct.value,
                        itemCount: shopController.jewellery.length,
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
                                    .jewellery[index].image
                                    .toString()),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    productName(
                                      shopController.jewellery[index].name
                                          .toString(),
                                    ),
                                    price(
                                      shopController.jewellery[index].price
                                          .toString(),
                                    ),
                                    productCode(
                                      shopController.jewellery[index].code
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
