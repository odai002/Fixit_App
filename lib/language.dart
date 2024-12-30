import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Core/constant/route.dart';
import 'Core/localization/changelocal.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(15),
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
             Text("1".tr,
               style:const TextStyle(color:Colors.purple,fontSize:30,fontWeight:FontWeight.bold),),
            const SizedBox(height:40,),
            Container(
              padding:const EdgeInsets.symmetric(horizontal:100),
              width:double.infinity,
              child: MaterialButton(
                onPressed:(){
                  controller.ChangeLanguage("ar");
                  Get.offNamed(AppRoute.SplachScreen);
                },
                color:Colors.purple,
                minWidth:120,textColor:Colors.white,
                height:40,
                child:const Text('Arabic'),
              ),
            ),
            const SizedBox(height:10,),
            Container(
              padding:const EdgeInsets.symmetric(horizontal:100),
              width:double.infinity,
              child: MaterialButton(
                onPressed:(){
                  controller.ChangeLanguage("en");
                  Get.offNamed(AppRoute.SplachScreen);
                },
                color:Colors.purple,
                minWidth:120,textColor:Colors.white,
                height:40,
                child:const Text('English'),
              ),
            ),

          ],
    )
      )
    );
  }
}
