// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/shop_controller.dart';
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
                      ? jewellery(shopController)
                      : shopController.issortPrice.value == true
                          ? jewellery1(shopController)
                          : jewelleryNew(shopController),
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

  Widget jewelleryNew(ShopController shopController) {
    return Flexible(
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
                  Image.asset(shopController.jewellery[index].image.toString()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      productName(
                        shopController.jewellery[index].name.toString(),
                      ),
                      price(
                        shopController.jewellery[index].price.toString(),
                      ),
                      productCode(
                        shopController.jewellery[index].code.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget jewellery1(ShopController shopController) {
    return Flexible(
      child: ListView.builder(
          shrinkWrap: true,
          reverse: shopController.issortProduct.value,
          itemCount: shopController.jewellery.length,
          itemBuilder: (context, index) {
            final sortedItems1 = shopController.jewellery.sort(
                (items1, items2) => shopController.issortPrice.value
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
                  Image.asset(shopController.jewellery[index].image.toString()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      productName(
                        shopController.jewellery[index].name.toString(),
                      ),
                      price(
                        shopController.jewellery[index].price.toString(),
                      ),
                      productCode(
                        shopController.jewellery[index].code.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget jewellery(ShopController shopController) {
    return Flexible(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: shopController.jewellery.length,
          itemBuilder: (context, index) {
            final sortedItems = shopController.jewellery.sort((item1, item2) =>
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
                  Image.asset(shopController.jewellery[index].image.toString()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      productName(
                        shopController.jewellery[index].name.toString(),
                      ),
                      price(
                        shopController.jewellery[index].price.toString(),
                      ),
                      productCode(
                        shopController.jewellery[index].code.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
