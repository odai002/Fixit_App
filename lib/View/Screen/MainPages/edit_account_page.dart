import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Mainpages/editaccount_controller.dart';
import '../../../Core/function/validate_input.dart';
import '../../Widgets/Custom_Button.dart';
import '../../Widgets/Custom_DropdownMenu.dart';
import '../../Widgets/custom_textfield.dart';

class EditAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EditaccountController controller =Get.put(EditaccountController());

    controller.initializeFields(
        "odai",
        "odaisu@gmail.com",
        "1234567890",
        "123 Main St",
      "odaiiiiiiiiiiis2",
      "odaiiiiiiiiiiis2"
    );

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () {
          Get.back();
    }
    ),
    ),
            body:  Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit, color: Colors.purple, size: 48),
                SizedBox(width:8,),
                Text(
                  'Edit Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
              const SizedBox(height:22,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20,),
                child: CustomTextField(
                  validator: (val){
                    return validinput(val!, 2, 35, "username");

                  },
                  maxLength: 100,
                  controller: controller.username,
                  name: "username...",
                  prefixIcon: Icons.person_rounded,
                  prefixIconColor:const Color(0xff6A3BA8),
                  inputType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  suffixIcon: null,
                ),
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20,),
                child: CustomTextField(
                  validator: (val){
                    return validinput(val!, 4, 100, "email");

                  },                      maxLength: 100,
                  controller: controller.email,
                  name: "email...",
                  prefixIcon: Icons.email_rounded,
                  inputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.words,
                  suffixIcon: null,
                  prefixIconColor:const Color(0xff6A3BA8),
                ),
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: CustomTextField(
                  validator: (val) {
                    return validinput(val!, 10, 25, "phone");

                  },
                  maxLength: 100,
                  controller: controller.phone,
                  name: "phone",
                  prefixIcon: Icons.phone_android_rounded,
                  prefixIconColor:const Color(0xff6A3BA8),
                  inputType: TextInputType.phone,
                  textCapitalization: TextCapitalization.words,
                  suffixIcon: null,
                ),
              ),
              const SizedBox(height: 22),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: GetBuilder<EditaccountController>(
                  builder: (controller) => Row(
                    children: [
                      DropdownMenuExample(
                        items:controller.Country,
                        onSelected: (String value) {
                          controller.setCountry(value);
                        },initialValue:(String value){
                        controller.country;
                      },
                      ),
                      const SizedBox(width: 22),
                      DropdownMenuExample(
                        items: controller.City,
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
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  validator: (val) {
                    return validinput(val!, 5, 100, "street");

                  },
                  maxLength: 100,
                  controller: controller.streetAddress,
                  prefixIconColor:const Color(0xff6A3BA8),
                  name: "streetAddress",
                  prefixIcon: Icons.streetview_rounded,
                  inputType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  suffixIcon: null,
                ),
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: GetBuilder<EditaccountController>(builder:(controller) => CustomTextField(
                  validator: (val){
                    return validinput(val!, 8, 30, "password");
                  },
                  maxLength: 100,
                  obscureText: controller.isshowpassword,
                  controller: controller.password,
                  name: "password",
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
              GetBuilder<EditaccountController>(
                builder:(controller) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
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
                    controller: controller.confirmPassword,
                    name: "confirmPassword",
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
              const SizedBox(height:45),
              GetBuilder<EditaccountController>(
                builder:(controller) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<EditaccountController>(builder:(controller)=>
                          CustomButton(
                              fontSize: 12,
                              height: 50,
                              textcolor: 0xffFFFFFF,
                              text: 'Edit',
                              backgroundColor: const Color(0xff6A3BA8),
                              width: 120,
                              onPressed: () async{
                                await controller.Edit();
                              }
                          ),
                      ),
                      const SizedBox(width: 22),
                      CustomButton(
                        fontSize: 12,
                        height: 50,
                        textcolor: 0xff6A3BA8,
                        width: 120,
                        text: 'Cancel',
                        backgroundColor: const Color(0xffFFFFFF),
                        onPressed: () {
                          controller.Cancel();
                        },
                      ),
                    ],
                  ),
                ),
              ),

            ]
    ),
    )
    ),
    );
  }
}