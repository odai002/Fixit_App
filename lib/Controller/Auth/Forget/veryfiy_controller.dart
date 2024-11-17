import 'package:get/get.dart';

import '../../../Core/constant/route.dart';


abstract class VeryfiyController extends GetxController{
  CheckCode();
  ToPageResetPassword();
}
class VeryfiyControllerImp extends VeryfiyController{
  late String veryfiyCode;
  @override
  ToPageResetPassword() {
    Get.offNamed(AppRoute.ResetPassword);
  }

  @override
  CheckCode() {

    }
@override
  void onInit() {
    super.onInit();
  }
}