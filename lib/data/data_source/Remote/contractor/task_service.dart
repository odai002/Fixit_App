import 'dart:convert';

import 'package:http/http.dart'as http;
class TaskService{
  static Future<List<dynamic>> fetchTasks() async {
    final url = Uri.parse('https://yourapi.com/user/tasks');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load tasks , please try again');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');  // رمي استثناء في حال حدوث خطأ
    }
  }
}