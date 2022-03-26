import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/message_dto.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:flutter_chat_app/widgets/chat_room/message_card.dart';

import '../../models/my_user.dart';

String fakeUserId = "1";

class MessagesList extends StatelessWidget {
  // final List<MessageDTO> messagesList = [
  //   MessageDTO.create(
  //       user: MyUser(
  //           uid: "1",
  //           name: "Naruto Uzumaki",
  //           email: "a",
  //           avatar:
  //               "https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/7/11/narutossagemode-15944657133061535033027.png"),
  //       message: "Mã hóa cửu vỹ bằng base64"),
  //   MessageDTO.create(
  //       user: MyUser(
  //           uid: "1",
  //           name: "Naruto Uzumaki",
  //           email: "a",
  //           avatar:
  //               "https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/7/11/narutossagemode-15944657133061535033027.png"),
  //       message: "Mã hóa cửu vỹ bằng sha256"),
  //   MessageDTO.create(
  //       user: MyUser(
  //           uid: "3",
  //           name: "Naruto Uzumaki",
  //           email: "a",
  //           avatar:
  //               "https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/7/11/narutossagemode-15944657133061535033027.png"),
  //       message: "Mã hóa cửu vỹ bằng hex"),
  //   MessageDTO.create(
  //       user: MyUser(
  //           uid: "3",
  //           name: "Naruto Uzumaki",
  //           email: "a",
  //           avatar:
  //               "https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/7/11/narutossagemode-15944657133061535033027.png"),
  //       message: "Mã hóa cửu vỹ bằng hex"),
  //   MessageDTO.create(
  //       user: MyUser(
  //           uid: "3",
  //           name: "Naruto Uzumaki",
  //           email: "a",
  //           avatar:
  //               "https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/7/11/narutossagemode-15944657133061535033027.png"),
  //       message: "Mã hóa cửu vỹ bằng hex"),
  //   MessageDTO.create(
  //       user: MyUser(
  //           uid: "1",
  //           name: "Naruto Uzumaki",
  //           email: "a",
  //           avatar:
  //               "https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/7/11/narutossagemode-15944657133061535033027.png"),
  //       message: "Mã hóa cửu vỹ bằng hex")
  // ];
  final List<MessageDTO> messagesList;

  final ScrollController listScrollController;
  MessagesList(
      {Key? key,
      required this.messagesList,
      required this.listScrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.animateTo(
    //   controller.position.maxScrollExtent,
    //   curve: Curves.easeOut,
    //   duration: const Duration(milliseconds: 300),
    // );
    return Expanded(
        child: ListView.builder(
      itemCount: messagesList.length,
      controller: listScrollController,
      physics: const BouncingScrollPhysics(),
      reverse: true,
      itemBuilder: (context, index) {
        bool isPreviousUser = false;
        // check if user A sends last msg and take turn to user B => if true, show the time sent
        bool isLastMessageOfUser = true;
        if (index < messagesList.length - 1) {
          if (messagesList[index + 1].user.uid ==
              messagesList[index].user.uid) {
            isPreviousUser = true;
          }
        } else {
          if (messagesList[index].user.uid ==
              messagesList[index - 1].user.uid) {
            isPreviousUser = true;
          }
        }

        if (index > 0) {
          if (messagesList[index].user.uid ==
              messagesList[index - 1].user.uid) {
            isLastMessageOfUser = false;
          }
        }
        return MessageCard(
          message: messagesList[index],
          isUserSent: messagesList[index].user.uid == AuthService().getUserId(),
          isPreviousUser: isPreviousUser,
          isLastMessageOfUser: isLastMessageOfUser,
        );
      },
    ));
  }
}
