import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    return Expanded(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: chatRooms.length,
            itemBuilder: (context, index) {
              // return Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 8),
              //   child: ChatterCard(
              //       isRead: true,
              //       chatRoomDTO: chatRooms[index]['chatRoom']
              //           as QueryDocumentSnapshot<ChatRoomDTO>,
              //       lastMessageQuery: chatRooms[index]['lastMessage']
              //           as Future<QuerySnapshot<Object?>>),
              // );
              return FutureBuilder(
                  future: chatRooms[index]['lastMessage']
                      as Future<QuerySnapshot<Object?>>,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      QueryDocumentSnapshot data = snapshot.data!.docs[0];

                      MessageDTO lastMessage = MessageDTO(
                          id: data.id,
                          user: MyUser.setInformation(
                              uid: data.get('user.uid'),
                              name: data.get('user.name'),
                              email: data.get('user.email'),
                              avatar: data.get('user.avatar')),
                          message: data.get('content'),
                          createdAt: DateTime.fromMicrosecondsSinceEpoch(
                              (data.get('createdAt') as Timestamp)
                                  .microsecondsSinceEpoch));
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ChatterCard(
                            isRead: true,
                            chatRoomDTO: chatRooms[index]['chatRoom']
                                as QueryDocumentSnapshot<ChatRoomDTO>,
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
}
