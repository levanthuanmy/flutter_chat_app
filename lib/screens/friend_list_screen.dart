import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/auth_button.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:flutter_chat_app/widgets/friend_list/friend_list.dart';
import 'package:provider/provider.dart';

import '../common/bottom_navigation.dart';
import '../common/search_bar.dart';
import '../constants/constants.dart';
import '../constants/ui_constant.dart';
import '../models/my_user.dart';

class FriendListScreen extends StatefulWidget {
  const FriendListScreen({Key? key}) : super(key: key);

  @override
  State<FriendListScreen> createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen> {
  final AuthService _authService = AuthService();
  DatabaseReference database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    final MyUser? user = Provider.of<MyUser?>(context);
    final DatabaseReference friendsListRef =
        database.child('/users/${user?.uid}/friendsList');
    Future<DatabaseEvent> futureFriendsListEvent = friendsListRef.once();

    return FutureBuilder(
      future: futureFriendsListEvent,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        DatabaseEvent friendsList = snapshot.data;
        print(friendsList.snapshot.value);

        return SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(0),
                child: SearchBar(),
              ),
              FriendList(),
            ],
          ),
        );
      },
    );
  }
}
