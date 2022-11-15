
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


Widget mailWidget(logincontroller) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 5),
        hintText: "UserName",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.blue,
        ),
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
