import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Controller/Contractor/taskdetails_controller.dart';
import '../../../../Widgets/Custom_Button.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskDetailsController controller = Get.put(TaskDetailsController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "142".tr,
                  style: GoogleFonts.getFont(
                    'Libre Caslon Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(32.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  "143".tr,
                  style: GoogleFonts.getFont(
                    'Libre Caslon Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: const Color(0xff000000),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.taskTitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 33),
                Text(
                  "144".tr,
                  style: GoogleFonts.getFont(
                    'Libre Caslon Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: const Color(0xff000000),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.taskDescription,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 33),
                Text(
                  "145".tr,
                  style: GoogleFonts.getFont(
                    'Libre Caslon Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: const Color(0xff000000),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "${controller.taskCountry} - ${controller.taskCity}",
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 33),
                Text(
                  "146".tr,
                  style: GoogleFonts.getFont(
                    'Libre Caslon Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: const Color(0xff000000),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.taskLocation,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 50),
                Text(
                  "147".tr,
                  style: GoogleFonts.getFont(
                    'Libre Caslon Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: const Color(0xff000000),
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  children: controller.taskImages.isEmpty
                      ? [ Text("148".tr)]
                      : controller.taskImages.map((imageUrl) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 200),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: CustomButton(
                    width: 250,
                    textcolor: 0xffffffff,
                    text: "149".tr,
                    backgroundColor: const Color(0xff6A3BA8),
                    onPressed: () {
                      controller.back();
                    },
                    height: 50,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
