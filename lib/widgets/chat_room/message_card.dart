import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/avatar.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/models/message_dto.dart';
import 'package:flutter_chat_app/models/my_user.dart';

class MessageCard extends StatelessWidget {
  final MessageDTO message;
  bool isUserSent; // nếu message thuộc về user
  bool isPreviousUser; // nếu là người cuối cùng nhắn lần trước
  bool isLastMessageOfUser; // nếu tin nhắn đó dừng qua sang người khác
  MessageCard(
      {Key? key,
      required this.message,
      required this.isUserSent,
      required this.isLastMessageOfUser,
      required this.isPreviousUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(top: isPreviousUser ? 4 : 16, right: 8, left: 8),
        child:
            isUserSent ? buildCurrenUserSent(context) : buildPeerSent(context));
  }

  Widget buildCurrenUserSent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          constraints: BoxConstraints(
            minWidth: 64,
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          decoration: BoxDecoration(
              color: UIConstant.primary,
              borderRadius: BorderRadius.circular(UIConstant.borderRadius)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message.message, style: TextStyle(color: UIConstant.white)),
              const SizedBox(
                height: 8,
              ),
              isLastMessageOfUser
                  ? Text(
                      message.getTime(),
                      style: TextStyle(color: UIConstant.tertiary),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPeerSent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Avatar(height: 32, width: 32),
        const SizedBox(
          width: 8,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: UIConstant.tertiary,
              borderRadius: BorderRadius.circular(UIConstant.borderRadius)),
          constraints: BoxConstraints(
            minWidth: 64,
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(message.message),
              const SizedBox(
                height: 8,
              ),
              Text(
                message.getTime(),
                style: TextStyle(color: UIConstant.secondary),
              )
            ],
          ),
        ),
      ],
    );
  }
}
