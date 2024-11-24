import 'dart:convert';
import 'package:fixit/Core/constant/route.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../../../../Core/constant/link_api.dart';
import '../auth/signin_service.dart';

class TasksContractorService {
  Future<List<Map<String, dynamic>>> getAllTasks() async {
    final url = Uri.parse(AppLink.getMyTasks);
    SigninService signInService = SigninService();
    String? token = await signInService.getToken();
    try {
      final response = await http.get(url, headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        if (body['data'] != null) {
          List<Map<String, dynamic>> tasks = List<Map<String, dynamic>>.from(body['data']);

          for (var task in tasks) {
            var taskId = task['id'];
            var status = task['status'];
          }
          return tasks;
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  Future<bool> deleteTask(int taskId) async {
    SigninService signInService = SigninService();
    String? token = await signInService.getToken();
    final url = Uri.parse(AppLink.deleteTask(taskId));
    try {
      final response = await http.post(url,
          body: jsonEncode({
            'status': false,
            'id': taskId,
          }),
          headers: {
            'Content-Type': 'application/json',
            "Authorization": "Bearer $token"
          });
      if (response.statusCode == 200) {
        print("Task with ID $taskId deleted successfully.");
        return true;
      } else {
        throw Exception('Failed to delete task');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }



  Future<bool> acceptTask(int taskId) async {
    SigninService signInService = SigninService();
    String? token = await signInService.getToken();
    final url = Uri.parse(AppLink.acceptTask(taskId));
    try {
      print("Accept Task with ID: $taskId");

      final response = await http.post(url,
          body: jsonEncode({
            'status': true,
            'id': taskId,
          }),
          headers: {
            'Content-Type': 'application/json',
            "Authorization": "Bearer $token"
          });
      print("taskid is :$taskId");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final taskData = responseBody['data'];

        Get.toNamed(AppRoute.ContractPage,arguments:
        {'task':taskData,
        });
        print("Task with ID $taskId accept successfully.");
        return true;
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        throw Exception('Failed to accept task');
      }
    } catch (e) {
      print('Error in AcceptTask: $e');
      throw Exception('Error occurred: $e');
    }
  }

}
