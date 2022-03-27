import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_app/models/chat_room_dto.dart';
import 'package:flutter_chat_app/models/message_dto.dart';

class FriendsSearchProvider {
  final FirebaseFirestore firebaseFirestore;

  FriendsSearchProvider({required this.firebaseFirestore});

  Future<QuerySnapshot<Object?>> searchFriends(String keyword) async {
    if (keyword.contains("@")) {
      var result = firebaseFirestore
          .collection("users")
          .where("email", arrayContains: [keyword, keyword.split(" ")]).get();
      debugPrint("res $result");
      return result;
    } else {
      var result = firebaseFirestore
          .collection("users")
          .orderBy("name")
          .startAt([keyword]).endAt([keyword + '\uf8ff']).get();
      debugPrint("res $result");
      return result;
    }
  }
}
