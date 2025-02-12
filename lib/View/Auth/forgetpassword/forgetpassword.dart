// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../Controller/Auth/Forget/forgerpassword_controller.dart';
// import '../../../Core/function/validate_input.dart';
// import '../../Widgets/Custom_Button.dart';
// import '../../Widgets/custom_textfield.dart';

// class ForgetPassword extends StatelessWidget {
//   const ForgetPassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ForgetpasswordControllerImp controller =
//         Get.put(ForgetpasswordControllerImp());
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: false,
//       body: Center(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(37.2),
//             child: Form(
//               key: controller.formstate_1,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       RichText(
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: "Check",
//                             style: GoogleFonts.getFont(
//                               'Libre Caslon Text',
//                               fontWeight: FontWeight.w500,
//                               fontSize: 24,
//                               color: const Color(0xff6A3BA8),
//                             ),
//                           ),
//                         ]),
//                       ),
//                       const SizedBox(width: 5),
//                       RichText(
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: "Email",
//                             style: GoogleFonts.getFont(
//                               'Libre Caslon Text',
//                               fontWeight: FontWeight.w500,
//                               fontSize: 24,
//                               color: const Color(0xff000000),
//                             ),
//                           ),
//                         ]),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 26),
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "use your registered email ",
//                           style: GoogleFonts.getFont(
//                             'Libre Caslon Text',
//                             fontWeight: FontWeight.w500,
//                             fontSize: 12,
//                             color: const Color(0xff000000),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 34),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 1),
//                     child: CustomTextField(
//                       validator: (val) {
//                         return validinput(val!, 5, 100, "email");
//                       },
//                       maxLength: 100,
//                       controller: controller.email,
//                       name: "Email...",
//                       icon: Icon(Icons.email_rounded),
//                       inputType: TextInputType.name,
//                       // prefixIconColor:const Color(0xff6A3BA8),
//                       textCapitalization: TextCapitalization.words,
//                     ),
//                   ),
//                   const SizedBox(height: 44),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 1),
//                     child: CustomButton(
//                       width: 250,
//                       textcolor: 0xffffffff,
//                       text: 'Check',
//                       backgroundColor: const Color(0xff6A3BA8),
//                       onPressed: () {
//                         controller.ToPageVeryfiyCode();
//                       },
//                       height: 50,
//                       fontSize: 12,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
