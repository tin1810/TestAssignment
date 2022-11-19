import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget titleTextWidget(String? text) {
  return Text(
    text!,
    style: const TextStyle(
        fontSize: 17, fontWeight: FontWeight.w500, color: Colors.blue),
  );
}

Widget productName(String? name) {
  return Text(
    name.toString(),
    style: TextStyle(fontSize: 18),
  );
}

Widget price(String? price) {
  return Text(
    price.toString(),
    style: TextStyle(color: Colors.red, fontSize: 16),
  );
}

Widget productCode(String? code) {
  return Row(
    children: [
      Text("code:"),
      Text(
        code.toString(),
        style: TextStyle(color: Colors.blue),
      ),
    ],
  );
}
