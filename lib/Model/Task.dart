// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fixit/Model/HomeOwner.dart';
import 'package:fixit/Model/TaskImage.dart';

class Task {
  int? id;
  Homeowner? user;
  int? contractorId;
  int? contract_id;
  bool? is_finish;
  String? title;
  String? description;
  String? location;
  String? country;
  String? city;
  var status;
  bool? hasContract;
  List<TaskImage>? taskImage;

  Task(
      {this.id,
      this.user,
      this.contractorId,
      this.title,
      this.description,
      this.location,
      this.country,
      this.city,
      this.status,
      this.hasContract,
      this.taskImage});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? Homeowner.fromJson(json['user']) : null;
    contractorId = json['contractor_id'];
    contract_id = json['contract_id'];
    is_finish = json['is_finish'] == 1;
    title = json['title'];
    description = json['description'];
    location = json['location'];
    country = json['country'];
    city = json['city'];
    status = json['status'];
    hasContract = json['has_contract'];
    if (json['task_image'] != null) {
      taskImage = <TaskImage>[];
      json['task_image'].forEach((v) {
        taskImage!.add(TaskImage.fromJson(v));
      });
    }
  }
}
