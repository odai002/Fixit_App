import 'package:fixit/Model/Task.dart';

class Contract {
  int? id;
  int? taskId;
  String? paymentDate;
  int? price;
  String? endDate;
  int? completationStatus;
  int? status;
  Task? task;

  Contract(
      {this.id,
      this.taskId,
      this.paymentDate,
      this.price,
      this.endDate,
      this.completationStatus,
      this.status,
      this.task});

  Contract.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskId = json['task_id'];
    paymentDate = json['payment_date'];
    price = json['price'];
    endDate = json['end_date'];
    completationStatus = json['completation_status'];
    status = json['status'];
    task = json['task'] != null ? Task.fromJson(json['task']) : null;
  }
}
