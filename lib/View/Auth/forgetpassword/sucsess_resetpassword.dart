// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../Controller/Auth/Forget/sucsess_resettpassword_controller.dart';
// import '../../Widgets/Custom_Button.dart';

// class SucsessResetpassword extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SucsessResettpasswordControllerImp controller =
//         Get.put(SucsessResettpasswordControllerImp());
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: false,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.check_circle_rounded,
//               color: const Color(0xff6A3BA8),
//               size: 200,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: RichText(
//                 text: TextSpan(children: [
//                   TextSpan(
//                     text: "Congratulation!",
//                     style: GoogleFonts.getFont(
//                       'Libre Caslon Text',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 24,
//                       color: Color(0xff000000),
//                     ),
//                   ),
//                 ]),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: RichText(
//                 text: TextSpan(children: [
//                   TextSpan(
//                     text: "process is done successfully",
//                     style: GoogleFonts.getFont(
//                       'Libre Caslon Text',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                       color: Color(0xff6E6E6E),
//                     ),
//                   ),
//                 ]),
//               ),
//             ),
//             const SizedBox(height: 120),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: CustomButton(
//                   fontSize: 12,
//                   height: 50,
//                   width: 350,
//                   textcolor: 0xffffffff,
//                   text: 'Go To Sign in',
//                   backgroundColor: const Color(0xff6A3BA8),
//                   onPressed: () {
//                     controller.ToPageSignin();
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
