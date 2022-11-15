import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_assignment/view/category/screen/category_screen.dart';
import 'package:test_assignment/widget/appBar_widget.dart';
import 'package:test_assignment/widget/shoplist_widget.dart';
import 'package:test_assignment/widget/titleText_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(165), child: appBar()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30, bottom: 10),
            child: titleTextWidget("Avaliable Shops"),
          ),
          InkWell(
              onTap: () {
                Get.to(CategoryScreen());
              },
              child: shopListWidget()),
        ],
      ),
    );
  }
}
