import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/my_user.dart';
import 'package:flutter_chat_app/services/friends_search_provider.dart';
import 'package:flutter_chat_app/widgets/friends_search/friend_search_bar.dart';
import 'package:flutter_chat_app/widgets/friends_search/friend_search_list.dart';
import 'package:provider/provider.dart';

import '../constants/ui_constant.dart';

class FriendsSearchScreen extends StatefulWidget {
  const FriendsSearchScreen({Key? key}) : super(key: key);

  @override
  State<FriendsSearchScreen> createState() => _FriendsSearchScreenState();
}

class _FriendsSearchScreenState extends State<FriendsSearchScreen> {
  final TextEditingController searchController = TextEditingController();
  late FriendsSearchProvider friendsSearchProvider;
  List<MyUser> listFriends = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchController;
      });
    });
    friendsSearchProvider = context.read<FriendsSearchProvider>();
  }

  onSearch() async {
    setState(() {
      isLoading = true;
    });
    List<MyUser> temp = [];

    if (searchController.text.isNotEmpty) {
      var result =
          await friendsSearchProvider.searchFriends(searchController.text);
      debugPrint("search result ${result.docs}");
      for (var doc in result.docs) {
        MyUser friend = MyUser.fromDoc(doc);
        temp.add(friend);
        debugPrint(friend.uid);
      }
    }
    setState(() {
      isLoading = false;
      listFriends = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FriendSearchBar(
              controller: searchController,
              onSearch: onSearch,
            ),
            isLoading
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: UIConstant.primary,
                      ),
                    ),
                  )
                : FriendsSearchList(
                    listFriends: listFriends,
                    setLoading: () {
                      setState(() {
                        isLoading = true;
                      });
                    },
                  )
          ],
        ),
      ),
    );
  }
}
