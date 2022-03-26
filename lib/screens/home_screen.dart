import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/bottom_navigation.dart';
import 'package:flutter_chat_app/common/search_bar.dart';
import 'package:flutter_chat_app/constants/constants.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/models/chat_room_dto.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:flutter_chat_app/services/chat_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/home/chatters_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();
  late ChatProvider _chatProvider;
  String userUID = AuthService().getUserId()!;
  int _limit = 20;
  int _limitIncrement = 20;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _chatProvider = context.read<ChatProvider>();
  }

  @override
  Widget build(BuildContext context) {
    print(AuthService().getUserId());
    return SafeArea(
      child: Column(children: [
        const Padding(padding: EdgeInsets.all(0), child: SearchBar()),
        TextButton(
          onPressed: () async {
            await _authService.signOut();
          },
          child: const Text('Sign out'),
        ),
        StreamBuilder<QuerySnapshot<ChatRoomDTO>>(
            stream:
                _chatProvider.getChatRooms(AuthService().getUserId()!, _limit),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<ChatRoomDTO>> snapshot) {
              debugPrint("snapshot: ${snapshot}");
              List<Map<String, Object>> data = [];

              if (snapshot.hasData) {
                debugPrint("data ${snapshot.data!.docs}");
                for (var i in snapshot.data!.docs) {
                  print("ID ${i.id}");
                  print("User ${i['users']}");
                  var lastMessage = _chatProvider.getLastMessage(i.id);
                  data.add({"lastMessage": lastMessage, "chatRoom": i});
                  debugPrint("Last msg $lastMessage");
                }

                return ChatterList(
                  querySnapshots: snapshot.data!.docs,
                  chatRooms: data,
                );
              } else if (snapshot.hasError) {
                debugPrint("${snapshot.error}");
                return Text("Error");
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: UIConstant.primary,
                  ),
                );
              }
            }),
      ]),
    );
  }
}
