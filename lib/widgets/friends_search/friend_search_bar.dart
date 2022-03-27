import 'package:flutter/material.dart';

import '../../constants/ui_constant.dart';

class FriendSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function onSearch;
  const FriendSearchBar(
      {Key? key, required this.controller, required this.onSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UIConstant.primary,
      height: 56,
      padding: EdgeInsets.only(top: 8, bottom: 8, right: 16),
      child: Row(
        children: [
          TextButton(
              style: TextButton.styleFrom(
                  primary: UIConstant.white,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(40, 40),
                  alignment: Alignment.center),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left,
                color: UIConstant.white,
              )),
          Expanded(
            child: TextField(
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) {
                onSearch();
              },
              autofocus: true,
              decoration: InputDecoration(
                // hintStyle: TextStyle(color: UIConstant.secondary),
                contentPadding: EdgeInsets.zero,

                filled: true,
                fillColor: UIConstant.white,
                suffixIcon: controller.text.isNotEmpty
                    ? TextButton(
                        onPressed: () {
                          controller.text = "";
                        },
                        child: const Icon(
                          Icons.highlight_remove,
                        ),
                      )
                    : null,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
