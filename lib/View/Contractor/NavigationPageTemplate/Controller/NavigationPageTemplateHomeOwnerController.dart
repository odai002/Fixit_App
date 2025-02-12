import 'package:fixit/View/Contractor/Home/Controller/HomePageContractController.dart';
import 'package:fixit/View/Contractor/Home/HomePageContract.dart';
import 'package:fixit/View/Contractor/Notification/Controller/NotificationPageController.dart';
import 'package:fixit/View/Contractor/Notification/NotificationPageContractor.dart';
import 'package:fixit/View/HomeOwner/Settings/SettingPage.dart';
import 'package:fixit/View/Contractor/Protfilio/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationPageTemplateContractorController with ChangeNotifier {
  int currentindex = 0;
  List<Widget> listpage = [
    ChangeNotifierProvider(
      create: (context) => HomePageContractorController()..GetMyTasks(),
      builder: (context, child) => HomePageContractor(),
    ),
    ProfilePage(),

    ChangeNotifierProvider(
      create: (context) => NotificationPageContractorController(),
      builder: (context, child) => NotificationPageContractor(),
    ),
    SettingPage(),

    // HomePage(),
    // ChangeNotifierProvider<MapViewController>(
    //   create: (context) => MapViewController()
    //     ..initcontrollers()
    //     ..onInit(context),
    //   lazy: true,
    //   builder: (context, child) => MapView(),
    //   child: MapView(),
    // ),
    // Community(),
    // SettingsPage(),
  ];

  Changeindex(int value) async {
    // if (value == 1) {
    //   // PermissionStatus status = await ServicesProvider.acceptGetLocation();
    //   // if (status.isGranted) {
    //   //   currentindex = value;
    //   // }
    // } else {
    currentindex = value;
    // }
    notifyListeners();
  }
}
