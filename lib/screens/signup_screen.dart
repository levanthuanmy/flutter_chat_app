import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/auth_button.dart';
import 'package:flutter_chat_app/common/custom_input_field.dart';

import '../constants/ui_constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: UIConstant.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Sign Up',
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
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInputField(
                      controller: TextEditingController(),
                      hintText: "Confirm password",
                      obscureText: true,
                      suffixIcon: const Icon(Icons.lock_open),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthButton(buttonText: "Sign Up", onPressed: () {}),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/signin");
                            },
                            child: const Text("Login"))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
