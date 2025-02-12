// ignore_for_file: prefer_typing_uninitialized_variables

class Receipt {
  int? id;
  int? contractId;
  int? amount;
  int? status;
  int? forReview;
  var warningDays;
  Contract? contract;
  List<ReceiptImage>? receiptImage;

  Receipt(
      {this.id,
      this.contractId,
      this.amount,
      this.status,
      this.forReview,
      this.warningDays,
      this.contract,
      this.receiptImage});

  Receipt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractId = json['contract_id'];
    amount = json['amount'];
    status = json['status'];
    forReview = json['for_review'];
    warningDays = json['warning_days'];
    contract =
        json['contract'] != null ? Contract.fromJson(json['contract']) : null;
    if (json['receipt_image'] != null) {
      receiptImage = <ReceiptImage>[];
      json['receipt_image'].forEach((v) {
        receiptImage!.add(ReceiptImage.fromJson(v));
      });
    }
  }
}

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

class Task {
  int? id;
  int? userId;
  int? contractorId;
  String? title;
  String? description;
  String? location;
  String? country;
  String? city;
  int? status;
  List<TaskImage>? taskImage;

  Task(
      {this.id,
      this.userId,
      this.contractorId,
      this.title,
      this.description,
      this.location,
      this.country,
      this.city,
      this.status,
      this.taskImage});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    contractorId = json['contractor_id'];
    title = json['title'];
    description = json['description'];
    location = json['location'];
    country = json['country'];
    city = json['city'];
    status = json['status'];
    if (json['task_image'] != null) {
      taskImage = <TaskImage>[];
      json['task_image'].forEach((v) {
        taskImage!.add(TaskImage.fromJson(v));
      });
    }
  }
}

class TaskImage {
  int? id;
  int? taskId;
  int? imageId;
  Image? image;

  TaskImage({this.id, this.taskId, this.imageId, this.image});

  TaskImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskId = json['task_id'];
    imageId = json['image_id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }
}

class Image {
  int? id;
  String? name;

  Image({this.id, this.name});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class ReceiptImage {
  int? id;
  int? receiptId;
  int? imageId;
  Image? image;

  ReceiptImage({this.id, this.receiptId, this.imageId, this.image});

  ReceiptImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    receiptId = json['receipt_id'];
    imageId = json['image_id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }
}
