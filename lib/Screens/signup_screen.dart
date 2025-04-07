import 'package:flutter/material.dart';
import 'package:nike/Components/button.dart';
import 'package:nike/Components/text_fields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'images/logo.png',
              width: 150,
              height: 150,
            ),
            const Text(
              'Signup',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomInputField(inputText: 'Full Name', iconData: Icons.person),
            const SizedBox(
              height: 10,
            ),
            CustomInputField(
                inputText: 'Email Address', iconData: Icons.email_outlined),
            const SizedBox(
              height: 10,
            ),
            CustomInputField(
              inputText: 'Password',
              iconData: Icons.lock_outline_rounded,
              obsecuretext: true,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInputField(
                inputText: 'Confirm Password',
                iconData: Icons.lock_outline_rounded,
                obsecuretext: true),
            const SizedBox(
              height: 80,
            ),
            Button(text: 'Signup', onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
