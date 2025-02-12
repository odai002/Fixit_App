import 'package:fixit/Constant/colors.dart';
import 'package:fixit/View/Contractor/NavigationPageTemplate/Controller/NavigationPageTemplateHomeOwnerController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NavigationPageTemplateContractor extends StatelessWidget {
  NavigationPageTemplateContractor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<NavigationPageTemplateContractorController>(
        builder: (context, controller, child) => Container(
          height: 46.h,
          decoration: BoxDecoration(
            color: AppColors.active,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (value) => controller.Changeindex(value),
            backgroundColor: Colors.transparent,
            showUnselectedLabels: false,
            enableFeedback: false,
            showSelectedLabels: false,
            currentIndex: controller.currentindex,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                  size: 21,
                ),
                icon: Icon(
                  Icons.home_rounded,
                  color: Color(0xff9B6CD7),
                  size: 21,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 21,
                ),
                icon: Icon(
                  Icons.person,
                  color: Color(0xff9B6CD7),
                  size: 21,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 21,
                ),
                icon: Icon(
                  Icons.notifications,
                  color: Color(0xff9B6CD7),
                  size: 21,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 21,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Color(0xff9B6CD7),
                  size: 21,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: Consumer<NavigationPageTemplateContractorController>(
        builder: (context, controller, child) =>
            controller.listpage[controller.currentindex],
      ),
    );
  }
}
