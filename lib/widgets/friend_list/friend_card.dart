import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/avatar.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';

import '../../screens/chat_room_screen.dart';

class FriendCard extends StatelessWidget {
  final bool isOnline;
  const FriendCard({Key? key, required this.isOnline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatRoomScreen()));
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
            Avatar(height: 40, width: 40),
            const SizedBox(
              width: 8,
            ),
            // Name and chat preview
            const Expanded(
              child: Text(
                "John Dove",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
