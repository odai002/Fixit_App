class Notification {
  int? id;
  int? senderId;
  int? reciverId;
  String? type;
  String? content;
  int? isRead;
  int? idAction;
  dynamic created_at;

  Notification(
      {this.id,
      this.senderId,
      this.reciverId,
      this.type,
      this.content,
      this.isRead,
      this.idAction,
      this.created_at});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    reciverId = json['reciver_id'];
    type = json['type'];
    content = json['content'];
    isRead = json['is_read'];
    idAction = json['id_action'];
    created_at = json['created_at'];
  }
}
