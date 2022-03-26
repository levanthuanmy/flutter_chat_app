import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:flutter_chat_app/widgets/home/chatter_card.dart';

import '../../constants/ui_constant.dart';
import '../../models/chat_room_dto.dart';
import '../../models/message_dto.dart';
import '../../models/my_user.dart';

class ChatterList extends StatelessWidget {
  var chatterList = [false, true, true, false, true, false, true];
  final List<QueryDocumentSnapshot<ChatRoomDTO>> querySnapshots;
  final List<Map<String, Object>> chatRooms;
  ChatterList({Key? key, required this.querySnapshots, required this.chatRooms})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("Chatter list checkpoint");
    return Expanded(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: chatRooms.length,
            itemBuilder: (context, index) {
              return FutureBuilder(
                  future: chatRooms[index]['lastMessage']
                      as Future<QuerySnapshot<Object?>>,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.docs.isEmpty) {
                        return SizedBox();
                      }
                      QueryDocumentSnapshot data = snapshot.data!.docs[0];
                      debugPrint("data from last msg $data");
                      MessageDTO lastMessage = MessageDTO(
                          id: data.id,
                          user: MyUser.setInformation(
                              uid: data.get('user.uid') ?? "",
                              name: data.get('user.name') ?? "",
                              email: data.get('user.email') ?? "",
                              avatar: data.get('user.avatar') ?? ""),
                          message: data.get('message'),
                          createdAt: DateTime.fromMillisecondsSinceEpoch(
                              int.parse(data.get('createdAt'))));
                      debugPrint("line 46 last message $lastMessage");
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ChatterCard(
                            isRead: true,
                            peer: getPeer(chatRooms[index]['chatRoom']
                                as QueryDocumentSnapshot<ChatRoomDTO>),
                            chatRoomId: (chatRooms[index]['chatRoom']
                                    as QueryDocumentSnapshot<ChatRoomDTO>)
                                .id,
                            lastMessage: lastMessage,
                            lastMessageQuery: chatRooms[index]['lastMessage']
                                as Future<QuerySnapshot<Object?>>),
                      );
                    }
                    if (snapshot.hasError) {
                      debugPrint("Get last msg error ${snapshot.error}");
                      return const Text("Error");
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: UIConstant.primary,
                        ),
                      );
                    }
                  });
            }));
  }

  MyUser getPeer(QueryDocumentSnapshot<ChatRoomDTO> chatRoom) {
    MyUser peer = MyUser.create(name: "", email: "");
    Map<String, dynamic> users =
        Map<String, dynamic>.from(chatRoom.get("users"));
    debugPrint("users $users");
    users.forEach(((uid, user) {
      if (uid != AuthService().getUserId()) {
        peer = MyUser(
            avatar: user['avatar'] ?? "",
            email: user['email'] ?? "",
            name: user['name'] ?? "",
            uid: user['uid'] ?? "");
      }
    }));
    return peer;
  }
}
