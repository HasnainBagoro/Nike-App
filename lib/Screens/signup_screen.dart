import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/Components/button.dart';
import 'package:nike/Components/text_fields.dart';
import 'package:nike/Screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Text(
              'Signup',
              style: GoogleFonts.bebasNeue(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
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
            Button(
                text: 'Signup',
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      (MaterialPageRoute(builder: (c) => LoginScreen())),
                      (route) => false);
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style:
                      GoogleFonts.bebasNeue(fontSize: 18, color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 18,
                      color: Colors.black,
                    ),
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
