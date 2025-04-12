import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/Components/button.dart';
import 'package:nike/Components/text_fields.dart';
import 'package:nike/Screens/login_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Forget Password',
          style: GoogleFonts.bebasNeue(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Enter your email address to reset your password',
                style: GoogleFonts.bebasNeue(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              CustomInputField(
                inputText: 'Email',
                iconData: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              Button(
                  text: 'Reset Password',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const LoginScreen()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
