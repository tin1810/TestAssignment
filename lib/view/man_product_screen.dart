// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/model/product_model.dart';
import 'package:test_assignment/model/shop_model.dart';
import 'package:test_assignment/utils/constant.dart';

import 'package:test_assignment/view/search_screen.dart';

import 'package:test_assignment/widget/titleText_widget.dart';

class ManProductScreen extends StatefulWidget {
  const ManProductScreen({super.key});

  @override
  State<ManProductScreen> createState() => _ManProductScreenState();
}

class _ManProductScreenState extends State<ManProductScreen> {
  @override
  Widget build(BuildContext context) {
    final shopController = Get.put(ShopController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Man's Product List",
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
          future: shopController.loadMan(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              shopController.man = snapshot.data as List<ProductModel>;
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
                  manList(shopController),
// (foo==1)? something1():(foo==2)? something2(): something3();

                  // shopController.issortProduct.value == true
                  //     ? manList(shopController)
                  //     : shopController.issortPrice.value == true
                  //         ? manList1(shopController)
                  //         : manList2(shopController),
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

  Widget manList2(ShopController shopController) {
    return Flexible(
      child: ListView.builder(
          // reverse: shopController.issortProduct.value,
          shrinkWrap: true,
          itemCount: shopController.man.length,
          // itemCount: shopController
          //     .shop[0].category![0].productName!.length,
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
                  Image.asset(shopController.man[index].image.toString()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      productName(
                        shopController.man[index].name.toString(),
                      ),
                      price(
                        shopController.man[index].price.toString(),
                      ),
                      productCode(
                        shopController.man[index].code.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget manList(ShopController shopController) {
    return Flexible(
      child: ListView.builder(
          reverse: shopController.issortProduct.value,
          shrinkWrap: true,
          itemCount: shopController.man.length,
          // itemCount: shopController
          //     .shop[0].category![0].productName!.length,
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
                  Image.asset(shopController.man[index].image.toString()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      productName(
                        shopController.man[index].name.toString(),
                      ),
                      price(
                        shopController.man[index].price.toString(),
                      ),
                      productCode(
                        shopController.man[index].code.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget manList1(ShopController shopController) {
    return Flexible(
      child: ListView.builder(
          reverse: shopController.issortPrice.value,
          shrinkWrap: true,
          itemCount: shopController.man.length,
          // itemCount: shopController
          //     .shop[0].category![0].productName!.length,
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
                  Image.asset(shopController.man[index].image.toString()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      productName(
                        shopController.man[index].name.toString(),
                      ),
                      price(
                        shopController.man[index].price.toString(),
                      ),
                      productCode(
                        shopController.man[index].code.toString(),
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
