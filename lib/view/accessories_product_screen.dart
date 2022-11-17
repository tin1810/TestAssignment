import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/model/shop_model.dart';
import 'package:test_assignment/utils/constant.dart';

import 'package:test_assignment/widget/titleText_widget.dart';

import 'search_screen.dart';

class AccessoriesProductScreen extends StatelessWidget {
  const AccessoriesProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopController = Get.put(ShopController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Product",
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
      body: FutureBuilder<List<ShopModel>>(
          future: shopController.loadShop(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              shopController.shop = snapshot.data as List<ShopModel>;

              return SingleChildScrollView(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 15),
                        child: titleTextWidget("Accessories's Product Lists"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.list)),
                      )
                    ],
                  ),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: shopController
                            .shop[0].category![2].productName!.length,
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
                            child: Text(shopController
                            .shop[0].category![2].productName![index].name
                                .toString()),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
