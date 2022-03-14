import 'package:flutter/material.dart';

import 'friend_card.dart';

class FriendList extends StatelessWidget {
  var friendList = [true, false, false, true];

  FriendList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          children: friendList
              .map((e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: FriendCard(
                      isOnline: e,
                    ),
                  ))
              .toList()),
    );
  }
}
