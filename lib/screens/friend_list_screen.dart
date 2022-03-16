import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/auth_button.dart';
import 'package:flutter_chat_app/services/auth.dart';
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
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      const Padding(
        padding: EdgeInsets.all(0),
        child: SearchBar(),
      ),
      // AuthButton(
      //   buttonText: "Sign Out (Để tạm D:)",
      //   onPressed: () async {
      //     await _authService.signOut();
      //   },
      // ),
      FriendList(),
      const Padding(padding: EdgeInsets.all(0), child: SearchBar()),
      FriendList()
    ]));
  }
}
