import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/friends_search_screen.dart';

import '../constants/ui_constant.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Material(
    //   child: TextField(
    //     cursorColor: UIConstant.white,
    //     style: TextStyle(color: UIConstant.white),
    //     textAlignVertical: TextAlignVertical.center,
    //     onTap: () {
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (_) => const FriendsSearchScreen()));
    //     },

    //     decoration: InputDecoration(
    //       // hintStyle: TextStyle(color: UIConstant.secondary),
    //       // contentPadding: EdgeInsets.zero,

    //       filled: true,
    //       fillColor: UIConstant.primary,

    //       prefixIcon: Icon(Icons.search, color: UIConstant.white),
    //       // border: OutlineInputBorder(
    //       //   borderSide: BorderSide.none,
    //       //   // borderRadius: BorderRadius.circular(UIConstant.borderRadius),
    //       // ),
    //     ),
    //   ),
    // );
    return Container(
      color: UIConstant.primary,
      height: 56,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const FriendsSearchScreen()));
        },
        child: Row(
          children: [
            Icon(Icons.search, color: UIConstant.white),
            Text(
              "Search friends...",
              style: TextStyle(color: UIConstant.tertiary),
            )
          ],
        ),
      ),
    );
  }
}
