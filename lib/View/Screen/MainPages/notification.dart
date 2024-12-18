import 'package:fixit/Controller/HomeOnwer/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/Custom_Bottom_naf_Bar.dart';
import '../../Widgets/Notification_Card.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SnackBarBody(),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.notifications_rounded,
                  size: 50,
                  color: Colors.black,
                ),
                const SizedBox(width: 5),
                Text(
                  'Notification',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.06),
            Text(
              "Today",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.contracts.isEmpty) {
                  return const Center(child: Text("No notifications found"));
                } else {
                  return ListView.builder(
                    itemCount: controller.contracts.length,
                    itemBuilder: (context, index) {
                      final contract = controller.contracts[index];
                      return NotificationCard(
                        username: "odai",
                        message: "has accepted your tasks and here is your recipt :${contract['data']}",
                        time: "22:00",
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        buttons: const ['Accept', 'Refuse'],
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
