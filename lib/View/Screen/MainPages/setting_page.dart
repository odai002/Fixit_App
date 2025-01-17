import 'package:fixit/Controller/Mainpages/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/constant/route.dart';
import '../../../Core/localization/changelocal.dart';
import '../../Widgets/Custom_Bottom_naf_Bar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController =Get.put(SettingsController());
    LocaleController localeController = Get.find();
    return Scaffold(
/*
      bottomNavigationBar: SnackBarBody(), // Your custom SnackBar component
*/
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true, // Ensures the title is centered
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min, // Ensures the content is compact
            children: [
              const Icon(Icons.settings_outlined, color: Color(0xff6A3BA8), size: 30),
              const SizedBox(width: 8), // Add spacing between the icon and text
              Text(
                '156'.tr,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.language_outlined, color: Color(0xff6A3BA8)),
              title:  Text('157'.tr),
              trailing: DropdownButton<String>(
                value: localeController.Language?.languageCode == 'en' ? 'English' : 'Arabic',
                underline: Container(),
                items:  [
                  DropdownMenuItem<String>(
                    value: 'English',
                    child: Text('161'.tr),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Arabic',
                    child: Text('162'.tr),
                  ),
                ],
                onChanged: (value) {
                  if (value == 'English') {
                    localeController.ChangeLanguage('en');
                  } else if (value == 'Arabic') {
                    localeController.ChangeLanguage('ar');
                  }
                },
              ),

            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.edit_outlined, color: Color(0xff6A3BA8)),
              title:  Text('158'.tr),
              onTap: () {
                  Get.offNamed(AppRoute.EditAccountPage);
                },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.article_outlined, color: Color(0xff6A3BA8)),
              title:  Text('160'.tr),
              onTap: () {
                settingsController.toPageTermService();
                },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout_outlined, color: Color(0xff6A3BA8)),
              title:  Text('159'.tr),
              onTap: () {
                settingsController.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
