import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/message_dto.dart';
import 'package:flutter_chat_app/services/auth.dart';

import '../../constants/ui_constant.dart';

class MessageField extends StatelessWidget {
  final TextEditingController chatController;
  final Function(MessageDTO) handleSendMessage;
  const MessageField(
      {Key? key, required this.chatController, required this.handleSendMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 16),
      color: UIConstant.tertiary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
                controller: chatController,
                maxLines: null,
                textInputAction: TextInputAction.newline,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Aa")),
          ),
          buildSendButton(),
        ],
      ),
    );
  }

  Widget buildSendButton() {
    return TextButton(
      style: TextButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          minimumSize: const Size(40, 40),
          alignment: Alignment.center),
      onPressed: sendMessage,
      child: const Center(
        child: Icon(
          Icons.send,
          size: 24,
        ),
      ),
    );
  }

  void sendMessage() {
    if (chatController.text.isNotEmpty) {
      MessageDTO message = MessageDTO.create(
          user: AuthService().currentUser!, message: chatController.text);
      handleSendMessage(message);
    }
  }
}
