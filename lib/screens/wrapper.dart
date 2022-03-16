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
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return AppContainer();
    }
  }
}
