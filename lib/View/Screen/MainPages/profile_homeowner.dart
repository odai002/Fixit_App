import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/HomeOnwer/profile_controller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person, color: Colors.purple, size: 48),
                    const SizedBox(width: 8),
                    Text(
                      '189'.tr,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Obx(() => ListTile(
                  leading: const Icon(Icons.person_rounded, color: Color(0xff6A3BA8)),
                  title: Text("102".tr),
                  subtitle: Text(controller.username.value, style: const TextStyle(fontSize: 16)),
                )),
                const SizedBox(height: 22),
                Obx(() => ListTile(
                  leading: const Icon(Icons.email_rounded, color: Color(0xff6A3BA8)),
                  title: Text("11".tr),
                  subtitle: Text(controller.email.value, style: const TextStyle(fontSize: 16)),
                )),
                const SizedBox(height: 22),
                Obx(() => ListTile(
                  leading: const Icon(Icons.phone_android_rounded, color: Color(0xff6A3BA8)),
                  title: Text("103".tr),
                  subtitle: Text(controller.phone.value, style: const TextStyle(fontSize: 16)),
                )),
                const SizedBox(height: 22),
                Obx(() => ListTile(
                  leading: const Icon(Icons.location_city, color: Color(0xff6A3BA8)),
                  title: Text("188".tr),
                  subtitle: Text(
                    '${controller.country.value}, ${controller.city.value}',
                    style: const TextStyle(fontSize: 16),
                  ),
                )),
                const SizedBox(height: 22),
                Obx(() => ListTile(
                  leading: const Icon(Icons.streetview_rounded, color: Color(0xff6A3BA8)),
                  title: Text("104".tr),
                  subtitle: Text(controller.streetAddress.value, style: const TextStyle(fontSize: 16)),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
