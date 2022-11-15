import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_assignment/utils/constant.dart';
import 'package:test_assignment/widget/category_widget.dart';
import 'package:test_assignment/widget/titleText_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Shop's Category",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              categoryWidget("Bag"),
              categoryWidget("Dress"),
            ],
          ),
          categoryWidget("Hat"),
        ],
      ),
    );
  }
}
