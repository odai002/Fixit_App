import 'package:fixit/Core/constant/route.dart';
import 'package:get/get.dart';

class TaskDetailsController extends GetxController {
  late String taskTitle;
  late String taskDescription;
  late String taskCountry;
  late String taskCity;
  late String taskLocation;
  late List<String> taskImages;

  @override
  void onInit() {
    super.onInit();
    // استقبل البيانات الممررة
    final arguments = Get.arguments;

    // تأكد من وجود البيانات
    if (arguments != null) {
      taskTitle = arguments['taskTitle'];
      taskDescription = arguments['taskDescription'];
      taskCountry = arguments['taskCountry'];
      taskCity = arguments['taskCity'];
      taskLocation = arguments['taskLocation'];
      taskImages = List<String>.from(arguments['taskImages'] ?? []);
    } else {
      // التعامل مع الحالة عندما لا توجد بيانات
      taskTitle = 'Unknown Task';
      taskDescription = 'No Description';
      taskCountry = '';
      taskCity = '';
      taskLocation = '';
      taskImages = [];
    }
  }
  Accept(){
    Get.toNamed(AppRoute.ContractPage,arguments: {
      'taskTilte': taskTitle,
      'taskDescription' :taskDescription,
      'taskCountry' :taskCountry,
      'taskCity' : taskCity,
      'taskLocation' : taskLocation,
      'taskImages' :taskImages
    });
  }
}
