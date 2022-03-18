import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/bottom_navigation.dart';
import 'package:flutter_chat_app/common/search_bar.dart';
import 'package:flutter_chat_app/constants/constants.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/services/auth.dart';

import '../widgets/home/chatters_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        const Padding(padding: EdgeInsets.all(0), child: SearchBar()),
        TextButton(
          onPressed: () async {
            await _authService.signOut();
          },
          child: const Text('Sign out'),
        ),
        ChatterList(),
      ]),
    );
  }
}
