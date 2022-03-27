import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/avatar.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/models/my_user.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:flutter_chat_app/services/chat_provider.dart';
import 'package:provider/provider.dart';

import '../../screens/chat_room_screen.dart';

class FriendSearchCard extends StatefulWidget {
  final MyUser friend;
  const FriendSearchCard({Key? key, required this.friend}) : super(key: key);

  @override
  State<FriendSearchCard> createState() => _FriendSearchCardState();
}

class _FriendSearchCardState extends State<FriendSearchCard> {
  late ChatProvider _chatProvider;

  MyUser get friend => widget.friend;

  @override
  void initState() {
    super.initState();
    // chatController.addListener(() {
    //   setState(() {});
    // });
    _chatProvider = context.read<ChatProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const ChatRoomScreen(
        //       chatRoomID: "",
        //     ),
        //   ),
        // );
        var chatRoom = await _chatProvider.findChatRoom(
            AuthService().currentUser!, friend);

        debugPrint("${chatRoom.id}");
      },
      style: TextButton.styleFrom(
        primary: UIConstant.black,
        textStyle: TextStyle(
          color: UIConstant.black,
        ),
      ),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avatar
            Avatar(height: 40, width: 40, avatar: widget.friend.avatar),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                  // snapshot.data!.data()['name'],
                  widget.friend.name.isEmpty
                      ? widget.friend.email
                      : widget.friend.name),
            ),
          ],
        ),
      ),
    );
  }
}
