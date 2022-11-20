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
                          });
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
                          });
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
                  shopController.issortProduct.value == true
                      ? watch(shopController)
                      : shopController.issortPrice.value == true
                          ? watch1(shopController)
                          : watchNew(shopController),
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

  Widget watch(ShopController shopController) {
    return Flexible(
      child: ListView.builder(
          // shrinkWrap: true,
          itemCount: shopController.watch.length,
          reverse: shopController.issortProduct.value,
          itemBuilder: (context, index) {
            final sortedItems = shopController.watch.sort((item1, item2) =>
                shopController.issortProduct.value
                    ? item1.name.toString().compareTo(item2.name.toString())
                    : item2.name.toString().compareTo(item1.name.toString()));
            final item = sortedItems;
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
                  Image.asset(shopController.watch[index].image.toString()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      productName(
                        shopController.watch[index].name.toString(),
                      ),
                      price(
                        shopController.watch[index].price.toString(),
                      ),
                      productCode(
                        shopController.watch[index].code.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget watch1(ShopController shopController) {
    return Flexible(
      child: ListView.builder(
          // shrinkWrap: true,
          itemCount: shopController.watch.length,
          itemBuilder: (context, index) {
            final sortedItems1 = shopController.watch.sort((items1, items2) =>
                shopController.issortPrice.value
                    ? items1.price.toString().compareTo(items2.price.toString())
                    : items2.price
                        .toString()
                        .compareTo(items1.price.toString()));
            final items = sortedItems1;
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
                  Image.asset(shopController.watch[index].image.toString()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      productName(
                        shopController.watch[index].name.toString(),
                      ),
                      price(
                        shopController.watch[index].price.toString(),
                      ),
                      productCode(
                        shopController.watch[index].code.toString(),
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
    );
  }

  Widget watchNew(ShopController shopController) {
    return Flexible(
      child: ListView.builder(
          // shrinkWrap: true,
          itemCount: shopController.watch.length,
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
                  Image.asset(shopController.watch[index].image.toString()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      productName(
                        shopController.watch[index].name.toString(),
                      ),
                      price(
                        shopController.watch[index].price.toString(),
                      ),
                      productCode(
                        shopController.watch[index].code.toString(),
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
    );
  }
}
