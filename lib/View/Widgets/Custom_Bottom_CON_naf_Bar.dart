// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:fixit/Core/constant/route.dart';

// import '../../Controller/Contractor/navigationBar.dart';

// class SnackBarBodyCON extends StatelessWidget {
//   final NavigationController navController = Get.put(NavigationController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Container(
//       height: 46,
//       decoration: BoxDecoration(
//         color: const Color(0xff6A3BA8),
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(22),
//           topRight: Radius.circular(22),
//         ),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black54,
//               blurRadius: 17,
//               spreadRadius: 3,
//               offset: Offset.fromDirection(90))
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               navController.updatePageIndex(0);
//               Get.toNamed(AppRoute.Setting);
//             },
//             icon: Icon(
//               Icons.settings,
//               color: navController.currentPageIndex.value == 0
//                   ? Colors.white
//                   : const Color(0xff9B6CD7),
//               size: 21,
//             ),
//           ),
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               navController.updatePageIndex(1);
//               Get.toNamed(AppRoute.ContractorHomePage);
//             },
//             icon: Icon(
//               Icons.home_rounded,
//               color: navController.currentPageIndex.value == 1
//                   ? Colors.white
//                   : const Color(0xff9B6CD7),
//               size: 21,
//             ),
//           ),
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               navController.updatePageIndex(2);
//               Get.toNamed(AppRoute.ProfileContractor);
//             },
//             icon: Icon(
//               Icons.person,
//               color: navController.currentPageIndex.value == 2
//                   ? Colors.white
//                   : const Color(0xff9B6CD7),
//               size: 21,
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }
