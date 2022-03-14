import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/home_screen.dart';
import 'package:flutter_chat_app/screens/signin_screen.dart';
import 'package:flutter_chat_app/screens/signup_screen.dart';

import 'constants/ui_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: UIConstant.createMaterialColor(UIConstant.primary),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/signin": (context) => const SignInScreen(),
        "/signup": (context) => const SignUpScreen(),
        "/home": (context) => const HomeScreen()
      },
      home: const HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
