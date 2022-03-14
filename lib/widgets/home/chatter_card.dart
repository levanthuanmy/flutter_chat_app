import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';

class ChatterCard extends StatelessWidget {
  final bool isRead;
  const ChatterCard({Key? key, required this.isRead}) : super(key: key);

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
              height: 60,
              width: 60,
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
              width: 16,
            ),
            // Name and chat preview
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "John Dove",
                    style: TextStyle(
                      fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight:
                            isRead ? FontWeight.normal : FontWeight.bold,
                      ))
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("13:10",
                    style: TextStyle(
                      fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                    )),
                const SizedBox(
                  height: 8,
                ),
                isRead
                    ? const SizedBox()
                    : Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: UIConstant.primary, shape: BoxShape.circle),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
