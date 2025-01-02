import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Variables for user data (to be fetched from the server)
  String userName = 'Joe Logan';
  String userPhone = '22 134 567';
  String userEmail = 'example@gmail.com';
  String userPassword = 'password123'; // Actual password (for visibility toggle)

  // State variable for password visibility
  bool _passwordVisible = false;

  // Navigation state
  int pageIndex = 2; // Profile Page index in the navigation bar

  // Bottom navigation bar configuration
  final List<Map<String, dynamic>> navBarItems = [
    {'icon': Icons.home_rounded, 'route': '/home'},
    {'icon': Icons.settings, 'route': '/settings'},
    {'icon': Icons.person, 'route': '/profile'},
    {'icon': Icons.notifications, 'route': '/notification'},
  ];

  // Navigation method
  void navigateToPage(int index, String route) {
    setState(() {
      pageIndex = index;
    });
    Get.toNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30), // Extra spacing at the top
            // Profile Title
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.person,
                  color: Color(0xff9B6CD7),
                  size: 40,
                ),
                SizedBox(width: 12), // More spacing between icon and text
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30), // Extra spacing before profile details
            // User Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  _buildProfileItem(
                    icon: Icons.person,
                    label: userName,
                  ),
                  const SizedBox(height: 20), // Spacing between items
                  _buildProfileItem(
                    icon: Icons.phone,
                    label: userPhone,
                  ),
                  const SizedBox(height: 20), // Spacing between items
                  _buildProfileItem(
                    icon: Icons.email,
                    label: userEmail,
                  ),
                  const SizedBox(height: 20), // Spacing between items
                  _buildProfileItem(
                    icon: Icons.lock,
                    label: _passwordVisible ? userPassword : '***********',
                    trailingIcon: _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onTrailingIconPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Edit Profile Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to edit profile page
                  Get.toNamed('/edit-profile');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6A3BA8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  elevation: 5,
                  minimumSize: Size(double.infinity, 50), // Larger width
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 15, // Larger text for better visibility
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40), // Extra spacing before bottom bar
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 56, // Slightly taller bottom navigation bar
        decoration: BoxDecoration(
          color: const Color(0xff6A3BA8),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 17,
              spreadRadius: 3,
              offset: Offset.fromDirection(90),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: navBarItems.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> item = entry.value;
            return _buildNavBarItem(
              icon: item['icon'],
              index: index,
              route: item['route'],
              isActive: pageIndex == index,
            );
          }).toList(),
        ),
      ),
    );
  }

  // Helper widget for profile items
  Widget _buildProfileItem({
    required IconData icon,
    required String label,
    IconData? trailingIcon,
    VoidCallback? onTrailingIconPressed,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xff9B6CD7), size: 24),
            const SizedBox(width: 20), // Increased spacing between icon and text
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (trailingIcon != null)
              IconButton(
                icon: Icon(trailingIcon, color: const Color(0xff9B6CD7), size: 24),
                onPressed: onTrailingIconPressed,
              ),
          ],
        ),
        const Divider(color: Colors.grey, thickness: 0.5), // Cleaner divider
      ],
    );
  }

  // Helper widget for bottom navigation bar items
  Widget _buildNavBarItem({
    required IconData icon,
    required int index,
    required String route,
    bool isActive = false,
  }) {
    return IconButton(
      onPressed: () => navigateToPage(index, route),
      icon: Icon(
        icon,
        color: isActive ? Colors.white : const Color(0xff9B6CD7),
        size: 24,
      ),
    );
  }
}
