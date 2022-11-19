// // ignore_for_file: prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:test_assignment/utils/constant.dart';

// class ProfileScreen extends StatelessWidget {
//   String email;
//   ProfileScreen({super.key, required this.email});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       backgroundColor: backgroundColor,
//       body: SafeArea(
//           child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Center(
//             child: CircleAvatar(
//               backgroundColor: Colors.white,
//               backgroundImage: AssetImage(
//                 "assets/icons/avatar.png",
//               ),
//               maxRadius: 50,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, top: 20),
//             child: Text(
//               email,
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }
