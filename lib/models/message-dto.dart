import 'package:flutter_chat_app/models/my_user.dart';

class MessageDTO {
  late String id;
  MyUser user;
  String message;
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
}
