// ignore_for_file: use_build_context_synchronously

import 'package:fixit/Controller/ServicesProvider.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/Contractor/NavigationPageTemplate/Controller/NavigationPageTemplateHomeOwnerController.dart';
import 'package:fixit/View/Contractor/NavigationPageTemplate/NavigationPageTemplateContractor.dart';
import 'package:fixit/View/HomeOwner/NavigationPageTemplate/Controller/NavigationPageTemplateHomeOwnerController.dart';
import 'package:fixit/View/HomeOwner/NavigationPageTemplate/NavigationPageTemplateHomeOwner.dart';
import 'package:fixit/View/Auth/Login/Controller/LoginController.dart';
import 'package:fixit/View/Auth/Login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashController with ChangeNotifier {
  whenIslogin(BuildContext context) async {
    Future.delayed(Duration(seconds: 5)).then((value) async {
      if (await ServicesProvider.isLoggin()) {
        if (await ServicesProvider.getUserType() == 'homeowner') {
          ToHomeOwner(context);
        } else if (await ServicesProvider.getUserType() == 'contractor') {
          ToHomeContractor(context);
        }
      } else {
        toLoginPage(context);
      }
    });
  }

  ToHomeOwner(BuildContext context) {
    CustomRoute.RouteAndRemoveUntilTo(
        context,
        ChangeNotifierProvider(
          create: (context) => NavigationPageTemplateHomeOwnerController(),
          builder: (context, child) => NavigationPageTemplateHomeOwner(),
        ));
  }

  ToHomeContractor(BuildContext context) {
    CustomRoute.RouteAndRemoveUntilTo(
        context,
        ChangeNotifierProvider(
          create: (context) => NavigationPageTemplateContractorController(),
          builder: (context, child) => NavigationPageTemplateContractor(),
        ));
  }

  toLoginPage(BuildContext context) {
    CustomRoute.RouteReplacementTo(
      context,
      ChangeNotifierProvider<LoginController>(
        create: (context) => LoginController(),
        // builder: (context, child) => Login(),
        child: LoginPage(),
      ),
    );
  }
}
// }
