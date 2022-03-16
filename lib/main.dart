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
          home: FutureBuilder(
            future: _fbApp,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                debugPrint('[ERROR] ${snapshot.error.toString()}');
                return const Text('Something went wrong!');
              } else if (snapshot.hasData) {
                // return const AppContainer();
                return const Wrapper();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
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
        ));
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }
