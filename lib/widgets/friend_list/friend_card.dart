import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/avatar.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/models/my_user.dart';

import '../../screens/chat_room_screen.dart';

class FriendCard extends StatelessWidget {
  final bool isOnline;
  final MyUser friend;
  const FriendCard({Key? key, required this.isOnline, required this.friend})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatRoomScreen(
              chatRoomID: '',
            ),
          ),
        );
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
            Avatar(height: 40, width: 40),
            SizedBox(
              width: 8,
            ),
            // Name and chat preview
            Expanded(
              child: Text(
                friend.name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
