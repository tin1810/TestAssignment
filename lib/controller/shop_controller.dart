import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_assignment/model/shop_model.dart';

class ShopController extends GetxController {
  List<ShopModel> shop = <ShopModel>[].obs;
  Rx<bool> isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Map<String, dynamic> args = Get.arguments;
    // categoryId.value = args['id'];
    loadShop();
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
}
