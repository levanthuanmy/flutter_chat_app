import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/bottom_navigation.dart';
import 'package:flutter_chat_app/models/my_user.dart';
import 'package:flutter_chat_app/screens/authenticate/signin_screen.dart';
import 'package:flutter_chat_app/screens/authenticate/signup_screen.dart';
import 'package:flutter_chat_app/screens/friend_list_screen.dart';
import 'package:flutter_chat_app/screens/home_screen.dart';
import 'package:flutter_chat_app/screens/wrapper.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:provider/provider.dart';

import 'constants/ui_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
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
        home: Wrapper(),
      ),
      // FutureBuilder(
      //   future: Firebase.initializeApp(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasError) {
      //       debugPrint('[ERROR] ${snapshot.error.toString()}');
      //       return const Text('Something went wrong!');
      //     } else if (snapshot.connectionState == ConnectionState.done) {
      //       // return const AppContainer();
      //       return const Wrapper();
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // )),
    );
  }
}

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  int currentIndex = 0;
  static const List<Widget> _widgetOptions = [HomeScreen(), FriendListScreen()];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIConstant.white,
      body: _widgetOptions.elementAt(currentIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
