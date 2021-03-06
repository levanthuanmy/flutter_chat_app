import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/models/message_dto.dart';
import 'package:flutter_chat_app/services/chat_provider.dart';
import 'package:flutter_chat_app/widgets/chat_room/message_field.dart';
import 'package:flutter_chat_app/widgets/chat_room/messages_list.dart';
import 'package:provider/provider.dart';

import '../models/my_user.dart';
import '../services/auth.dart';

class ChatRoomScreen extends StatefulWidget {
  final String chatRoomID;
  const ChatRoomScreen({Key? key, required this.chatRoomID}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController chatController = TextEditingController();
  String get message => chatController.text;
  ScrollController listScrollController = ScrollController();
  late ChatProvider _chatProvider;
  List<MessageDTO> messages = [];
  String get chatRoomID => widget.chatRoomID;
  int _limit = 20;
  final int _limitIncrement = 20;
  List<QueryDocumentSnapshot> listMessage = [];
  bool isLoadingMoreMessages = false;

  @override
  void initState() {
    super.initState();
    // chatController.addListener(() {
    //   setState(() {});
    // });
    _chatProvider = context.read<ChatProvider>();
    listScrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange &&
        _limit <= listMessage.length) {
      debugPrint("scroll");
      setState(() {
        _limit += _limitIncrement;
        isLoadingMoreMessages = true;
        // messages = [];
      });
    } else if (isLoadingMoreMessages) {
      setState(() {
        isLoadingMoreMessages = false;
        // messages = [];
      });
    }
  }

  MyUser getPeer(DocumentSnapshot chatRoom) {
    MyUser peer = MyUser.create(name: "", email: "");
    Map<String, dynamic> users =
        Map<String, dynamic>.from(chatRoom.get("users"));
    debugPrint("users $users");
    users.forEach(((uid, user) {
      if (uid != AuthService().getUserId()) {
        peer = MyUser(
            avatar: user['avatar'] ?? "",
            email: user['email'] ?? "",
            name: user['name'] ?? "",
            uid: user['uid'] ?? "");
      }
    }));
    return peer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: _chatProvider.getChatRoom(widget.chatRoomID),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                MyUser peer = getPeer(snapshot.data!);
                return Column(
                  children: [
                    // Goback button, Title
                    Row(
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(40, 40),
                                alignment: Alignment.center),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.chevron_left)),
                        Text(
                          peer.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: UIConstant.fontNameTitle),
                        )
                      ],
                    ),
                    isLoadingMoreMessages
                        ? const Text("loading...")
                        : const SizedBox(),
                    StreamBuilder(
                        stream: _chatProvider.getMessageStream(
                            widget.chatRoomID, _limit),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          List<MessageDTO> _messages = [];

                          if (snapshot.hasData) {
                            listMessage = snapshot.data!.docs;
                            for (var i in snapshot.data!.docs) {
                              MessageDTO message =
                                  MessageDTO.convertFromSnapshot(i);
                              _messages.add(message);
                            }
                          }
                          return MessagesList(
                              listScrollController: listScrollController,
                              messagesList: _messages);
                        }),
                    // Message text field
                    MessageField(
                      chatController: chatController,
                      handleSendMessage: handleSendMessage,
                    )
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: UIConstant.primary,
                  ),
                );
              }
            }),
      ),
    );
  }

  void handleSendMessage(MessageDTO newMessage) {
    _chatProvider.sendMessage(chatRoomID, newMessage);
    chatController.text = "";
  }
}
