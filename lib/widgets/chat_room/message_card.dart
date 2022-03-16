import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/avatar.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/models/message-dto.dart';
import 'package:flutter_chat_app/models/my_user.dart';

class MessageCard extends StatelessWidget {
  final MessageDTO message;
  bool isUserSent; // nếu message thuộc về user
  bool isPreviousUser; // nếu là người cuối cùng nhắn lần trước
  MessageCard(
      {Key? key,
      required this.message,
      required this.isUserSent,
      required this.isPreviousUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(top: isPreviousUser ? 4 : 16, right: 8, left: 8),
        child: isUserSent ? buildUserSent(context) : buildPartnerSent(context));
  }

  Widget buildUserSent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
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
              Text(
                message.getTime(),
                style: TextStyle(color: UIConstant.tertiary),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPartnerSent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Avatar(height: 32, width: 32),
        const SizedBox(
          width: 8,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: UIConstant.tertiary,
              borderRadius: BorderRadius.circular(UIConstant.borderRadius)),
          constraints: BoxConstraints(
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
