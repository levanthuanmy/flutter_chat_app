import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/chat_room_screen.dart';
import 'package:flutter_chat_app/screens/friend_list_screen.dart';
import 'package:flutter_chat_app/screens/home_screen.dart';
import 'package:flutter_chat_app/screens/signin_screen.dart';
import 'package:flutter_chat_app/screens/signup_screen.dart';

import 'constants/ui_constant.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

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
          "/home": (context) => const HomeScreen(),
          "/friends": (context) => const FriendListScreen()
        },
        // home: const HomeScreen(),
        home: FutureBuilder(
          future: _fbApp,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              print('[ERROR] ${snapshot.error.toString()}');
              return Text('Something went wrong!');
            } else if (snapshot.hasData) {
              return ChatRoomScreen();
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ));
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
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('hello')],
      ),
    ));
  }
}
