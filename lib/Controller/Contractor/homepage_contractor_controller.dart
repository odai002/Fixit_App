import 'package:fixit/Core/constant/route.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../../data/data_source/Remote/contractor/task_service.dart';

class ContractorHomeController extends GetxController {
  var tasks = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  RxString contractStatus = "Accept".obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      isLoading(true);
      var fetchedTasks = await TaskService.fetchTasks();
      tasks.value = List<Map<String, dynamic>>.from(fetchedTasks);
    } catch (e) {
      Get.snackbar("Error", "An error occurred while fetching tasks");
    } finally {
      isLoading(false);
    }
  }

  void viewTaskDetails(Map<String, dynamic> task) {
    Get.toNamed(
      AppRoute.TaskDetailsPage,
      arguments: {
        'taskTitle': task['name'],
        'taskDescription': task['desc'],
        'taskCountry': task['country'],
        'taskCity': task['city'],
        'taskLocation': task['local'],
        'taskImages': task['images'],
      },
    );
  }
  void updateClick(String newStatus){
    contractStatus.value=newStatus;
    update();

  }
}
