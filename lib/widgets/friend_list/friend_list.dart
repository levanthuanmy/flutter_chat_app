import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/my_user.dart';

import 'friend_card.dart';

class FriendList extends StatelessWidget {
  final Map<String, MyUser> listFriend;

  const FriendList({Key? key, required this.listFriend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MyUser> listFriendUser = [];

    listFriend.forEach((uid, user) {
      listFriendUser.add(
        MyUser(uid: user.uid, name: user.name, email: user.email, avatar: ""),
      );
    });

    return Expanded(
      child: ListView(
        children: listFriendUser
            .map(
              (friend) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: FriendCard(
                  isOnline: true,
                  friend: friend,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
