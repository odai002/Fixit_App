import 'package:firebase_core/firebase_core.dart';
import 'package:fixit/Core/localization/changelocal.dart';
import 'package:fixit/Core/localization/translation.dart';
import 'package:fixit/Core/services/myservices.dart';
import 'package:fixit/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await initialservices();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return  SafeArea(
      child: GetMaterialApp(
        locale:controller.Language,
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        getPages:routes,
      ),
    );
  }
}
