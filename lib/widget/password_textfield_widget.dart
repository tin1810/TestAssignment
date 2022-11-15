// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget passwordWidget(logincontroller) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 5),
        hintText: "Enter Password",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          Icons.key,
          color: Colors.blue,
        ),
        suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.visibility,
              color: Colors.grey.shade400,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black38)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue)),
      ),
    ),
  );
}
