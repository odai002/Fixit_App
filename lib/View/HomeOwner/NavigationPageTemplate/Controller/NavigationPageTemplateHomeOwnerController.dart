import 'package:fixit/View/HomeOwner/Home/HomePage.dart';
import 'package:fixit/View/HomeOwner/Notification/Controller/NotificationPageController.dart';
import 'package:fixit/View/HomeOwner/Notification/NotificationPage.dart';
import 'package:fixit/View/HomeOwner/Profile/Controller/ProfileHomeownerController.dart';
import 'package:fixit/View/HomeOwner/Profile/ProfileHomeOwner.dart';
import 'package:fixit/View/HomeOwner/Settings/SettingPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationPageTemplateHomeOwnerController with ChangeNotifier {
  int currentindex = 0;
  List<Widget> listpage = [
    HomePage(),
    ChangeNotifierProvider(
      create: (context) => ProfileHomeownerController()..GetProfile(),
      builder: (context, child) => ProfileHomeOwner(),
    ),
    ChangeNotifierProvider(
      create: (context) => NotificationPageController(),
      builder: (context, child) => NotificationPage(),
    ),
    SettingPage(),
  ];

  Changeindex(int value) async {
    currentindex = value;
    notifyListeners();
  }
}
