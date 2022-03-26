import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_app/models/my_user.dart';

class MessageDTO {
  late String id;
  late MyUser user;
  late String message;
  late DateTime createdAt;
  MessageDTO({
    required this.id,
    required this.user,
    required this.message,
    required this.createdAt,
  });

  MessageDTO.create({required this.user, required this.message}) {
    createdAt = DateTime.now();
  }

  MessageDTO.convertFromSnapshot(QueryDocumentSnapshot<Object?> snapshot) {
    id = snapshot.id;

    var mapUser = snapshot.get("user");
    user = MyUser(
        avatar: mapUser['avatar'] ?? "",
        email: mapUser['email'] ?? "",
        name: mapUser['name'] ?? "",
        uid: mapUser['uid'] ?? "");
    message = snapshot.get('message');

    createdAt = DateTime.fromMillisecondsSinceEpoch(
        int.parse(snapshot.get('createdAt')));
  }

  String getTime() {
    int hour = createdAt.hour;
    int minute = createdAt.minute;
    String result = "";
    if (hour < 10) {
      result += "0";
    }
    result += hour.toString() + ":";

    if (minute < 10) {
      result += "0";
    }
    result += minute.toString();
    return result;
  }

  Map<String, dynamic> toJSON() {
    return {
      "user": user.toMap(),
      "message": message,
      "createdAt": createdAt.millisecondsSinceEpoch.toString()
    };
  }
}
