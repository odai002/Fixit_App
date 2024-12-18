import 'package:fixit/View/Screen/Contractor/Input_contractor/Home_page/Contractor_Home_Page_Main.dart';
import 'package:fixit/View/Screen/Contractor/Input_contractor/Home_page/task_detial_page.dart';
import 'package:fixit/View/Screen/Contractor/Input_contractor/contract_page.dart';
import 'package:fixit/View/Screen/Home_Owner/Input_onwer/Home_app/Category_Page/category_page.dart';
import 'package:fixit/View/Screen/Home_Owner/Input_onwer/Home_app/Home_page.dart';
import 'package:fixit/View/Screen/Home_Owner/Input_onwer/Home_app/task_page.dart';
import 'package:fixit/View/Screen/MainPages/notification.dart';
import 'package:fixit/View/Screen/language.dart';
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
import 'View/Screen/MainPages/edit_account_page.dart';
import 'View/Screen/Splach_screen/splach_screen.dart';

List<GetPage<dynamic>>? routes =[
  //Splach
/*
  GetPage(name:'/' , page: () =>const Language()),
*/
  GetPage(name:'/', page: () =>const SplachScreen()),

// Auth
  GetPage(name:AppRoute.SignIn , page: () => SignIn()),
  GetPage(name:AppRoute.SignUp , page: () =>const SignUp()),
  GetPage(name:AppRoute.ForgetPassword , page: () => const ForgetPassword()),
  GetPage(name:AppRoute.VeryfiyCode , page: () => VerifyCode()),
  GetPage(name:AppRoute.VeryfiyCodeSignUp , page: () => VerifyCodeSignUp()),
  GetPage(name:AppRoute.ResetPassword , page: () => Resetpassword()),
  GetPage(name:AppRoute.SucsessSignUp , page: () => SucsessSignup()),
  GetPage(name:AppRoute.SucsessResetPassword , page: () => SucsessResetpassword()),

  //Main Pages
  GetPage(name:AppRoute.EditAccountPage , page: () => EditAccountPage()),
  GetPage(name:AppRoute.Notification , page: () => const Notification()),

  //Home Onwer
  GetPage(name:AppRoute.HomePage , page: () => HomePage()),
  GetPage(name:AppRoute.CategoryPage , page: () => CategoryPage()),
  GetPage(name:AppRoute.TaskPage , page: () => Taskpage()),

  //Contractor
  GetPage(name:AppRoute.ContractorHomePage , page: () => const ContractorHomePage()),
  GetPage(name:AppRoute.TaskDetailsPage , page: () => TaskDetailsPage()),
  GetPage(name:AppRoute.ContractPage , page: () => const ContractPage()),
  
  





];


