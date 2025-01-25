// // ignore_for_file: must_be_immutable

// import 'dart:developer';

// import 'package:fixit/Controller/HomeOnwer/ContractControllerHomeOwner.dart';
// import 'package:fixit/Controller/HomeOnwer/notification_controller.dart';
// import 'package:fixit/View/Screen/Home_Owner/ContractPage.dart';
// import 'package:fixit/data/Model/Notification.dart' as not;
// import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class NotificationCard extends StatelessWidget {
//   not.Notification? notification;
//   NotificationController? notificationController;

//   NotificationCard({this.notification, this.notificationController});

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Container(
//       margin: EdgeInsets.only(bottom: screenHeight * 0.02),
//       padding: EdgeInsets.all(screenWidth * 0.04),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade400,
//             blurRadius: 7,
//             spreadRadius: 1,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.15),
//                         blurRadius: 0.5,
//                         spreadRadius: 0.2,
//                         offset: Offset(0, 0),
//                       ),
//                     ],
//                   ),
//                   child: ClipOval(
//                     child: Image.asset(
//                       'assets/U.png',
//                       fit: BoxFit.cover,
//                       width: 50,
//                       height: 50,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   notification!.content!,
//                   style: GoogleFonts.getFont(
//                     'Libre Caslon Text',
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18,
//                     color: const Color(0xff000000),
//                   ),
//                 ),
//               ),
//               Text(
//                 "${DateFormat('h:mm a').format(DateTime.parse(notification!.created_at!).toLocal())}",
//                 // "${DateFormat('yyyy-MM-dd').format(DateTime.parse(notification!.created_at!.toString()))}",
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.04,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: screenHeight * 0.01),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 16.0), // Padding for description and text button
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (notification!.type == 'waitcontract')
//                   TextButton(
//                     onPressed: () {
//                       log(notification!.idAction!.toString());
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ChangeNotifierProvider(
//                               create: (context) => ContractControllerHomeOwner()
//                                 ..getContractById(notification!.idAction!),
//                               builder: (context, child) =>
//                                   ContractPageHomeOwner(),
//                             ),
//                           ));
//                       // Handle "Show Contract" action
//                     },
//                     style: TextButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       minimumSize: Size(0, 0),
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     ),
//                     child: const Text(
//                       "Show Contract",
//                       style: TextStyle(
//                         color: Color(0xff6A3BA8),
//                         fontWeight: FontWeight.w600,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.015),
//           // if (notification!.type == 'waitcontract')
//         ],
//       ),
//     );
//   }
// }
