import 'package:flutter/material.dart';

import 'friend_card.dart';

class FriendList extends StatelessWidget {
  final List<String> listUserId;

  const FriendList({Key? key, required this.listUserId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: listUserId
            .map(
              (userId) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: FriendCard(
                  isOnline: true,
                  userId: userId,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
