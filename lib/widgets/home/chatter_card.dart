import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/models/message_dto.dart';
import 'package:flutter_chat_app/models/my_user.dart';
import 'package:flutter_chat_app/screens/chat_room_screen.dart';

class ChatterCard extends StatelessWidget {
  final bool isRead;
  final MyUser peer;
  final Future<QuerySnapshot> lastMessageQuery;
  final MessageDTO lastMessage;
  final String chatRoomId;
  ChatterCard(
      {Key? key,
      required this.isRead,
      required this.chatRoomId,
      required this.lastMessageQuery,
      required this.lastMessage,
      required this.peer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatRoomScreen(
                      chatRoomID: chatRoomId,
                    )));
      },
      style: TextButton.styleFrom(
          primary: UIConstant.black,
          textStyle: TextStyle(
            color: UIConstant.black,
          )),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avatar
            Container(
              height: 60,
              width: 60,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                peer.avatar?.isNotEmpty == true && peer.avatar != null
                    ? peer.avatar!
                    : "https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/7/11/narutossagemode-15944657133061535033027.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            // Name and chat preview
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    peer.name.isNotEmpty == true ? peer.name : peer.email,
                    style: TextStyle(
                      fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  // Text(
                  //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type ",
                  //     overflow: TextOverflow.ellipsis,
                  //     style: TextStyle(
                  //       fontWeight:
                  //           isRead ? FontWeight.normal : FontWeight.bold,
                  //     ))
                  buildLastMsg()
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(lastMessage.getTime(),
                    style: TextStyle(
                      fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                    )),
                const SizedBox(
                  height: 8,
                ),
                isRead
                    ? const SizedBox()
                    : Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: UIConstant.primary, shape: BoxShape.circle),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildLastMsg() {
    String message = peer.uid != lastMessage.user.uid ? "You: " : "";
    message += lastMessage.message;
    return Text(message,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
        ));
    // return FutureBuilder(
    //     future: lastMessageQuery,
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasData) {
    //         return Text(lastMessage?.message ?? "",
    //             overflow: TextOverflow.ellipsis,
    //             style: TextStyle(
    //               fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
    //             ));
    //       }
    //       if (snapshot.hasError) {
    //         debugPrint("Get last msg error ${snapshot.error}");
    //         return const Text("Error");
    //       } else {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: UIConstant.primary,
    //           ),
    //         );
    //       }
    //     });
  }
}
