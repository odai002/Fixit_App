import 'dart:developer';

import 'package:fixit/data/data_source/Remote/auth/signin_service.dart';
import 'package:get/get.dart';
import '../../Core/constant/route.dart';
import '../../data/data_source/Remote/contractor/task_service.dart';

class ContractorHomeController extends GetxController {
  var tasks = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  RxString contractStatus = "Accept".obs;


  void fetchedTasks() async {
    TasksContractorService tasksContractorService = TasksContractorService();
    try {
      isLoading(true);
      var fetchedData = await tasksContractorService.getAllTasks();
      log("Fetched Tasks: $fetchedData");

      if (fetchedData.isNotEmpty) {
        tasks.value = fetchedData;
      } else {
        print("No tasks found in fetched data");
        tasks.value = [];
      }
    } catch (e) {
      print("Error while fetching tasks: $e");
      Get.snackbar("Error", "An error occurred while fetching tasks");
    } finally {
      isLoading(false);
    }
  }


  void viewTaskDetails(Map<String, dynamic> task) {
    if (isLoading.value == false) {
      var taskData = tasks.firstWhere(
            (t) => t['id'] == task['id'],
        orElse: () => <String, dynamic>{},
      );

      if (taskData.isNotEmpty) {
        Get.toNamed(AppRoute.TaskDetailsPage, arguments: {
          'taskTitle': taskData['title'] ?? 'No Title',
          'taskDescription': taskData['description'] ?? 'No Description',
          'taskCountry': taskData['country'] ?? 'Unknown Country',
          'taskCity': taskData['city'] ?? 'Unknown City',
          'taskLocation': taskData['location'] ?? 'Unknown Location',
          'taskImages': List<String>.from(taskData['task_image'] ?? []),
        });
      } else {
        print("Task not found");
      }
    } else {
      print("Tasks are still loading...");
    }
  }

  void updateClick(String newStatus) async {
    /*try {
      // Simulate sending the contract to the server
      ContractController contractController =ContractController();
      var response = await contractController.sendContract(taskId);

      if (response == true) {
        // Update the contract status to "Waiting" after successful submission
        contractStatus.value = "Waiting";
        Get.snackbar("Success", "Contract sent successfully!");
      } else {
        Get.snackbar("Error", "Failed to send the contract.");
      }
    } catch (e) {
      print("Error while sending contract: $e");
      Get.snackbar("Error", "An error occurred while sending the contract.");
    } finally {
      update(); // Notify listeners of the status update
    }
  }*/
  }

  @override
  void onInit() async{
    SigninService signinService=SigninService();
    String? token= await signinService.getToken();
    print(token);
    super.onInit();
    fetchedTasks();
  }
}
