import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controller/shop_controller.dart';
import 'package:test_assignment/model/product_model.dart';
import 'package:test_assignment/utils/constant.dart';
import 'package:test_assignment/view/search_screen.dart';
import 'package:test_assignment/widget/titleText_widget.dart';

class ShoeProductScreen extends StatefulWidget {
  const ShoeProductScreen({super.key});

  @override
  State<ShoeProductScreen> createState() => _ShoeProductScreenState();
}

class _ShoeProductScreenState extends State<ShoeProductScreen> {
  @override
  Widget build(BuildContext context) {
    final shopController = Get.put(ShopController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Shoe's Product List",
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
          future: shopController.loadShoe(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              shopController.shoe = snapshot.data as List<ProductModel>;

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

                  // shopController.issortProduct.value == true? 
                  shop(shopController),
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

  Widget shop(ShopController shopController) {
    return Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      reverse: shopController.issortProduct.value  ,
                      itemCount: shopController.shoe.length,
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
                              Image.asset(shopController.shoe[index].image
                                  .toString()),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  productName(
                                    shopController.shoe[index].name
                                        .toString(),
                                  ),
                                  price(
                                    shopController.shoe[index].price
                                        .toString(),
                                  ),
                                  productCode(
                                    shopController.shoe[index].code
                                        .toString(),
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
