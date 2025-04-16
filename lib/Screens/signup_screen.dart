import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/Components/button.dart';
import 'package:nike/Components/text_fields.dart';
import 'package:nike/Models/user_model.dart';
import 'package:nike/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void signUpUser() async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    setState(() {
      isLoading = true;
    });

    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        fullName.isEmpty) {
      showSnackBar('Please fill all fields');
      return;
    }

    if (password != confirmPassword) {
      showSnackBar('Passwords do not match');
      return;
    }

    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final String uid = userCredential.user!.uid;

      UserModel userData = UserModel(username: 'username', email: email);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(userData.toMap());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup Successful")),
      );

      User? user = userCredential.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (c) => LoginScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message ?? 'Signup failed');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
              strokeCap: StrokeCap.round,
              color: Colors.black,
              strokeWidth: 10,
            ))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
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
                    const SizedBox(height: 50),
                    CustomInputField(
                      inputText: 'Full Name',
                      iconData: Icons.person_outline_rounded,
                      controller: fullNameController, // optional if not used
                    ),
                    const SizedBox(height: 10),
                    CustomInputField(
                      inputText: 'Email Address',
                      iconData: Icons.email_outlined,
                      controller: emailController,
                    ),
                    const SizedBox(height: 10),
                    CustomInputField(
                      inputText: 'Password',
                      iconData: Icons.lock_outline_rounded,
                      obsecuretext: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 10),
                    CustomInputField(
                      inputText: 'Confirm Password',
                      iconData: Icons.lock_outline_rounded,
                      obsecuretext: true,
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(height: 80),
                    Button(
                      text: 'Signup',
                      onTap: signUpUser,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 18, color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => LoginScreen()));
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
              ),
            ),
    );
  }
}
