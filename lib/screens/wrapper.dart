import 'package:flutter/material.dart';
import 'package:flutter_chat_app/main.dart';
import 'package:flutter_chat_app/models/my_user.dart';
import 'package:flutter_chat_app/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyUser? user = Provider.of<MyUser?>(context);
    print(user?.email);

    if (user == null || user.uid.isEmpty) {
      print("need auth");
      return const Authenticate();
    } else {
      print("auth success");
      return const AppContainer();
    }
  }
}
