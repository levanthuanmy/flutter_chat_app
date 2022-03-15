import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/widgets/chat_room/message_field.dart';
import 'package:flutter_chat_app/widgets/chat_room/messages_list.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController chatController = TextEditingController();

  String get message => chatController.text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Goback button, Title
            Row(
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(40, 40),
                        alignment: Alignment.center),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.chevron_left)),
                Text(
                  "Jonny Seen",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: UIConstant.fontNameTitle),
                )
              ],
            ),
            MessagesList(),
            // Message text field
            MessageField(
              chatController: chatController,
            )
          ],
        ),
      ),
    );
  }
}
