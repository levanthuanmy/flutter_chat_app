import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/authenticate/signin_screen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignInScreen(),
    );
  }
}
