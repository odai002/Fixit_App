import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/Auth/signup_controller.dart';
import '../../../Core/function/validate_input.dart';
import '../../Widgets/Custom_Button.dart';
import '../../Widgets/Custom_DropdownMenu.dart';
import '../../Widgets/custom_textfield.dart';


class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupControllerImp controller =Get.put(SignupControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
    resizeToAvoidBottomInset: false,
          body:Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(37.2),
                  child: Form(
                    key: controller.formstate9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "110".tr,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: const Color(0xff6A3BA8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "111".tr,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "112".tr,
                                style: GoogleFonts.getFont(
                                  'Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 22),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: CustomTextField(
                            validator: (val){
                              return validinput(val!, 2, 35, "username");

                            },
                            maxLength: 100,
                            controller: controller.username,
                            name: "102".tr,
                            prefixIcon: Icons.person_rounded,
                            prefixIconColor:const Color(0xff6A3BA8),
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            suffixIcon: null,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: CustomTextField(
                            validator: (val){
                              return validinput(val!, 4, 100, "email");

                            },                      maxLength: 100,
                            controller: controller.email,
                            name: "11".tr,
                            prefixIcon: Icons.email_rounded,
                            inputType: TextInputType.emailAddress,
                            prefixIconColor:const Color(0xff6A3BA8),
                            textCapitalization: TextCapitalization.words,
                            suffixIcon: null,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: CustomTextField(
                            validator: (val) {
                              return validinput(val!, 10, 25, "phone");

                            },
                            maxLength: 100,
                            controller: controller.phone,
                            name: "103".tr,
                            prefixIconColor:const Color(0xff6A3BA8),
                            prefixIcon: Icons.phone_android_rounded,
                            inputType: TextInputType.phone,
                            textCapitalization: TextCapitalization.words,
                            suffixIcon: null,
                          ),
                        ),
                        const SizedBox(height: 22),

                        Align(
                          alignment:Alignment.bottomLeft,
                          child: GetBuilder<SignupControllerImp>(
                            builder: (controller) => Column(
                              children: [
                                DropdownMenuExample(
                                  items: controller.users,
                                  onSelected: (String value) {
                                    controller.setUsertype(value);
                                  }, initialValue: (String value) {
                                    controller.role;
                                },
                                ),
                                const SizedBox(height: 22),

                                if (controller.showContractorDropdown)
                                  DropdownMenuExample(
                        items: controller.services.map((service) => service['name'] as String).toList(),
                         onSelected: (String selectedServiceName) {
                          controller.setService(selectedServiceName);
                          },
                           initialValue: (String){controller.selectedService;},
                ),
                              ],
                            ),
                          ),
                        ),
                              const SizedBox(height: 22),

                        GetBuilder<SignupControllerImp>(
                          builder: (controller) => Row(
                            children: [
                              DropdownMenuExample(
                                items:controller.Countries,
                                onSelected: (String value) {
                                  controller.setCountry(value);
                                },initialValue:(String value){
                                  controller.country;
                              },
                              ),
                              const SizedBox(width: 22),
                              DropdownMenuExample(
                                items: controller.Cities,
                                onSelected: (String value) {
                                  controller.setCity(value);
                                },
                                initialValue:(String){
                                  controller.city;
                                },
                              ),
                            ],
                          ),
                        ),

                              const SizedBox(height: 22),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: CustomTextField(
                            validator: (val) {
                              return validinput(val!, 5, 100, "street");
                            },
                            maxLength: 100,
                            controller: controller.address,
                            prefixIconColor:const Color(0xff6A3BA8),
                            name: "104".tr,
                            prefixIcon: Icons.streetview_rounded,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            suffixIcon: null,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: GetBuilder<SignupControllerImp>(builder:(controller) => CustomTextField(
                              validator: (val){
                                return validinput(val!, 8, 30, "password");
                                                            },
                              maxLength: 100,
                              obscureText: controller.isshowpassword,
                              controller: controller.password,
                              name: "10".tr,
                              prefixIcon: Icons.lock,
                            prefixIconColor:const Color(0xff6A3BA8),
                            inputType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              suffixIcon: Icons.remove_red_eye,
                              onTapIcon:(){
                                controller.ShowPassword();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        GetBuilder<SignupControllerImp>(
                          builder:(controller) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: CustomTextField(
                              validator: (val){
                                if(val != controller.password.text){
                                  return "password do not match";
                                }else{
                                 return validinput(val!, 8, 30, "confirmPassword");
                              }
                                },
                              maxLength: 100,
                              obscureText: controller.isConfirmshowpassword,
                              prefixIconColor:const Color(0xff6A3BA8),
                              controller: controller.password_confirmation,
                              name: "105".tr,
                              prefixIcon: Icons.lock,
                              inputType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              suffixIcon: Icons.remove_red_eye,
                              onTapIcon:(){
                                controller.ShowConfirmPassword();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                    GetBuilder<SignupControllerImp>(
                      builder:(controller) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GetBuilder<SignupControllerImp>(builder:(controller)=>
                                   CustomButton(
                                    fontSize: 12,
                                    height: 50,
                                    textcolor: 0xffFFFFFF,
                                    text: '113'.tr,
                                    backgroundColor: const Color(0xff6A3BA8),
                                    width: 120,
                                    onPressed: () async{
                                     await controller.Register();
                                    }
                                  ),
                                ),
                                const SizedBox(width: 22),
                                CustomButton(
                                  fontSize: 12,
                                  height: 50,
                                  textcolor: 0xff6A3BA8,
                                  width: 120,
                                  text: '107'.tr,
                                  backgroundColor: const Color(0xffFFFFFF),
                                  onPressed: () {
                                    controller.Cancel();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
