import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double height, width;
  const Avatar({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.network(
        "https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/7/11/narutossagemode-15944657133061535033027.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
