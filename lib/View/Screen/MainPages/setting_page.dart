import 'package:fixit/Controller/Mainpages/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/constant/route.dart';
import '../../Widgets/Custom_Bottom_naf_Bar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController =Get.put(SettingsController());
    return Scaffold(
      bottomNavigationBar: SnackBarBody(), // Your custom SnackBar component
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true, // Ensures the title is centered
        title: const Center(
          child: Row(
            mainAxisSize: MainAxisSize.min, // Ensures the content is compact
            children: [
              Icon(Icons.settings_outlined, color: Color(0xff6A3BA8), size: 30),
              SizedBox(width: 8), // Add spacing between the icon and text
              Text(
                'Settings',
                style: TextStyle(
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
              title: const Text('Language'),
              trailing: DropdownButton<String>(
                value: 'English',
                underline: Container(),
                items: ['English', 'Arabic'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  // Handle language change
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.edit_outlined, color: Color(0xff6A3BA8)),
              title: const Text('Edit Account'),
              onTap: () {
                  Get.offNamed(AppRoute.EditAccountPage);
                },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.article_outlined, color: Color(0xff6A3BA8)),
              title: const Text('Terms and Services'),
              onTap: () {
                // Navigate to Terms and Services
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout_outlined, color: Color(0xff6A3BA8)),
              title: const Text('Logout'),
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
