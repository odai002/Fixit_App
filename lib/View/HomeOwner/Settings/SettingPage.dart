import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/Controller/ServicesProvider.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/HomeOwner/EditProfile/EditProfilePage.dart';
import 'package:fixit/View/HomeOwner/TermsAndServicesPage/TermsAndServicesPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/localization/changelocal.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '156'.tr,
          style: TextStyles.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ListTile(
              leading:
                  const Icon(Icons.language_outlined, color: Color(0xff6A3BA8)),
              title: Text('157'.tr),
              trailing: DropdownButton<String>(
                value: localeController.Language?.languageCode == 'en'
                    ? 'English'
                    : 'Arabic',
                underline: Container(),
                items: [
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
              leading:
                  const Icon(Icons.edit_outlined, color: Color(0xff6A3BA8)),
              title: Text('158'.tr),
              onTap: () {
                CustomRoute.RouteTo(context, EditAccountPage());
              },
            ),
            const Divider(),
            ListTile(
              leading:
                  const Icon(Icons.article_outlined, color: Color(0xff6A3BA8)),
              title: Text('160'.tr),
              onTap: () {
                CustomRoute.RouteTo(context, TermsAndServicesPage());
              },
            ),
            const Divider(),
            ListTile(
              leading:
                  const Icon(Icons.logout_outlined, color: Color(0xff6A3BA8)),
              title: Text('159'.tr),
              onTap: () {
                ServicesProvider.logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
