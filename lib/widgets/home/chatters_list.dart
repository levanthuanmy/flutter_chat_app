import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/home/chatter_card.dart';

class ChatterList extends StatelessWidget {
  var chatterList = [false, true, true, false, true, false, true];
  ChatterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          children: chatterList
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ChatterCard(
                      isRead: e,
                    ),
                  ))
              .toList()),
    );
  }
}
