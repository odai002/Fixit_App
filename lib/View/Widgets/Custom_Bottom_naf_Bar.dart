import 'package:fixit/Core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SnackBarBody extends StatefulWidget {
  SnackBarBody({super.key});

  @override
  _SnackBarBodyState createState() => _SnackBarBodyState();
}

class _SnackBarBodyState extends State<SnackBarBody> {
  int pageIndex = 0;

  // This method ensures the state is updated before navigation
  void navigateToPage(int index, String route) {
    setState(() {
      pageIndex = index;  // Update pageIndex first
    });
    Get.toNamed(route);  // Then navigate to the route
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
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
                offset: Offset.fromDirection(90))
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home Icon Button
          IconButton(
            enableFeedback: false,
            onPressed: () {
              navigateToPage(0, AppRoute.HomePage);  // Navigate to Home Page
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.home_rounded,
              color: Colors.white,
              size: 21,
            )
                : const Icon(
              Icons.home_rounded,
              color: Colors.grey,  // Gray when not on Home Page
              size: 21,
            ),
          ),
          // Settings Icon Button
          IconButton(
            enableFeedback: false,
            onPressed: () {
              navigateToPage(1, AppRoute.Setting);  // Navigate to Settings Page
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.settings,
              color: Colors.white,
              size: 21,
            )
                : const Icon(
              Icons.settings,
              color: Color(0xff9B6CD7),
              size: 21,
            ),
          ),
          // Profile Icon Button
          IconButton(
            enableFeedback: false,
            onPressed: () {
              navigateToPage(2, AppRoute.Profile);  // Navigate to Profile Page
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.person,
              color: Colors.white,
              size: 21,
            )
                : const Icon(
              Icons.person,
              color: Color(0xff9B6CD7),
              size: 21,
            ),
          ),
          // Notification Icon Button
          IconButton(
            enableFeedback: false,
            onPressed: () {
              navigateToPage(3, AppRoute.Notification);  // Navigate to Notification Page
            },
            icon: pageIndex == 3
                ? const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 21,
            )
                : const Icon(
              Icons.notifications,
              color: Color(0xff9B6CD7),
              size: 21,
            ),
          ),
        ],
      ),
    );
  }
}
