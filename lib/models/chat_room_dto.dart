import 'package:flutter_chat_app/models/message_dto.dart';
import 'package:flutter_chat_app/models/my_user.dart';
import 'package:flutter_chat_app/widgets/chat_room/message_card.dart';

class ChatRoomDTO {
  late String id;
  late List<MyUser> users;
  late DateTime lastActive;

  ChatRoomDTO.create({
    this.users = const [],
  }) {
    lastActive = DateTime.now();
  }

  ChatRoomDTO.fromJSON(Map<String, Object?> json) {
    id = json['id']! as String;
    var mapUsers = json['users']! as Map<String, dynamic>;
    users = [];

    mapUsers.forEach(((uid, value) {
      MyUser user = MyUser(
          avatar: value['avatar'] ?? "",
          email: value['email'] ?? "",
          name: value['name'] ?? "",
          uid: value['uid'] ?? "");
      users.add(user);
    }));
    lastActive = DateTime.fromMillisecondsSinceEpoch(json['lastActive'] as int);
  }

  Map<String, Object> toJSON() {
    return {
      "id": id,
      "users": {for (var e in users) e.uid: e.toMap()},
      "lastActive": lastActive.toIso8601String()
    };
  }

  // no id to create new chat room on firebase
  Map<String, Object> createNewChatRoom() {
    return {
      "users": {for (var e in users) e.uid: e.toMap()},
      "lastActive": lastActive.millisecondsSinceEpoch
    };
  }
}
