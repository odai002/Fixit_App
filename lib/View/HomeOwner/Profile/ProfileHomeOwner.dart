import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/View/HomeOwner/Profile/Controller/ProfileHomeownerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProfileHomeOwner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '189'.tr,
          style: TextStyles.title,
        ),
      ),
      body: Consumer<ProfileHomeownerController>(
        builder: (context, controller, child) => controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ,
                        const SizedBox(height: 22),
                        ListTile(
                          leading: const Icon(Icons.person_rounded,
                              color: Color(0xff6A3BA8)),
                          title: Text("102".tr),
                          subtitle: Text(controller.username.value,
                              style: const TextStyle(fontSize: 16)),
                        ),
                        const SizedBox(height: 22),
                        ListTile(
                          leading: const Icon(Icons.email_rounded,
                              color: Color(0xff6A3BA8)),
                          title: Text("11".tr),
                          subtitle: Text(controller.email.value,
                              style: const TextStyle(fontSize: 16)),
                        ),
                        const SizedBox(height: 22),
                        ListTile(
                          leading: const Icon(Icons.phone_android_rounded,
                              color: Color(0xff6A3BA8)),
                          title: Text("103".tr),
                          subtitle: Text(controller.phone.value,
                              style: const TextStyle(fontSize: 16)),
                        ),
                        const SizedBox(height: 22),
                        ListTile(
                          leading: const Icon(Icons.location_city,
                              color: Color(0xff6A3BA8)),
                          title: Text("188".tr),
                          subtitle: Text(
                            '${controller.country.value}, ${controller.city.value}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 22),
                        ListTile(
                          leading: const Icon(Icons.streetview_rounded,
                              color: Color(0xff6A3BA8)),
                          title: Text("104".tr),
                          subtitle: Text(controller.streetAddress.value,
                              style: const TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
