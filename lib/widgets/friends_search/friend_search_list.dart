import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/my_user.dart';
import 'package:flutter_chat_app/widgets/friends_search/friend_search_card.dart';

class FriendsSearchList extends StatelessWidget {
  final List<MyUser> listFriends;

  const FriendsSearchList({Key? key, required this.listFriends})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: listFriends.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: FriendSearchCard(
                  friend: listFriends[index],
                ),
              );
            })));
  }
}
