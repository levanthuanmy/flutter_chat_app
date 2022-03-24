import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/bottom_navigation.dart';
import 'package:flutter_chat_app/models/my_user.dart';
import 'package:flutter_chat_app/screens/authenticate/signin_screen.dart';
import 'package:flutter_chat_app/screens/authenticate/signup_screen.dart';
import 'package:flutter_chat_app/screens/friend_list_screen.dart';
import 'package:flutter_chat_app/screens/home_screen.dart';
import 'package:flutter_chat_app/screens/wrapper.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:flutter_chat_app/services/chat_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'constants/ui_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MultiProvider(
        providers: [
          Provider<ChatProvider>(
            create: (context) =>
                ChatProvider(firebaseFirestore: firebaseFirestore),
          )
        ],
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
          home: const Wrapper(),
        ),
      ),
    );
  }
}

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  DatabaseReference database = FirebaseDatabase.instance.ref();

  int currentIndex = 0;

  static const List<Widget> _widgetOptions = [HomeScreen(), FriendListScreen()];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MyUser? user = Provider.of<MyUser?>(context);
    final DatabaseReference userRef = database.child('/users/${user?.uid}');
    Future<DatabaseEvent> futureUserEvent = userRef.once();

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder(
      future: futureUserEvent,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          DatabaseEvent userEvent = snapshot.data;
          print(
            'extend user data from realtime database: ${snapshot.data.snapshot.value}',
          );

          return Scaffold(
            backgroundColor: UIConstant.white,
            body: _widgetOptions.elementAt(currentIndex),
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: currentIndex,
              onTap: _onItemTapped,
            ),
          );
        }
        if (snapshot.hasError) {
          return const Text("Error");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
