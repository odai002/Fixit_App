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
    var arguments = Get.arguments;
    print('Received data:');
    print('taskTitle: ${arguments['taskTitle']}');
    print('taskDescription: ${arguments['taskDescription']}');
    print('taskCountry: ${arguments['taskCountry']}');
    print('taskCity: ${arguments['taskCity']}');
    print('taskLocation: ${arguments['taskLocation']}');
    print('taskImages: ${arguments['taskImages']}');

    taskTitle = arguments['taskTitle'] ?? 'No Title'; // تأكد من استخدام المفاتيح الصحيحة هنا
    taskDescription = arguments['taskDescription'] ?? 'No Description';
    taskCountry = arguments['taskCountry'] ?? 'Unknown Country';
    taskCity = arguments['taskCity'] ?? 'Unknown City';
    taskLocation = arguments['taskLocation'] ?? 'Unknown Location';
    taskImages = List<String>.from(arguments['taskImages'] ?? []);
  }

  back(){
    Get.back();
  }
}
