import 'package:get/get_navigation/src/routes/get_route.dart';

import 'Core/constant/route.dart';
import 'View/Screen/Auth/forgetpassword/forgetpassword.dart';
import 'View/Screen/Auth/forgetpassword/resetpassword.dart';
import 'View/Screen/Auth/forgetpassword/sucsess_resetpassword.dart';
import 'View/Screen/Auth/forgetpassword/sucsess_signup.dart';
import 'View/Screen/Auth/forgetpassword/veryfi_code_page.dart';
import 'View/Screen/Auth/forgetpassword/veryfiycode_signup.dart';
import 'View/Screen/Auth/sign_in_page.dart';
import 'View/Screen/Auth/sign_up_page.dart';
import 'View/Screen/Splach_screen/splach_screen.dart';


List<GetPage<dynamic>>? routes =[
  //Splach
  GetPage(name:'/' , page: () =>const SplachScreen()),
// Auth
  GetPage(name:AppRoute.SignIn , page: () => SignIn()),
  GetPage(name:AppRoute.SignUp , page: () =>const SignUp()),
  GetPage(name:AppRoute.ForgetPassword , page: () => const ForgetPassword()),
  GetPage(name:AppRoute.VeryfiyCode , page: () => VerifyCode()),
  GetPage(name:AppRoute.VeryfiyCodeSignUp , page: () => VerifyCodeSignUp()),
  GetPage(name:AppRoute.ResetPassword , page: () => Resetpassword()),
  GetPage(name:AppRoute.SucsessSignUp , page: () => SucsessSignup()),
  GetPage(name:AppRoute.SucsessResetPassword , page: () => SucsessResetpassword()),




];


