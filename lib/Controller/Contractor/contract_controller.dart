import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/constant/route.dart';

class ContractController extends GetxController{
   late  TextEditingController dateController;
  late TextEditingController priceController ;
  late TextEditingController deadlineController ;

  String? taskTitle;
   String? taskDescription;
   String? taskCountry;
   String ? taskCity;
   String? taskLocation;
   List<String>? taskImages=[];
Future<void> sendContract(int taskId)async{
  try{
    final date =dateController.text;
    final price= double.tryParse(priceController.text);
    final deadline=deadlineController.text;
    if(date.isEmpty || price == null ||  price <=0 || deadline.isEmpty){
      Get.snackbar("invalid input", "please fill all fields");return;}

    //هةم بحط كود الارسال للداتا بيز
    Get.offNamed(AppRoute.ContractorHomePage);
   /* print("date: $dateController ====");
    print("price: $priceController ====");
    print("deadline: $deadlineController ====");*/


  }catch(e){
    print('=========$e');
  }
}
@override
  void onInit() {
    super.onInit();
          dateController =TextEditingController();
          priceController =TextEditingController();
          deadlineController =TextEditingController();
          final argument=Get.arguments;
          taskTitle = argument['taskTitle'];
          taskDescription = argument['taskDescription'];
          taskCountry = argument['taskCountry'];
          taskCity = argument['taskCity'];
          taskLocation = argument['taskLocation'];
          taskImages = List<String>.from(argument['taskImages'] ?? []);
            }
  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    priceController.dispose();
    deadlineController.dispose();
  }
}