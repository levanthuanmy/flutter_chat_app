import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';

class FriendCard extends StatelessWidget {
  final bool isOnline;
  const FriendCard({Key? key, required this.isOnline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          primary: UIConstant.black,
          textStyle: TextStyle(
            color: UIConstant.black,
          )),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avatar
            Container(
              height: 40,
              width: 40,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                "https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/7/11/narutossagemode-15944657133061535033027.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            // Name and chat preview
            const Expanded(
              child: Text(
                "John Dove",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
