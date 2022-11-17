// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_assignment/model/product_model.dart';
import 'package:test_assignment/model/shop_model.dart';
import 'package:test_assignment/widget/filter_widget.dart';

class ShopController extends GetxController {
  List<ShopModel> shop = <ShopModel>[].obs;
  List<ProductModel> product = <ProductModel>[].obs;
  Rx<List<dynamic>> foundProducts = Rx<List<dynamic>>([]);

  Rx<bool> isSort1 = false.obs;
  Rx<bool> isSort2 = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Map<String, dynamic> args = Get.arguments;
    // categoryId.value = args['id'];
    loadShop();
    foundProducts.value = product.cast<Map<String, dynamic>>();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // void loadDetailInfos(int categoryId) {
  //   categoryList;
  // }
  Future<List<ShopModel>> loadShop() async {
    final jsonData = await rootBundle.loadString("assets/json/shop.json");
    final shopList = json.decode(jsonData) as List<dynamic>;
    print(shopList);
    return shopList.map((e) => ShopModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> loadProduct() async {
    final jsonData = await rootBundle.loadString("assets/json/product.json");
    final productList = json.decode(jsonData) as List<dynamic>;
    print(productList);
    return productList.map((e) => ProductModel.fromJson(e)).toList();
  }

  void filterProduct(String products) {
    List<dynamic> results = [];

    if (products.isEmpty) {
      results = product;
    } else {
      results = product
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(products.toLowerCase()))
          .toList();
    }
    foundProducts.value = results;
  }

  void filterProductwithCode(String products) {
    List<dynamic> results = [];

    if (products.isEmpty) {
      results = product;
    } else {
      results = product
          .where((element) => element.code
              .toString()
              .toLowerCase()
              .contains(products.toLowerCase()))
          .toList();
    }
    foundProducts.value = results;
  }

  void sort1(List list) {
    list.sort((a, b) => isSort1.value ? a.compareTo(b) : b.compareTo(a));
    isSort1.value == true;
  }

  void sort2(List list) {
    list.sort((a, b) => isSort2.value ? a.compareTo(b) : b.compareTo(a));
    isSort2.value == true;
  }

  Future<dynamic> bottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return filterWidget();
      },
    );
  }
}
