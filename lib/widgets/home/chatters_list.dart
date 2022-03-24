import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/home/chatter_card.dart';

class ChatterList extends StatelessWidget {
  var chatterList = [false, true, true, false, true, false, true];
  ChatterList({Key? key}) : super(key: key);

  List<QueryDocumentSnapshot> listMessage = [];
  @override
  Widget build(BuildContext context) {
    return Expanded(child: StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return ListView(
            physics: const BouncingScrollPhysics(),
            children: chatterList
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ChatterCard(
                        isRead: e,
                      ),
                    ))
                .toList());
      },
    ));
  }
}
