import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:flutter_chat_app/widgets/friend_list/friend_list.dart';
import 'package:provider/provider.dart';

import '../common/search_bar.dart';
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

    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: usersRef.doc(user?.uid).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(0),
                  child: SearchBar(),
                ),
                FriendList(
                  listUserId:
                      List<String>.from(snapshot.data!.data()['friendsList']),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Error');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
