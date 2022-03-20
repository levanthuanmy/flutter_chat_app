import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/auth_button.dart';
import 'package:flutter_chat_app/common/custom_input_field.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/models/my_user.dart';
import 'package:flutter_chat_app/services/auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController mailController,
      passwordController,
      confirmPasswordController;

  final AuthService _authService = AuthService();

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
    confirmPasswordController = TextEditingController()
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
    confirmPasswordController.dispose();
    super.dispose();
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
              const SizedBox(
                height: 16,
              ),
              CustomInputField(
                controller: confirmPasswordController,
                hintText: "Confirm password",
                obscureText: true,
                suffixIcon: const Icon(Icons.lock_open),
              ),
              const SizedBox(
                height: 16,
              ),
              AuthButton(
                  buttonText: "Sign Up",
                  onPressed: () async {
                    MyUser? res = await _authService.register(
                        mailController.text, passwordController.text);
                    if (res != null) {
                      print('Signed up success: ${res.id}');
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signin");
                    },
                    child: const Text("Login"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
