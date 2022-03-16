import 'package:flutter/material.dart';

import '../../constants/ui_constant.dart';

class MessageField extends StatelessWidget {
  final TextEditingController chatController;
  const MessageField({Key? key, required this.chatController})
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
          chatController.text.isNotEmpty ? buildSendButton() : const SizedBox(),
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
      onPressed: () {},
      child: const Center(
        child: Icon(
          Icons.send,
          size: 24,
        ),
      ),
    );
  }
}
