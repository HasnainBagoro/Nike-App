import 'package:flutter/material.dart';
import 'package:nike/Components/button.dart';
import 'package:nike/Components/text_fields.dart';
import 'package:nike/Screens/forget_password.dart';
import 'package:nike/Screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  width: 150,
                  height: 150,
                ),
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 100),
                CustomInputField(
                    inputText: 'Username or Email',
                    iconData: Icons.email_outlined),
                const SizedBox(height: 12),
                CustomInputField(
                    inputText: 'Password',
                    iconData: Icons.lock_outline,
                    obsecuretext: true),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (c) => ForgetPasswordScreen()),
                      (route) => false,
                    );
                  },
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forget Password?')),
                ),
                const SizedBox(height: 40),
                Button(text: 'Login', onTap: () {}),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => SignUpScreen()));
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
