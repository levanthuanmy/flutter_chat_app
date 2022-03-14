// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/constants.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  int currentIndex = BottomNavigationIndex.home.index;

  CustomBottomNavigationBar(this.currentIndex, {Key? key}) : super(key: key);

  final List _children = ["/home", "/friends", "/setting"];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: UIConstant.white,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 28),
        onTap: (selectedIndex) {
          if (selectedIndex != currentIndex) {
            Navigator.pushNamed(context, _children[selectedIndex]);
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.messenger), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ]);
  }
}
