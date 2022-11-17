import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_assignment/utils/constant.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: TextFormField(
          autofocus: true,
          decoration: InputDecoration(
              suffixIcon: Icon(
            Icons.search,
            color: Colors.black,
          )),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
              child: ListTile(
                tileColor: Colors.amber,
              ),
            );
          }),
    );
  }
}
