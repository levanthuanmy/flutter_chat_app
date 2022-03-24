import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/avatar.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';

import '../../screens/chat_room_screen.dart';

class FriendCard extends StatelessWidget {
  final bool isOnline;
  final String userId;
  const FriendCard({Key? key, required this.isOnline, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');

    return FutureBuilder(
      future: usersRef.doc(userId).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatRoomScreen(),
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
                      snapshot.data!.data()['name'],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return const Text('error');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
