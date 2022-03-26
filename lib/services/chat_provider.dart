import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_app/models/chat_room_dto.dart';

class ChatProvider {
  final FirebaseFirestore firebaseFirestore;

  ChatProvider({required this.firebaseFirestore});

  Stream<QuerySnapshot<ChatRoomDTO>> getChatRooms(String userUID, int limit) {
    debugPrint("userUID $userUID");
    var result = firebaseFirestore
        .collection("chatRooms")
        .where("users.$userUID.uid", isEqualTo: userUID)
        .orderBy("lastActive", descending: true)
        .limit(limit)
        .withConverter<ChatRoomDTO>(
            fromFirestore: (snapshot, _) =>
                ChatRoomDTO.fromJSON(snapshot.data()!),
            toFirestore: (chatroom, _) => chatroom.toJSON())
        .snapshots();
    debugPrint("res $result");
    return result;
  }

  Future<QuerySnapshot> getLastMessage(String chatRoomID) {
    var result = firebaseFirestore
        .collection("messages")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("createdAt", descending: true)
        .limit(1)
        .get();
    debugPrint("res $result");
    return result;
  }
}
