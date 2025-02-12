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
