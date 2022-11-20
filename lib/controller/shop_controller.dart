// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_assignment/model/jewellery_model.dart';
import 'package:test_assignment/model/product_model.dart';
import 'package:test_assignment/model/shop_model.dart';
import 'package:test_assignment/widget/filter_widget.dart';

class ShopController extends GetxController {
  List<ShopModel> shop = <ShopModel>[].obs;
  List<ProductModel> product = <ProductModel>[].obs;
  List<ProductModel> watch = <ProductModel>[].obs;
  List<ProductModel> man = <ProductModel>[].obs;
  List<ProductModel> woman = <ProductModel>[].obs;
  List<ProductModel> accessories = <ProductModel>[].obs;
  List<ProductModel> jewellery = <ProductModel>[].obs;
  List<ProductModel> shoe = <ProductModel>[].obs;
  Rx<List<dynamic>> foundProducts = Rx<List<dynamic>>([]);

  Rx<bool> issortProduct = false.obs;
  Rx<bool> issortPrice = false.obs;

  @override
  void onInit() {
    // Map<String, dynamic> args = Get.arguments;
    // categoryId.value = args['id'];
    loadShop();
    loadProduct();
    loadWatch();
    foundProducts.value = product.cast<Map<String, dynamic>>();
    super.onInit();
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

  Future<List<ProductModel>> loadWatch() async {
    final jsonData = await rootBundle.loadString("assets/json/watch.json");
    final watchList = json.decode(jsonData) as List<dynamic>;
    print(watchList);
    return watchList.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> loadMan() async {
    issortProduct.value == true;
    issortPrice.value = true;

    final jsonData =
        await rootBundle.loadString("assets/json/man_product.json");
    final man = json.decode(jsonData) as List<dynamic>;
    print(man);
    return man.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> loadWoman() async {
    final jsonData = await rootBundle.loadString("assets/json/woman.json");
    final woman = json.decode(jsonData) as List<dynamic>;
    print(woman);
    return woman.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> loadAccessories() async {
    final jsonData =
        await rootBundle.loadString("assets/json/accessories.json");
    final accessories = json.decode(jsonData) as List<dynamic>;
    print(accessories);
    return accessories.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> loadJewellery() async {
    final jsonData =
        await rootBundle.loadString("assets/json/jewellery_product.json");
    final jewellery = json.decode(jsonData) as List<dynamic>;
    print(jewellery);
    return jewellery.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> loadShoe() async {
    final jsonData = await rootBundle.loadString("assets/json/shoe.json");
    final shoe = json.decode(jsonData) as List<dynamic>;
    print(shoe);
    return shoe.map((e) => ProductModel.fromJson(e)).toList();
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

  Future<List<ProductModel>> sortProduct() async {
    final jsonData = await rootBundle.loadString("assets/json/product.json");
    final productsortList = json.decode(jsonData) as List<dynamic>;
    print(productsortList);
    productsortList.sort((a, b) => b.compareTo(a));

    return productsortList.map((e) => ProductModel.fromJson(e)).toList();
  }

  // Future<List<JewelleryModel>> loadJewellery() async {
  //   final jsonData =
  //       await rootBundle.loadString("assets/json/jewellery_product.json");
  //   final jewelleryList = json.decode(jsonData) as List<dynamic>;
  //   print(jewelleryList);
  //   jewelleryList.sort((a, b) => b.compareTo(a));
  //   return jewelleryList.map((e) => JewelleryModel.fromJson(e)).toList();
  // }

  void sortProductList(List<ProductModel> list) {
    list.sort((a, b) => issortProduct.value
        ? a.name!.compareTo(b.toString())
        : b.name!.compareTo(a.toString()));
    issortProduct.value == true;
  }

  void sortPriceList(List<ProductModel> list) {
    list.sort((a, b) => issortPrice.value
        ? a.price!.compareTo(b.toString())
        : b.price!.compareTo(a.toString()));
    issortPrice.value == true;
  }
  // void sort2(List list) {
  //   list.sort((a, b) => isSort2.value ? a.compareTo(b) : b.compareTo(a));
  //   isSort2.value == true;
  // }

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
