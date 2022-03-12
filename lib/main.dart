import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double _getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: _getScreenWidth(context),
        color: UIConstant.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _getScreenWidth(context),
              height: _getScreenHeight(context) * 0.4,
            ),
            Container(
              width: _getScreenWidth(context),
              height: _getScreenHeight(context) * 0.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: UIConstant.fontSize24,
                            fontWeight: UIConstant.fontWeightMedium,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          suffixIcon: const Icon(Icons.alternate_email),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: UIConstant.secondary),
                          suffixIcon: const Icon(Icons.lock_open),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UIConstant {
  static Color primary = const Color.fromRGBO(74, 98, 224, 1);
  static Color secondary = const Color.fromRGBO(110, 110, 110, 1);
  static Color tertiary =
      const Color.fromRGBO(229, 229, 229, 1); //disable background color

  static double fontSize12 = 12;
  static double fontSize14 = 14;
  static double fontSize16 = 16;
  static double fontSize18 = 18;
  static double fontSize24 = 24;
  static double fontSize32 = 32;

  static FontWeight fontWeightLight = FontWeight.w300;
  static FontWeight fontWeightNormal = FontWeight.w400;
  static FontWeight fontWeightMedium = FontWeight.w500;
  static FontWeight fontWeightSemiBold = FontWeight.w600;
  static FontWeight fontWeightBold = FontWeight.w700;

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
