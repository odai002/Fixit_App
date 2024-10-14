import 'package:get/get.dart';

import '../../Core/constant/route.dart';

abstract class SucsessResettpasswordController extends GetxController{
  ToPageSignin();
}
class SucsessResettpasswordControllerImp extends SucsessResettpasswordController{
  @override
  ToPageSignin() {
    Get.offNamed(AppRoute.SignIn);
  }

}