import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/auth_button.dart';
import 'package:flutter_chat_app/common/custom_input_field.dart';

import '../constants/ui_constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
          color: UIConstant.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
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
                      const SizedBox(
                        height: 16,
                      ),
                      CustomInputField(
                        controller: TextEditingController(),
                        hintText: "Email",
                        obscureText: true,
                        suffixIcon: const Icon(Icons.alternate_email),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomInputField(
                        controller: TextEditingController(),
                        hintText: "Password",
                        obscureText: true,
                        suffixIcon: const Icon(Icons.lock_open),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
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
                      AuthButton(buttonText: "Login", onPressed: () {}),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have account yet?"),
                          TextButton(
                              onPressed: () {}, child: const Text("Sign Up"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
