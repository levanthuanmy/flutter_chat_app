import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/friends_search/friend_search_bar.dart';

class FriendsSearchScreen extends StatefulWidget {
  const FriendsSearchScreen({Key? key}) : super(key: key);

  @override
  State<FriendsSearchScreen> createState() => _FriendsSearchScreenState();
}

class _FriendsSearchScreenState extends State<FriendsSearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FriendSearchBar(controller: searchController),
          ],
        ),
      ),
    );
  }
}
