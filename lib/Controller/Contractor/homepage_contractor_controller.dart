import 'package:get/get.dart';
import '../../Core/constant/route.dart';
import '../../data/data_source/Remote/contractor/task_service.dart';

class ContractorHomeController extends GetxController {
  var tasks = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  RxString contractStatus = "Accept".obs;

  @override
  void onInit() {
    super.onInit();
    fetchedTasks();
  }

  void fetchedTasks() async {
    TasksContractorService tasksContractorService = TasksContractorService();
    try {
      isLoading(true);
      var fetchedData = await tasksContractorService.getAllTasks();
      print("Fetched Tasks: $fetchedData");

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
  void updateClick(String newStatus){
    contractStatus.value=newStatus;
    update();
  }
}
