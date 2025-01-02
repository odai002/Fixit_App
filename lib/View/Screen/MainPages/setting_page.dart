import 'package:flutter/material.dart';

import '../../Widgets/Custom_Bottom_naf_Bar.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnackBarBody(), // Your custom SnackBar component
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true, // Ensures the title is centered
        title: Center(
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
              leading: Icon(Icons.layers_outlined, color: Color(0xff6A3BA8)),
              title: Text('App Version'),
              trailing: Text('1.0.0', style: TextStyle(color: Colors.grey)),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.language_outlined, color: Color(0xff6A3BA8)),
              title: Text('Language'),
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
            Divider(),
            ListTile(
              leading: Icon(Icons.edit_outlined, color: Color(0xff6A3BA8)),
              title: Text('Edit Account'),
              onTap: () {
                // Navigate to Edit Account
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.article_outlined, color: Color(0xff6A3BA8)),
              title: Text('Terms and Services'),
              onTap: () {
                // Navigate to Terms and Services
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout_outlined, color: Color(0xff6A3BA8)),
              title: Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
