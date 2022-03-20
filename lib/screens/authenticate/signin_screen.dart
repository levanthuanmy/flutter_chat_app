import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/auth_button.dart';
import 'package:flutter_chat_app/common/custom_input_field.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/models/my_user.dart';
import 'package:flutter_chat_app/services/auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService();

  late TextEditingController mailController, passwordController;

  @override
  void initState() {
    mailController = TextEditingController()
      ..addListener(
        () {
          setState(() {});
        },
      );
    passwordController = TextEditingController()
      ..addListener(
        () {
          setState(() {});
        },
      );

    super.initState();
  }

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  double _getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double _getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              const SizedBox(
                height: 16,
              ),
              CustomInputField(
                controller: mailController,
                hintText: "Email",
                obscureText: false,
                suffixIcon: const Icon(Icons.alternate_email),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomInputField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
                suffixIcon: const Icon(Icons.lock_open),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password",
                          style: TextStyle(color: UIConstant.secondary),
                        )),
                    // TextButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       "Remember me",
                    //       style: TextStyle(color: UIConstant.secondary),
                    //     ))
                  ],
                ),
              ),
              AuthButton(
                buttonText: "Login",
                onPressed: () async {
                  MyUser? res = await _authService.signIn(
                      mailController.text, passwordController.text);
                  print("$mailController.text $passwordController.text");
                  if (res != null) print('Signed in success: ${res.id}');
                },
              ),
              AuthButton(
                buttonText: "Login Anonymous",
                onPressed: () async {
                  MyUser? res = await _authService.signInAnonymous();
                  if (res != null) {
                    print('Signed in as anonymous: ${res.id}');
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have account yet?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    child: const Text("Sign Up"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
