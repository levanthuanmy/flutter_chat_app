import 'package:flutter/material.dart';

import '../constants/ui_constant.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  const SearchBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: UIConstant.white,
      style: TextStyle(color: UIConstant.white),
      controller: controller,
      decoration: InputDecoration(
        // hintStyle: TextStyle(color: UIConstant.secondary),
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: UIConstant.primary,
        suffixIcon: TextButton(
          onPressed: () {
            debugPrint("Search press");
          },
          child: Icon(
            Icons.add,
            color: UIConstant.white,
          ),
        ),
        prefixIcon: Icon(Icons.search, color: UIConstant.white),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(UIConstant.borderRadius),
        ),
      ),
    );
  }
}
