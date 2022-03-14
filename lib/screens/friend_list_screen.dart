import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/friend_list/friend_list.dart';

import '../common/bottom_navigation.dart';
import '../common/search_bar.dart';
import '../constants/constants.dart';
import '../constants/ui_constant.dart';

class FriendListScreen extends StatefulWidget {
  const FriendListScreen({Key? key}) : super(key: key);

  @override
  State<FriendListScreen> createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Padding(
            padding: const EdgeInsets.all(0),
            child: SearchBar(controller: TextEditingController())),
        FriendList()
      ])),
      bottomNavigationBar:
          CustomBottomNavigationBar(BottomNavigationIndex.friend.index),
    );
  }
}
