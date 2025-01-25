import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fixit/Constant/colors.dart';
import 'package:fixit/Controller/ListProvider.dart';
import 'package:fixit/Core/localization/changelocal.dart';
import 'package:fixit/Core/localization/translation.dart';
import 'package:fixit/Services/myservices.dart';
import 'package:fixit/View/Splach/Controller/SplashController.dart';
import 'package:fixit/View/Splach/Splash.dart';
import 'package:fixit/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  await Firebase.initializeApp(
    name: 'fixit',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );
  runApp(MultiProvider(
    providers: listproviders,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        locale: controller.Language,
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.active,
          scaffoldBackgroundColor: AppColors.basic,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => AppColors.active),
            ),
          ),
          iconTheme: IconThemeData(
            color: AppColors.primary,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.basic,
            elevation: 0,
          ),
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.black,
              displayColor: AppColors.black,
              fontFamily: 'LibraCaslonText'),
          useMaterial3: false,
          colorScheme: ColorScheme.light(
            primary: AppColors.primary,
            secondary: AppColors.secondery,
          ).copyWith(background: AppColors.primary),
        ),
        home: ChangeNotifierProvider(
          create: (context) => SplashController()..whenIslogin(context),
          builder: (context, child) => Splash(),
        ),
        builder: (context, child) {
          EasyLoading.instance
            ..displayDuration = const Duration(seconds: 3)
            ..indicatorType = EasyLoadingIndicatorType.fadingCircle
            ..loadingStyle = EasyLoadingStyle.custom
            ..indicatorSize = 45.0
            ..radius = 15.0
            ..maskType = EasyLoadingMaskType.black
            ..progressColor = AppColors.primary
            ..backgroundColor = AppColors.basic
            ..indicatorColor = AppColors.primary
            ..textColor = AppColors.primary
            ..maskColor = Colors.black
            ..userInteractions = false
            ..animationStyle = EasyLoadingAnimationStyle.opacity
            ..dismissOnTap = false;
          return FlutterEasyLoading(child: child);
        },
      ),
    );
  }
}
