// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/auth_controller.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/model/shop_model.dart';
import 'package:test_assignment/utils/constant.dart';

import 'package:test_assignment/view/category_screen.dart';

import 'package:test_assignment/widget/appBar_widget.dart';
import 'package:test_assignment/widget/shoplist_widget.dart';
import 'package:test_assignment/widget/titleText_widget.dart';

class HomeScreen extends GetView<ShopController> {
  String email;
  HomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final shopController = Get.put(ShopController());
    ShopModel? tempShop;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(165), child: appBar(email)),
        body: FutureBuilder<List<ShopModel>>(
            future: shopController.loadShop(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                shopController.shop = snapshot.data as List<ShopModel>;
                var list = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 30, bottom: 20),
                      child: titleTextWidget("Avaliable Shops"),
                    ),

                    SizedBox(
                        height: 200,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: shopController.shop.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(CategoryScreen());
                                },
                                child: shopListWidget(shopController, index,
                                    tempShop = shopController.shop[index]),
                              );
                            })),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              AuthController.instance.logOut();
                            },
                            icon: const Icon(Icons.logout)),
                        const Text("Logout"),
                      ],
                    )
                    // shopListWidget(shopController, list, tempShop)
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
